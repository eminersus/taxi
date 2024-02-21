----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:30:02 06/05/2023 
-- Design Name: 
-- Module Name:    SegmentTop - Behavioral 
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

entity SegmentTop is
    Port ( 
			  clkfast : in  STD_LOGIC;
			  clkin : in  STD_LOGIC; 
           drive : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           SSEG_CA  : out  STD_LOGIC_VECTOR (7 downto 0);
           SSEG_AN : out  STD_LOGIC_VECTOR (3 downto 0));
end SegmentTop;

architecture Behavioral of SegmentTop is
	COMPONENT Counter
	PORT(
		drive : IN std_logic;
		clkin : IN std_logic;
		rst : IN std_logic;          
		score : OUT std_logic_vector(10 downto 0)
		);
	END COMPONENT;
	COMPONENT binary2bcd
	PORT(
		wi : IN std_logic_vector(10 downto 0);          
		wo : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	COMPONENT BCD_to_seven_segment
	PORT(
		d : IN std_logic_vector(3 downto 0);          
		s : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;
	COMPONENT nexys3_sseg_driver
	PORT(
		MY_CLK : IN std_logic;
		DIGIT0 : IN std_logic_vector(7 downto 0);
		DIGIT1 : IN std_logic_vector(7 downto 0);
		DIGIT2 : IN std_logic_vector(7 downto 0);
		DIGIT3 : IN std_logic_vector(7 downto 0);          
		SSEG_CA : OUT std_logic_vector(7 downto 0);
		SSEG_AN : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	signal score : std_logic_vector(10 downto 0) := (others => '0');
	SIGNAL bcd : std_logic_vector(15 downto 0);
	SIGNAL dig3, dig2, dig1, dig0 : std_logic_vector(7 downto 0);
begin
	a0 : Counter PORT MAP(drive,clkin,rst,score);
	b0 : binary2bcd PORT MAP(score(10 downto 0), bcd(15 downto 0));
	c0 : BCD_to_seven_segment PORT MAP(bcd(3 downto 0),dig0(6 downto 0));
	c1 : BCD_to_seven_segment PORT MAP(bcd(7 downto 4),dig1(6 downto 0));
	c2 : BCD_to_seven_segment PORT MAP(bcd(11 downto 8),dig2(6 downto 0));
	c3 : BCD_to_seven_segment PORT MAP(bcd(15 downto 12),dig3(6 downto 0));
	dig0(7) <= '1';
	dig1(7) <= '1';
	dig2(7) <= '0';
	dig3(7) <= '1';
	t0 : nexys3_sseg_driver PORT MAP(clkfast, dig3, dig2, dig1, dig0, SSEG_CA, SSEG_AN);

end Behavioral;

