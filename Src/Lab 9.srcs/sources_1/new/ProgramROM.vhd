----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.06.2023 11:57:38
-- Design Name: 
-- Module Name: ProgramROM - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ProgramROM is
    Port ( MemorySel : in STD_LOGIC_VECTOR (2 downto 0);
           InsBus : out STD_LOGIC_VECTOR (11 downto 0));
end ProgramROM;

architecture Behavioral of ProgramROM is
type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);

SIGNAL program_rom : rom_type := (
                        "100010000011", -- MOVI R1, 3
                        "100100000001", -- MOVI R2, 1
                        "010100000000", -- NEG R2
                        "001110010000", -- ADD R7, R1
                        "000010100000", -- ADD R1, R2
                        "110010000111", -- JZR R1,7
                        "110000000011", -- JZR R0,3
                        "110000000111" -- JZR R0,7);  
                        );
begin

InsBus <= program_rom(to_integer(unsigned(MemorySel)));

end Behavioral;
