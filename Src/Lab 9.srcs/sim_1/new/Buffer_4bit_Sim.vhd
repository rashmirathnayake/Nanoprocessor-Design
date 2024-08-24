----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.06.2023 11:38:13
-- Design Name: 
-- Module Name: Buffer_4bit_Sim - Behavioral
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

entity Buffer_4bit_Sim is
--  Port ( );
end Buffer_4bit_Sim;

architecture Behavioral of Buffer_4bit_Sim is
Component Buffer_4bit
 Port ( Input : in STD_LOGIC_VECTOR (3 downto 0);
        Enable : in STD_LOGIC;
        Output : out STD_LOGIC_VECTOR (3 downto 0));
end Component;

SIGNAL Input, Output : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL Enable : STD_LOGIC;

begin
UUT : Buffer_4bit Port Map
(Input => Input,
Output => Output,
Enable => Enable);

process
begin

Input <= "1011";
Enable <= '0';
wait for 100 ns;

Enable <= '1';
wait for 100 ns;
Input <= "1111";

wait;
end process;

end Behavioral;
