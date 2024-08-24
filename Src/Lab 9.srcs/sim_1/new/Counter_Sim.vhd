----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Kumarasekara G.K.
-- 
-- Create Date: 23.05.2023 16:07:29
-- Design Name: 
-- Module Name: Counter_Sim - Behavioral
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

entity Counter_Sim is
--  Port ( );
end Counter_Sim;

architecture Behavioral of Counter_Sim is
COMPONENT Counter
    port (D : in STD_LOGIC_VECTOR (2 downto 0);
          Res : in STD_LOGIC :='0';
          Clk : in STD_LOGIC :='0';
          Q : out STD_LOGIC_VECTOR (2 downto 0));
END COMPONENT;

SIGNAL Res, Clk: std_logic;
SIGNAL Q,D: std_logic_vector (2 downto 0);

begin
UUT: Counter PORT MAP(
    D => D,
    Res => Res,
    Clk => Clk,
    Q => Q);
   
process 
--Clk_process: process
begin 
    Clk <= '0';
    wait for 50 ns;
    Clk <= '1';
    wait for 50 ns;    
end process;

process
begin
--Q(0) <= '0';
Res <= '1';
wait for 100ns;
Res <= '0';

D <="001";
wait for 50 ns;
D <= "100";
wait for 50 ns;
D <= "101";
wait for 50 ns;
D <= "110";
wait for 50 ns;
D <= "000";
wait for 50 ns;
D <="001";
wait for 50 ns;
D <= "100";
wait for 50 ns;
D <= "101";
wait for 50 ns;
D <= "110";
wait for 50 ns;
D <= "000";
wait for 50 ns;
D <="001";
wait for 50 ns;
D <= "100";
wait for 50 ns;
D <= "101";
wait for 50 ns;
D <= "110";
wait for 50 ns;
D <= "000";
wait for 50 ns;
D <="001";
wait for 50 ns;
D <= "100";
wait for 50 ns;
D <= "101";
wait for 50 ns;
D <= "110";
wait for 50 ns;
D <= "000";

Res <= '1';
wait for 100ns;
Res <= '0';
wait;

end process;

end Behavioral;
