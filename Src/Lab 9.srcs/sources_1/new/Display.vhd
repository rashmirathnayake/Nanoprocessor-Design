----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.06.2023 19:11:44
-- Design Name: 
-- Module Name: Display - Behavioral
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

entity Display is
    Port ( Reg7_Value : in STD_LOGIC_VECTOR (3 downto 0);
           SevenSeg_Input : out STD_LOGIC_VECTOR (6 downto 0));
         --  Negative : out STD_LOGIC);
end Display;

architecture Behavioral of Display is

Component LUT_16_7
Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
       data : out STD_LOGIC_VECTOR (6 downto 0));
end Component;

begin
LookupTable: LUT_16_7 
Port Map(
    address => Reg7_Value, 
    data => SevenSeg_Input);

--Negative <= Reg7_Value(3);
end Behavioral;
