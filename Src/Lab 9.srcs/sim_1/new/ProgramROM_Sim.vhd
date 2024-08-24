----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.06.2023 12:14:16
-- Design Name: 
-- Module Name: ProgramROM_Sim - Behavioral
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

entity ProgramROM_Sim is
--  Port ( );
end ProgramROM_Sim;

architecture Behavioral of ProgramROM_Sim is

Component ProgramROM is
    Port ( MemorySel : in STD_LOGIC_VECTOR (2 downto 0);
           InsBus : out STD_LOGIC_VECTOR (11 downto 0));
end Component;

SIGNAL MemorySel : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL InsBus : STD_LOGIC_VECTOR (11 downto 0);

begin
UUT: ProgramROM
Port Map ( MemorySel => MemorySel,
           InsBus => InsBus);

process
begin

MemorySel <= "111";
Wait for 100ns;

MemorySel <= "100";
Wait for 100ns;

MemorySel <= "001";
Wait for 100ns;

MemorySel <= "110";
Wait for 100ns;

MemorySel <= "000";
Wait for 100ns;

MemorySel <= "111";
Wait for 100ns;

MemorySel <= "011";
Wait for 100ns;

MemorySel <= "100";
Wait;

end process;


end Behavioral;
