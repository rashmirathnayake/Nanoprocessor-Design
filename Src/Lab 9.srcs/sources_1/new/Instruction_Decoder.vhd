----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.06.2023 02:35:40
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( InsBus : in STD_LOGIC_VECTOR (11 downto 0);
           RegCheck : in STD_LOGIC_VECTOR (3 downto 0);
           Jump_Flag : out STD_LOGIC;
           JumpAddress : out STD_LOGIC_VECTOR (2 downto 0);
           AddSubSel : out STD_LOGIC;
           RegSel0 : out STD_LOGIC_VECTOR (2 downto 0);
           RegSel1 : out STD_LOGIC_VECTOR (2 downto 0);
           ImmediateValue : out STD_LOGIC_VECTOR (3 downto 0);
           LoadSel : out STD_LOGIC;
           RegEnable : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

component Decoder_2_to_4
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

SIGNAL MOV, ADD, NEG, JZR, ADD_or_NEG, ADD_or_NEG_or_JZR : STD_LOGIC;

begin
Decoder: Decoder_2_to_4
PORT MAP ( I => InsBus (11 downto 10),
           EN => '1',
           Y(0) => ADD,
           Y(1) => NEG,
           Y(2) => MOV,
           Y(3) => JZR);

ADD_or_NEG <= ADD or NEG;
ADD_or_NEG_or_JZR <= ADD_or_NEG or JZR;
LoadSel <= MOV;
AddSubSel <= NEG;
RegSel0 <= InsBus (9 downto 7) and (ADD_or_NEG_or_JZR , ADD_or_NEG_or_JZR, ADD_or_NEG_or_JZR);
RegSel1 <= InsBus (6 downto 4) and (ADD_or_NEG , ADD_or_NEG, ADD_or_NEG);
ImmediateValue <= InsBus (3 downto 0);
RegEnable <= InsBus (9 downto 7);
JumpAddress <= InsBus (2 downto 0);
Jump_Flag <= JZR and not(RegCheck (0) or RegCheck (1) or RegCheck (2));

end Behavioral;
