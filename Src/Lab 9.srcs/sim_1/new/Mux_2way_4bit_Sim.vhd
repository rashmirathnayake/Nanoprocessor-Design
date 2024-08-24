----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.06.2023 18:05:30
-- Design Name: 
-- Module Name: Mux_2way_4bit_Sim - Behavioral
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

entity Mux_2way_4bit_Sim is
--  Port ( );
end Mux_2way_4bit_Sim;

architecture Behavioral of Mux_2way_4bit_Sim is

Component  Mux_2way_4bit is
    Port ( LoadSel : in STD_LOGIC;                          
           ImmediateVal : in STD_LOGIC_VECTOR (3 downto 0); 
           AddSubOut : in STD_LOGIC_VECTOR (3 downto 0);   
           Result : out STD_LOGIC_VECTOR (3 downto 0));    
end Component;

SIGNAL LoadSel : STD_LOGIC;                          
SIGNAL ImmediateVal, AddSubOut, Result  : STD_LOGIC_VECTOR (3 downto 0); 
               
begin
UUT : Mux_2way_4bit PORT MAP
(LoadSel => LoadSel,
ImmediateVal => ImmediateVal,
AddSubOut => AddSubOut,
Result => Result);

process
begin
AddSubOut <= "1110";
ImmediateVal <= "1001";
LoadSel <= '0';

wait for 100 ns;
LoadSel <= '1';
wait;

end process;
end Behavioral;
