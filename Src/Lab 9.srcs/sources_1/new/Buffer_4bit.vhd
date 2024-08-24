----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.06.2023 11:36:54
-- Design Name: 
-- Module Name: Buffer_4bit - Behavioral
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

entity Buffer_4bit is
    Port ( Input : in STD_LOGIC_VECTOR (3 downto 0);
           Enable : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (3 downto 0));
end Buffer_4bit;

architecture Behavioral of Buffer_4bit is

begin
Output <= Input when (Enable = '1') else "ZZZZ";

end Behavioral;
