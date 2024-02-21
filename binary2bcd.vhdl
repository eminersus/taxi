----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:59:13 05/02/2023 
-- Design Name: 
-- Module Name:    binary2bcd - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity binary2bcd is
    Port ( wi : in  STD_LOGIC_VECTOR (10 downto 0);
           wo : out  STD_LOGIC_VECTOR (15 downto 0));
end binary2bcd;

architecture dataflow of binary2bcd is
	COMPONENT adder3
	PORT(
		i3 : IN std_logic;
		i2 : IN std_logic;
		i1 : IN std_logic;
		i0 : IN std_logic;          
		o3 : OUT std_logic;
		o2 : OUT std_logic;
		o1 : OUT std_logic;
		o0 : OUT std_logic
		);
	END COMPONENT;
	SIGNAL d1s, d2s, d3s, d4s, d5s, d6s, d7s, d9s, d10s, d11s, d12s, d14s: std_logic_vector(3 downto 0);

begin
d1: adder3 PORT MAP ('0', wi(10), wi(9),wi(8),d1s(3),d1s(2),d1s(1),d1s(0));
d2: adder3 PORT MAP (d1s(2), d1s(1), d1s(0),wi(7),d2s(3),d2s(2),d2s(1),d2s(0));
d3: adder3 PORT MAP (d2s(2), d2s(1), d2s(0),wi(6),d3s(3),d3s(2),d3s(1),d3s(0));
d4: adder3 PORT MAP (d3s(2), d3s(1), d3s(0),wi(5),d4s(3),d4s(2),d4s(1),d4s(0));
d5: adder3 PORT MAP (d4s(2), d4s(1), d4s(0),wi(4),d5s(3),d5s(2),d5s(1),d5s(0));
d6: adder3 PORT MAP (d5s(2), d5s(1), d5s(0),wi(3),d6s(3),d6s(2),d6s(1),d6s(0));
d7: adder3 PORT MAP (d6s(2), d6s(1), d6s(0),wi(2),d7s(3),d7s(2),d7s(1),d7s(0));
d8: adder3 PORT MAP (d7s(2), d7s(1), d7s(0), wi(1), wo(4), wo(3),wo(2),wo(1));
d9: adder3 PORT MAP ('0', d1s(3), d2s(3),d3s(3),d9s(3),d9s(2),d9s(1),d9s(0));
d10: adder3 PORT MAP (d9s(2), d9s(1), d9s(0),d4s(3),d10s(3),d10s(2),d10s(1),d10s(0));
d11: adder3 PORT MAP (d10s(2), d10s(1), d10s(0),d5s(3),d11s(3),d11s(2),d11s(1),d11s(0));
d12: adder3 PORT MAP (d11s(2), d11s(1), d11s(0),d6s(3),d12s(3),d12s(2),d12s(1),d12s(0));
d13: adder3 PORT MAP (d12s(2), d12s(1), d12s(0),d7s(3),wo(8),wo(7),wo(6),wo(5));
d14: adder3 PORT MAP ('0', d9s(3), d10s(3),d11s(3),wo(13),d14s(2),d14s(1),d14s(0));
d15: adder3 PORT MAP (d14s(2), d14s(1), d14s(0),d12s(3), wo(12),wo(11),wo(10),wo(9));

wo(0) <= wi(0);
wo(14) <= '0';
wo(15) <= '0';
end dataflow;

