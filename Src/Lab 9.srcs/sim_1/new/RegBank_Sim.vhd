----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.06.2023 11:07:15
-- Design Name: 
-- Module Name: RegBank_Sim - Behavioral
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

entity RegBank_Sim is
--  Port ( );
end RegBank_Sim;

architecture Behavioral of RegBank_Sim is

Component RegisterBank is
    Port ( RegEnable : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Input : in STD_LOGIC_VECTOR (3 downto 0);
           Reg0 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg1 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg2 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg3 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg4 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg5 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg6 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg7 : out STD_LOGIC_VECTOR (3 downto 0));
end Component;

SIGNAL RegEnable : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL Clk : STD_LOGIC  := '0';
SIGNAL Res : STD_LOGIC;
SIGNAL Input : STD_LOGIC_VECTOR (3 downto 0) := "0000";
SIGNAL Reg0, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, Reg7 : STD_LOGIC_VECTOR (3 downto 0);
          
begin
UUT: RegisterBank
PORT MAP ( RegEnable => RegEnable,
           Clk => Clk,
           Res => Res,
           Input => Input,
           Reg0 => Reg0,
           Reg1 => Reg1,
           Reg2 => Reg2,
           Reg3 => Reg3,
           Reg4 => Reg4,
           Reg5 => Reg5,
           Reg6 => Reg6,
           Reg7 => Reg7);
           
process 
begin
Clk<=not(Clk);
Wait for 20ns;
end process;

process begin
    Res <= '1';
    wait for 50ns;
    Res <= '0';
    
    Input <= "0100";
    RegEnable <= "110";
    wait for 100ns;
    
    RegEnable <= "000";
    Input <= "1110";
    wait for 100ns;
    
    Input <= "0000";
    RegEnable <= "111";
    wait for 100ns;
    
    Input <= "0011";
    RegEnable <= "001";
    Wait for 100ns;
    
    Res <= '1';
    Wait for 50ns;
    Res <= '0';
    Wait;
end process;

end Behavioral;
