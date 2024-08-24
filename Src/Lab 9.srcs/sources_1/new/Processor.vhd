----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.06.2023 20:23:19
-- Design Name: 
-- Module Name: Processor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Processor is
    Port ( Clock : in STD_LOGIC;
           Reset : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (3 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0);
           SevenSeg : out STD_LOGIC_VECTOR (6 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Carry : out STD_LOGIC);
end Processor;

architecture Behavioral of Processor is

Component Mux_8way_4bit
Port ( RegSel : in STD_LOGIC_VECTOR (2 downto 0);   
       Reg0 : in STD_LOGIC_VECTOR (3 downto 0);
       Reg1 : in STD_LOGIC_VECTOR (3 downto 0);
       Reg2 : in STD_LOGIC_VECTOR (3 downto 0);
       Reg3 : in STD_LOGIC_VECTOR (3 downto 0);
       Reg4 : in STD_LOGIC_VECTOR (3 downto 0);
       Reg5 : in STD_LOGIC_VECTOR (3 downto 0);
       Reg6 : in STD_LOGIC_VECTOR (3 downto 0);
       Reg7 : in STD_LOGIC_VECTOR (3 downto 0);
       MuxOut : out STD_LOGIC_VECTOR (3 downto 0)); 
end Component; 

Component Mux_2way_4bit 
    Port ( LoadSel : in STD_LOGIC;                          
           ImmediateVal : in STD_LOGIC_VECTOR (3 downto 0); 
           AddSubOut : in STD_LOGIC_VECTOR (3 downto 0);   
           Result : out STD_LOGIC_VECTOR (3 downto 0));    
end Component;

Component Mux_2way_3bit 
    Port ( Jump_Flag : in STD_LOGIC;                                  
           Jump_Address : in STD_LOGIC_VECTOR (2 downto 0);   
           Incremented_Address : in STD_LOGIC_VECTOR (2 downto 0);  
           Output_Address : out STD_LOGIC_VECTOR (2 downto 0));    
end Component;

Component RCA_3 
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0);
           C_out : out STD_LOGIC);
end Component;

Component Adder_Subtractor 
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           AddSubSel : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           C_out : out STD_LOGIC;
           Zero : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end Component;

Component ProgramROM 
    Port ( MemorySel : in STD_LOGIC_VECTOR (2 downto 0);
           InsBus : out STD_LOGIC_VECTOR (11 downto 0));
end Component;

Component Counter 
    Port ( --Dir : in STD_LOGIC;
           --Counter_input : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end Component;

Component Instruction_Decoder 
    Port ( InsBus : in STD_LOGIC_VECTOR (11 downto 0);
           RegCheck : in STD_LOGIC_VECTOR (3 downto 0);
           Jump_Flag : out STD_LOGIC;
           JumpAddress : out STD_LOGIC_VECTOR (2 downto 0);
           AddSubSel : out STD_LOGIC;
           RegSel0 : out STD_LOGIC_VECTOR (2 downto 0);
           RegSel1 : out STD_LOGIC_VECTOR (2 downto 0);
           ImmediateValue : out STD_LOGIC_VECTOR (3 downto 0);
           LoadSel : out STD_LOGIC;
           RegEnable : out STD_LOGIC_VECTOR (2 downto 0));
end Component;

Component RegisterBank 
    Port ( RegEnable : in STD_LOGIC_VECTOR (2 downto 0);          
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Input : in STD_LOGIC_VECTOR (3 downto 0);              
           Reg0 : out STD_LOGIC_VECTOR (3 downto 0);              
           Reg1 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg2 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg3 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg4 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg5 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg6 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg7 : out STD_LOGIC_VECTOR (3 downto 0));
end Component;

--Component Display 
--    Port ( Reg7_Value : in STD_LOGIC_VECTOR (3 downto 0);
--           SevenSeg_Input : out STD_LOGIC_VECTOR (6 downto 0));
--         --  Negative : out STD_LOGIC);
--end Component;

