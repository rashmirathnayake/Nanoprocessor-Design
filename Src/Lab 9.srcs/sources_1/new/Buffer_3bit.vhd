----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.06.2023 19:32:53
-- Design Name: 
-- Module Name: RegisterBank - Behavioral
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

entity RegisterBank is
    Port ( RegEnable : in STD_LOGIC_VECTOR (2 downto 0);          -- From Instruction Decoder
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Input : in STD_LOGIC_VECTOR (3 downto 0);              -- From Mux
           Reg0 : out STD_LOGIC_VECTOR (3 downto 0);              -- To 8-way 4-bit 