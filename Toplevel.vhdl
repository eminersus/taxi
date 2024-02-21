----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:25:54 06/05/2023 
-- Design Name: 
-- Module Name:    Toplevel - Behavioral 
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

entity Toplevel is
    Port ( board_clk : in  STD_LOGIC;
           buttonup : in  STD_LOGIC;
           buttondown : in  STD_LOGIC;
           buttonleft : in  STD_LOGIC;
           buttonright : in  STD_LOGIC;
			  buttonreset: in STD_LOGIC;
			  SSEG_CA  : out  STD_LOGIC_VECTOR (7 downto 0);
           SSEG_AN : out  STD_LOGIC_VECTOR (3 downto 0);
           HSYNC : out  STD_LOGIC;
           VSYNC : out  STD_LOGIC;
           RGB : out  STD_LOGIC_VECTOR (7 downto 0));
end Toplevel;

architecture Behavioral of Toplevel is
	COMPONENT SegmentTop
	PORT(
		clkfast : IN std_logic;
		clkin : IN std_logic;
		drive : IN std_logic;
		rst : IN std_logic;          
		SSEG_CA : OUT std_logic_vector(7 downto 0);
		SSEG_AN : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	COMPONENT ButtonControl
	PORT(
		clkin : IN std_logic;
		rst : IN std_logic;
		up : IN std_logic;
		down : IN std_logic;
		right : IN std_logic; 
		left : IN std_logic;           
		h_pos : OUT integer;
		v_pos : OUT integer;
		drive : OUT std_logic
		);
	END COMPONENT;
	COMPONENT vga_driver
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		enable : IN std_logic;          
		H_pulse : OUT std_logic;
		V_pulse : OUT std_logic;
		X : OUT integer;
		Y : OUT integer;
		display : OUT std_logic
		);
	END COMPONENT;
	COMPONENT freqdivid
	PORT(
		clk : IN std_logic;          
		TC : OUT std_logic
		);
	END COMPONENT;
	COMPONENT frequencydivider
	PORT(
		clkin : IN std_logic;
		rst : IN std_logic;          
		clkout : OUT std_logic
		);
	END COMPONENT;
	COMPONENT color_generator
	PORT(
		left : IN integer;
		top : IN integer;
		display : IN std_logic;
		X : IN integer;
		Y : IN integer;          
		rgb : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	COMPONENT slowclk
	PORT(
		clk : IN std_logic;          
		TC : OUT std_logic
		);
	END COMPONENT;
	
	signal clkfast, clkslow, drive, display, superslowclk: std_logic;
	signal xpos, ypos, xint, yint : integer;
	
begin
	fast : frequencydivider PORT MAP (board_clk, '0', clkfast); --25Mhz
	slow : freqdivid PORT MAP(board_clk, clkslow); -- 20Hz
	button : ButtonControl PORT MAP(clkslow, '0', buttonup, buttondown, buttonright, buttonleft, xpos, ypos, drive);
	segment : SegmentTop PORT MAP(board_clk, superslowclk, drive, buttonreset, SSEG_CA, SSEG_AN);
	vga : vga_driver PORT MAP(clkfast, '0', '1', HSYNC, VSYNC, xint, yint, display);
	colorgen : color_generator PORT MAP(xpos, ypos, display, xint, yint, RGB);
	Inst_slowclock: slowclk PORT MAP(board_clk, superslowclk); --2hz
end Behavioral;