Component LUT_16_7 
Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
       data : out STD_LOGIC_VECTOR (6 downto 0));
end Component;



Component Slow_Clk 
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end Component;


SIGNAL Instruction : STD_LOGIC_VECTOR (11 downto 0);
SIGNAL AddSubSel, LoadSel, ClockOut, Jump_Flag, Cout : STD_LOGIC;
SIGNAL Mux_1_Out, Mux_2_Out, AddSubOut, ImmediateVal, RegSel, BankInput : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL Reg0, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, Reg7 : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL RegSel_1, RegSel_2, MemorySel, Output_Address, JumpAddress, RegEnable, AdderOut : STD_LOGIC_VECTOR (2 downto 0);



begin
Mux_8way_4bit_1: Mux_8way_4bit
Port Map ( RegSel => RegSel_1, 
           Reg0 => Reg0, 
           Reg1 => Reg1, 
           Reg2 => Reg2, 
           Reg3 => Reg3, 
           Reg4 => Reg4, 
           Reg5 => Reg5, 
           Reg6 => Reg6, 
           Reg7 => Reg7, 
           MuxOut => Mux_1_Out);


Mux_8way_4bit_2: Mux_8way_4bit
Port Map (  RegSel => RegSel_2,
            Reg0 => Reg0,
            Reg1 => Reg1,
            Reg2 => Reg2,
            Reg3 => Reg3,
            Reg4 => Reg4,
            Reg5 => Reg5,
            Reg6 => Reg6,
            Reg7 => Reg7,
            MuxOut => Mux_2_Out);

Mux_2way_4bit_0: Mux_2way_4bit 
Port Map (  LoadSel => LoadSel,
            ImmediateVal => ImmediateVal,
            AddSubOut => AddSubOut,
            Result => BankInput);

Mux_2way_3bit_0: Mux_2way_3bit
Port Map (  Jump_Flag => Jump_Flag,            
            Jump_Address => JumpAddress,
            Incremented_Address => AdderOut,
            Output_Address => Output_Address);

Adder_3bit: RCA_3
Port Map (  A => MemorySel,
            B => "001",
            C_in => '0',
            S => AdderOut,
            C_out => Cout);

AddSubUnit: Adder_Subtractor
Port Map (  A => Mux_2_Out,
            B => Mux_1_Out,
            AddSubSel => AddSubSel,
            Overflow => Overflow,
            C_out => Carry,
            Zero => Zero,
            S => AddSubOut);

ROM: ProgramROM
Port Map (  MemorySel => MemorySel,
            InsBus => Instruction);

ProgramCounter: Counter
Port Map (  D => Output_Address,
            Res => Reset,
            Clk => ClockOut,
            Q => MemorySel);

InsDecoder: Instruction_Decoder
Port Map (  InsBus => Instruction,
            RegCheck => Mux_1_Out,
            Jump_Flag => Jump_Flag,
            JumpAddress => JumpAddress,
            AddSubSel => AddSubSel,
            RegSel0 => RegSel_1,
            RegSel1 => RegSel_2,
            ImmediateValue => ImmediateVal,
            LoadSel => LoadSel,
            RegEnable => RegEnable);

RegBank: RegisterBank
Port Map (  RegEnable => RegEnable,
            Clk => ClockOut,
            Res => Reset,
            Input => BankInput,
            Reg0 => Reg0,
            Reg1 => Reg1,
            Reg2 => Reg2,
            Reg3 => Reg3,
            Reg4 => Reg4,
            Reg5 => Reg5,
            Reg6 => Reg6,
            Reg7 => Reg7);

--Display_0: Display
--Port Map (  Reg7_Value => Reg7,
 --           SevenSeg_Input => SevenSeg);

LookUpTable: LUT_16_7
Port Map (  address => Reg7,
            data => SevenSeg);

SlowClock: Slow_Clk
Port Map (  Clk_in => Clock,
            Clk_out => ClockOut);

LED <= Reg7;
Anode <= "1110";

end Behavioral;