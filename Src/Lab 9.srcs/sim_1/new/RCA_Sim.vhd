----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Kumarasekara G.K.
-- 
-- Create Date: 17.05.2023 19:05:17
-- Design Name: 
-- Module Name: RCA_Sim - Behavioral
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

entity RCA_Sim is
--  Port ( );
end RCA_Sim;

architecture Behavioral of RCA_Sim is
COMPONENT RCA_3
    PORT( A,B : IN STD_LOGIC_VECTOR (2 downto 0);
          C_in : IN STD_LOGIC;
          C_out : OUT STD_LOGIC;
          S : OUT STD_LOGIC_VECTOR (2 downto 0));
END COMPONENT;

SIGNAL A,B,S : std_logic_vector (2 downto 0) ;
SIGNAL C_in, C_out : std_logic;
--SIGNAL C_out,S0,S1,S2 : std_logic;

begin
UUT: RCA_3 PORT MAP(
        A => A,
        B => B,
        C_in => C_in,
        C_out => C_out,
        S => S
        );

process
        begin
                 A(0) <= '1';
                 A(1) <= '1';
                 A(2) <= '1';
                 B(0) <= '0';        --111 + 010
                 B(1) <= '1';
                 B(2) <= '0';
                 C_in <= '0';
                
                 WAIT FOR 100 ns; 
                 A(0) <= '0';
                 A(1) <= '0';
                 B(0) <= '1';        --101 +100
                 B(1) <= '0';
                 B(2) <= '1';
                
                 WAIT FOR 100 ns; 
                  A(1) <= '1';
                  A(2) <= '0';      -- 011 + 010
                  B(1) <= '1';
                  B(2) <= '0';
                
                 WAIT FOR 100 ns;                 
                  A(1) <= '0';       -- 001 + 110
                  B(2) <= '1';
              
                WAIT FOR 100 ns; 
                A(0) <= '0';
                A(2) <= '1';      -- 100 + 100
                B(1) <= '0';
                                    

                                    
                 WAIT FOR 100 ns; 
                  A(0) <= '1';
                  A(1) <= '1';                
                  B(0) <= '1';       -- 111 + 111
                  B(1) <= '1';

                
                 WAIT FOR 100 ns; 
                 A(0) <= '0';
                 A(2) <= '0';     -- 010 + 101
                 B(1) <= '0';

                
                 WAIT FOR 100 ns; 
                 A(0) <= '1';
                 A(2) <= '1';
                 B(2) <= '0';     --111 + 001
                
                 WAIT;
end process;
 
end Behavioral;
