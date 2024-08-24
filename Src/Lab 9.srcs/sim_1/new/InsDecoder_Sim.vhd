----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.06.2023 03:00:55
-- Design Name: 
-- Module Name: InsDecoder_Sim - Behavioral
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

entity InsDecoder_Sim is
--  Port ( );
end InsDecoder_Sim;

architecture Behavioral of InsDecoder_Sim is

Component Instruction_Decoder is
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

SIGNAL InsBus: STD_LOGIC_VECTOR (11 downto 0);
SIGNAL RegCheck, ImmediateValue: STD_LOGIC_VECTOR (3 downto 0);
SIGNAL Jump_Flag, AddSubSel, LoadSel: STD_LOGIC;
SIGNAL RegSel0, RegSel1, RegEnable, JumpAddress: STD_LOGIC_VECTOR (2 downto 0);

begin
UUT: Instruction_Decoder PORT MAP 
    (InsBus => InsBus, 
    RegCheck => RegCheck, 
    Jump_Flag => Jump_Flag, 
    JumpAddress => JumpAddress, 
    AddSubSel => AddSubSel, 
    RegSel0 => RegSel0, 
    RegSel1 => RegSel1, 
    ImmediateValue => ImmediateValue, 
    LoadSel => LoadSel, 
    RegEnable => RegEnable);

process
begin
    RegCheck<="0111";
    InsBus <= "000011100110";
    WAIT FOR 100 ns;
    InsBus <= "111100011011";
    WAIT FOR 100 ns;
    InsBus <= "010011000011";
    WAIT FOR 100 ns;
    InsBus <= "000011100100";
    WAIT FOR 100 ns;
    InsBus <= "110000100111";
    WAIT FOR 100 ns;
    InsBus <= "010011000011";
    WAIT FOR 100 ns;
    RegCheck <= "1001";
    InsBus <= "001100001001";
    WAIT;
end process;

end Behavioral;
