----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.06.2023 11:04:09
-- Design Name: 
-- Module Name: ProcessorSim - Behavioral
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

entity ProcessorSim is
--  Port ( );
end ProcessorSim;

architecture Behavioral of ProcessorSim is

Component Processor
    Port ( Clock : in STD_LOGIC;
           Reset : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (3 downto 0);
           SevenSeg : out STD_LOGIC_VECTOR (6 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Carry : out STD_LOGIC);
end Component;

SIGNAL Clock, Reset, Overflow, Zero, Carry : STD_LOGIC;
SIGNAL LED : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL SevenSeg : STD_LOGIC_VECTOR (6 downto 0);

begin
UUT : Processor 
PORT MAP ( Clock => Clock, 
           Reset => Reset, 
           LED => LED, 
           SevenSeg => SevenSeg, 
           Overflow => OverFlow, 
           Zero => Zero, 
           Carry => Carry);

process
begin
    Clock <= '0';
    Wait for 5ns;
    Clock <= '1';
    Wait for 5ns;
end process;

process
begin
    Reset <= '1';
    Wait for 100ns;
    Reset <= '0';
    Wait;
end process;

end Behavioral;
