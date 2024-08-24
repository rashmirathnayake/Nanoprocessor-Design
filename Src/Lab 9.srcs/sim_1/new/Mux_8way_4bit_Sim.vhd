----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.06.2023 19:11:51
-- Design Name: 
-- Module Name: Mux_8way_4bit_Sim - Behavioral
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

entity Mux_8way_4bit_Sim is
--  Port ( );
end Mux_8way_4bit_Sim;

architecture Behavioral of Mux_8way_4bit_Sim is

Component Mux_8way_4bit is
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

SIGNAL RegSel : STD_LOGIC_VECTOR (2 downto 0); 
SIGNAL Reg0, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, Reg7, MuxOut : STD_LOGIC_VECTOR (3 downto 0);
           
begin
UUT : Mux_8way_4bit PORT MAP
    (RegSel => RegSel,
     Reg0 => Reg0,
     Reg1 => Reg1,
     Reg2 => Reg2,
     Reg3 => Reg3,
     Reg4 => Reg4,
     Reg5 => Reg5, 
     Reg6 => Reg6,  
     Reg7 => Reg7, 
     MuxOut => MuxOut);
     
process
begin

Reg0 <= "0111";
Reg1 <= "0110";
Reg2 <= "1110";
Reg3 <= "0110";
Reg4 <= "1100";
Reg5 <= "1111";
Reg6 <= "0100";
Reg7 <= "1001";

RegSel <= "111";
WAIT FOR 100ns;
RegSel <= "100";
WAIT FOR 100ns;
RegSel <= "001";
WAIT FOR 100ns;
RegSel <= "110";
WAIT FOR 100ns;
RegSel <= "000";
WAIT FOR 100ns;
RegSel <= "101";
WAIT FOR 100ns;
RegSel <= "110";
WAIT FOR 100ns;
RegSel <= "111";
WAIT;

end process;

end Behavioral;
