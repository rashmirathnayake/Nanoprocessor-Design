----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.06.2023 12:29:35
-- Design Name: 
-- Module Name: Mux_2way_3bit_Sim - Behavioral
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

entity Mux_2way_3bit_Sim is
--  Port ( );
end Mux_2way_3bit_Sim;

architecture Behavioral of Mux_2way_3bit_Sim is

Component Mux_2way_3bit is
    Port ( Jump_Flag : in STD_LOGIC;                    
           Jump_Address : in STD_LOGIC_VECTOR (2 downto 0);   
           Incremented_Address : in STD_LOGIC_VECTOR (2 downto 0); 
           Output_Address : out STD_LOGIC_VECTOR (2 downto 0));    
end Component;

SIGNAL Jump_Flag : STD_LOGIC;                    
SIGNAL Jump_Address, Incremented_Address, Output_Address : STD_LOGIC_VECTOR (2 downto 0);   

begin
UUT : Mux_2way_3bit PORT MAP
(Jump_Flag => Jump_Flag,
Jump_Address => Jump_Address,
Incremented_Address => Incremented_Address,
Output_Address => Output_Address);

process
begin
Incremented_Address <= "111";
Jump_Address <= "101";
Jump_Flag <= '0';

wait for 100 ns;
Jump_Flag <= '1';
wait;

end process;
end Behavioral;
