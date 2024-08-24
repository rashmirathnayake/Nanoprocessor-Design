----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.05.2023 21:34:41
-- Design Name: 
-- Module Name: AddSub_Sim - Behavioral
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

entity AddSub_Sim is
--  Port ( );
end AddSub_Sim;

architecture Behavioral of AddSub_Sim is

COMPONENT Adder_Subtractor
    PORT( A,B : IN STD_LOGIC_VECTOR (3 downto 0);
          AddSubSel : IN STD_LOGIC;
          S : OUT STD_LOGIC_VECTOR (3 downto 0);
          C_out, Overflow, Zero : OUT STD_LOGIC);
END COMPONENT;

SIGNAL A, B, S : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL Overflow, AddSubSel, C_out, Zero : STD_LOGIC;

begin
UUT: Adder_Subtractor PORT MAP(
        A => A,
        B => B,
        AddSubSel => AddSubSel,
        C_out => C_out,
        S => S,
        Zero => Zero,
        Overflow => Overflow
        );

process
        begin
                 A(0) <= '0';       
                 A(1) <= '1';
                 A(2) <= '0';
                 A(3) <= '1';
                 B(0) <= '0';         -- 1010 - 1000
                 B(1) <= '0';
                 B(2) <= '0';
                 B(3) <= '1';
                 AddSubSel <= '1';
                
                 WAIT FOR 100 ns; 
                 A(0) <= '1';
                 A(1) <= '0';
                 A(2) <= '1';
                 A(3) <= '0';          -- 0101 + 1010
                 B(0) <= '0';
                 B(1) <= '1';
                 B(2) <= '0';
                 B(3) <= '1';                       
                 AddSubSel <= '0';
                
                -- There is a problem. There should not be a carry
                 WAIT FOR 100 ns;                  
                 A(1) <= '1';
                 A(2) <= '0';
                 A(3) <= '1';          -- 1011 - 0101
                 B(1) <= '0';
                 B(2) <= '1';     
                 AddSubSel <= '1';
                  
                 WAIT FOR 100 ns;                 
                 A(2) <= '1';          -- 1111 + 0111
                 B(1) <= '1';
                 AddSubSel <= '0';
     
                -- There is a problem. There should not be a carry         
                WAIT FOR 100 ns; 
                A(0) <= '0';
                A(1) <= '0';
                A(2) <= '0'; 
                B(0) <= '0';           -- 1000 - 1000
                B(1) <= '0';
                B(2) <= '0';
                B(3) <= '1';
                AddSubSel <= '1';                    

                                    
                 WAIT FOR 100 ns; 
                 A(0) <= '1';
                 A(1) <= '1';
                 A(2) <= '1';
                 B(0) <= '1';          -- 1111 + 1111
                 B(1) <= '1';
                 B(2) <= '1';
                 AddSubSel <= '0';
                
                 WAIT FOR 100 ns; 
              --   C_out <= '0'; -- Just a test
                 A(0) <= '0';
                 A(2) <= '0';          -- 1010 - 0101
                 B(1) <= '0';
                 B(3) <= '0';
                 AddSubSel <= '1';
                  
                 WAIT FOR 100 ns; 
                 A(0) <= '1';
                 A(2) <= '1';          -- 1111 + 0001
                 B(2) <= '0';     
                 AddSubSel <= '0';
                 
                 WAIT;
end process;
 
end Behavioral;