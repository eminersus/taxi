
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity color_generator is
	port(
		left: in integer;
		top: in integer;
		display: in std_logic;
		X: in integer;
		Y: in integer;
		rgb: out std_logic_vector(7 downto 0)
	);
end color_generator;

architecture Behavioral of color_generator is
signal yellowactive: std_logic;
signal blackactive: std_logic;
signal orangeactive: std_logic;
signal purpleactive: std_logic;
signal greyactive: std_logic;
signal redactive: std_logic;
signal roadactive: std_logic;
signal yellowrgb:std_logic_vector(7 downto 0);
signal blackrgb:std_logic_vector(7 downto 0);
signal background:std_logic_vector(7 downto 0);
signal redrgb:std_logic_vector(7 downto 0);
signal purplergb:std_logic_vector(7 downto 0);
signal greyrgb:std_logic_vector(7 downto 0);
signal orangergb:std_logic_vector(7 downto 0);
signal roadrgb:std_logic_vector(7 downto 0);




begin
		
		
	blackactive <= '1' when
		((Y=top) and (X=left+24 or X=left+25 or X=left+53 or X=left+54)) or
		((Y=top+1) and ((X>=left+23 and X<=left+25) or (X>=left+53 and X<=left+55))) or
		((Y=top+2) and ((X>=left+22 and X<=left+25) or (X>=left+53 and X<=left+56))) or
		((Y=top+3) and ((X>=left+21 and X<=left+25) or (X>=left+53 and X<=left+57))) or
		((Y=top+4) and ((X>=left+20 and X<=left+25) or (X>=left+53 and X<=left+58))) or
		((Y=top+5) and ((X>=left+19 and X<=left+25) or (X>=left+53 and X<=left+59))) or
		((Y=top+6) and ((X>=left+18 and X<=left+25) or (X>=left+53 and X<=left+60) or (X>=left+37 and X<=left+41))) or
		((Y=top+7) and ((X>=left+17 and X<=left+25) or (X>=left+53 and X<=left+61))) or
		((Y=top+8) and ((X>=left+17 and X<=left+25) or (X>=left+53 and X<=left+61))) or
		((Y=top+9) and ((X>=left+17 and X<=left+25) or (X>=left+53 and X<=left+61))) or
		((Y=top+10) and ((X>=left+17 and X<=left+25) or (X>=left+53 and X<=left+61))) or
		((Y=top+11) and ((X>=left+17 and X<=left+25) or (X>=left+53 and X<=left+61))) or
		((Y=top+12) and ((X>=left+17 and X<=left+25) or (X>=left+53 and X<=left+61))) or
		((Y=top+13) and ((X>=left+17 and X<=left+25) or (X>=left+53 and X<=left+61))) or
		((Y=top+14) and ((X>=left+17 and X<=left+25) or (X>=left+53 and X<=left+61))) or
		((Y=top+15) and ((X>=left+17 and X<=left+25) or (X>=left+53 and X<=left+61))) or
		((Y=top+16) and ((X>=left+17 and X<=left+24) or (X>=left+27 and X<=left+37) or (X>=left+40 and X<=left+51) or (X>=left+54 and X<=left+61))) or
		((Y=top+17) and ((X>=left+17 and X<=left+23) or (X>=left+26 and X<=left+37) or (X>=left+40 and X<=left+52) or (X>=left+55 and X<=left+61))) or
		((Y=top+18) and ((X>=left+17 and X<=left+22) or (X>=left+25 and X<=left+37) or (X>=left+40 and X<=left+53) or (X>=left+56 and X<=left+61))) or
		((Y=top+19) and ((X>=left+17 and X<=left+21) or (X>=left+24 and X<=left+37) or (X>=left+40 and X<=left+54) or (X>=left+57 and X<=left+61))) or
		((Y=top+20) and ((X>=left+17 and X<=left+20) or (X>=left+23 and X<=left+37) or (X>=left+40 and X<=left+55) or (X>=left+58 and X<=left+61))) or
		((Y=top+21) and ((X>=left+17 and X<=left+19) or (X>=left+22 and X<=left+37) or (X>=left+40 and X<=left+56) or (X>=left+59 and X<=left+61))) or
		((Y=top+22) and ((X>=left+17 and X<=left+18) or (X>=left+21 and X<=left+37) or (X>=left+40 and X<=left+57) or (X>=left+60 and X<=left+61))) or
		((Y=top+24) and ( X=left+8 or X=left+9 or X=left+12 or X=left+13 or X=left+16 or X=left+17 or X=left+20 or X=left+21 or X=left+24 or X=left+25 or X=left+28 or X=left+29 or X=left+32 or X=left+33)) or
		((Y=top+25) and ( X=left+8 or X=left+9 or X=left+12 or X=left+13 or X=left+16 or X=left+17 or X=left+20 or X=left+21 or X=left+24 or X=left+25 or X=left+28 or X=left+29 or X=left+32 or X=left+33 or X=left+43 or X=left+44)) or
		((Y=top+26) and ( X=left+10 or X=left+11 or X=left+14 or X=left+15 or X=left+18 or X=left+19 or X=left+22 or X=left+23 or X=left+26 or X=left+27 or X=left+30 or X=left+31)) or
		((Y=top+27) and ( X=left+10 or X=left+11 or X=left+14 or X=left+15 or X=left+18 or X=left+19 or X=left+22 or X=left+23 or X=left+26 or X=left+27 or X=left+30 or X=left+31)) or
		((Y=top+29) and ((X>=left+10 and x<=left+15) or (X>=left+59 and X<=left+64))) or
		((Y=top+30) and ((X>=left+9 and x<=left+16) or (X>=left+58 and X<=left+65))) or
		((Y=top+31) and ((X>=left+9 and x<=left+11) or (X>=left+14 and X<=left+16) or (X>=left+58 and X<=left+60)or (X>=left+63 and X<=left+65))) or
		((Y=top+32) and ((X>=left+9 and x<=left+11) or (X>=left+14 and X<=left+16) or (X>=left+58 and X<=left+60)or (X>=left+63 and X<=left+65))) or
		((Y=top+33) and ((X>=left+9 and x<=left+16) or (X>=left+58 and X<=left+65))) or
		((Y=top+34) and ((X>=left+10 and x<=left+15) or (X>=left+59 and X<=left+64)))
		else '0';
		
	redactive <= '1' when 
		((Y=top+27) and (X=left+2 or X=left+3 or X=left+71 or X=left+72)) or
		((Y=top+28) and (X=left+2 or X=left+3 or X=left+71 or X=left+72)) or
		((Y=top+29) and (X=left or X=left+1 or X=left+73 or X=left+74)) or
		((Y=top+30) and (X=left or X=left+1 or X=left+73 or X=left+74)) or
		((Y=top+31) and (X=left or X=left+1 or X=left+73 or X=left+74)) 
		else '0';
	purpleactive <= '1' when
		((Y=top+27) and (X=left or X=left+1 or X=left+73 or X=left+74)) or
		((Y=top+28) and (X=left or X=left+1 or X=left+73 or X=left+74)) 
		else '0';
		
	greyactive <= '1' when
		((Y=top+31) and (X=left+12 or X=left+13 or X=left+61 or X=left+62)) or
		((Y=top+32) and (X=left+12 or X=left+13 or X=left+61 or X=left+62)) 
		else '0';
	orangeactive <='1' when
		((Y=top) and (X>=left+26 and X<=left+52)) or
		((Y=top+5) and (X>=left+36 and X<=left+42)) or
		((Y=top+6) and (X=left+36 or X=left+42)) or
		((Y=top+7) and (X>=left+34 and X<=left+44)) or
		((Y=top+8) and ((X>=left+34 and X<=left+44) or (X>=left+3 and X<=left+16) or (X>=left+62 and X<=left+71))) or
		((Y=top+9) and (X=left+2 or X=left+3 or X=left+71 or X=left+72)) or
		((Y=top+10) and (X=left+1 or X=left+2 or X=left+72 or X=left+73)) or
		((Y=top+11) and (X=left or X=left+1 or X=left+73 or X=left+74)) or
		((Y=top+15) and (X>=left+26 and X<=left+52)) or
		((Y=top+16) and (X=left+25 or X=left+26 or X=left+38 or X=left+39 or X=left+52 or X=left+53)) or
		((Y=top+17) and (X=left+24 or X=left+25 or X=left+38 or X=left+39 or X=left+53 or X=left+54)) or
		((Y=top+18) and (X=left+23 or X=left+24 or X=left+38 or X=left+39 or X=left+54 or X=left+55)) or
		((Y=top+19) and (X=left+22 or X=left+23 or X=left+38 or X=left+39 or X=left+55 or X=left+56)) or
		((Y=top+20) and (X=left+21 or X=left+22 or X=left+38 or X=left+39 or X=left+56 or X=left+57)) or
		((Y=top+21) and (X=left+20 or X=left+21 or X=left+38 or X=left+39 or X=left+57 or X=left+58)) or
		((Y=top+22) and (X=left+19 or X=left+20 or X=left+38 or X=left+39 or X=left+58 or X=left+59)) or
		((Y=top+23) and (X>=left+3 and X<=left+71)) or
		((Y=top+24) and (X=left+2 or X=left+3 or X=left+38 or X=left+39 or X=left+71 or X=left+72)) or
		((Y=top+25) and (X=left+1 or X=left+2 or X=left+38 or X=left+39 or X=left+72 or X=left+73)) or
		((Y=top+26) and (X=left or X=left+1 or X=left+38 or X=left+39 or X=left+73 or X=left+74)) or
		((Y=top+27) and (X=left+38 or X=left+39)) or
		((Y=top+28) and (X=left+38 or X=left+39)) or
		((Y=top+29) and (X=left+38 or X=left+39)) or
		((Y=top+30) and (X=left+38 or X=left+39)) or
		((Y=top+31) and (X=left+38 or X=left+39)) or
		((Y=top+32) and (X=left+38 or X=left+39))
		else '0';
	yellowactive <= '1' when
		((Y=top+1) and (X>=left+26 and X<=left+52)) or
		((Y=top+2) and (X>=left+26 and X<=left+52)) or
		((Y=top+3) and (X>=left+26 and X<=left+52)) or
		((Y=top+4) and (X>=left+26 and X<=left+52)) or
		((Y=top+5) and ((X>=left+26 and X<=left+35) or (X>=left+43 and X<=left+52))) or
		((Y=top+6) and ((X>=left+26 and X<=left+35) or (X>=left+43 and X<=left+52))) or
		((Y=top+7) and ((X>=left+26 and X<=left+33) or (X>=left+45 and X<=left+52))) or
		((Y=top+8) and ((X>=left+26 and X<=left+33) or (X>=left+45 and X<=left+52))) or
		((Y=top+9) and ((X>=left+4 and X<=left+16) or(X>=left+26 and X<=left+52) or (X>=left+62 and X<=left+70))) or
		((Y=top+10) and ((X>=left+3 and X<=left+16) or(X>=left+26 and X<=left+52) or (X>=left+62 and X<=left+71))) or
		((Y=top+11) and ((X>=left+2 and X<=left+16) or(X>=left+26 and X<=left+52) or (X>=left+62 and X<=left+72))) or
		((Y=top+12) and ((X>=left and X<=left+16) or(X>=left+26 and X<=left+52) or (X>=left+62 and X<=left+74))) or
		((Y=top+13) and ((X>=left and X<=left+16) or(X>=left+26 and X<=left+52) or (X>=left+62 and X<=left+74))) or
		((Y=top+14) and ((X>=left and X<=left+16) or(X>=left+26 and X<=left+52) or (X>=left+62 and X<=left+74))) or
		((Y=top+15) and ((X>=left and X<=left+16) or (X>=left+62 and X<=left+74))) or
		((Y=top+16) and ((X>=left and X<=left+16) or (X>=left+62 and X<=left+74))) or
		((Y=top+17) and ((X>=left and X<=left+16) or (X>=left+62 and X<=left+74))) or
		((Y=top+18) and ((X>=left and X<=left+16) or (X>=left+62 and X<=left+74))) or
		((Y=top+19) and ((X>=left and X<=left+16) or (X>=left+62 and X<=left+74))) or
		((Y=top+20) and ((X>=left and X<=left+16) or (X>=left+62 and X<=left+74))) or
		((Y=top+21) and ((X>=left and X<=left+16) or (X>=left+62 and X<=left+74))) or
		((Y=top+22) and ((X>=left and X<=left+16) or (X>=left+62 and X<=left+74))) or
		((Y=top+23) and ( X=left or X=left+1 or X=left+2 or X=left+1 or X=left+72 or X=left+73 or X=left+74)) or
		((Y=top+24) and ( X=left+10 or X=left+11 or X=left+14 or X=left+15 or X=left+18 or X=left+19 or X=left+22 or X=left+23 or X=left+26 or X=left+27 or X=left+30 or X=left+31 or X=left or X=left+1 or (X>=left+4 and X<=left+7) or (X>=left+34 and X<=left+37) or (X>=left+40 and X<=left+70) or X=left+73 or X=left+74)) or
		((Y=top+25) and ( X=left+10 or X=left+11 or X=left+14 or X=left+15 or X=left+18 or X=left+19 or X=left+22 or X=left+23 or X=left+26 or X=left+27 or X=left+30 or X=left+31 or X=left or (X>=left+3 and X<=left+7) or (X>=left+34 and X<=left+37) or (X>=left+40 and X<=left+42) or (X>=left+45 and X<=left+71) or X=left+74)) or
		((Y=top+26) and ((X>=left+2 and X<=left+9) or X=left+12 or X=left+13 or X=left+16 or X=left+17 or X=left+20 or X=left+21 or X=left+24 or X=left+25 or X=left+28 or X=left+29 or (X>=left+32 and X<=left+37) or (X>=left+40 and X<=left+72))) or
		((Y=top+27) and ((X>=left+4 and X<=left+9) or X=left+12 or X=left+13 or X=left+16 or X=left+17 or X=left+20 or X=left+21 or X=left+24 or X=left+25 or X=left+28 or X=left+29 or (X>=left+32 and X<=left+37) or (X>=left+40 and X<=left+70))) or
		((Y=top+28) and ((X>=left+4 and X<=left+37) or (X>=left+40 and X<=left+70))) or
		((Y=top+29) and ((X>=left+2 and X<=left+9) or(X>=left+16 and X<=left+37) or (X>=left+40 and X<=left+58) or(X>=left+65 and X<=left+72))) or
		((Y=top+30) and ((X>=left+2 and X<=left+8) or(X>=left+17 and X<=left+37) or (X>=left+40 and X<=left+57) or(X>=left+66 and X<=left+72))) or
		((Y=top+31) and ((X>=left+2 and X<=left+8) or(X>=left+17 and X<=left+37) or (X>=left+40 and X<=left+57) or(X>=left+66 and X<=left+72))) or
		((Y=top+32) and ((X>=left and X<=left+8) or(X>=left+17 and X<=left+37) or (X>=left+40 and X<=left+57) or(X>=left+66 and X<=left+74)))
		else '0';
		
	roadactive <= '1' when
		((X > 146 and X <246) or (X > 392 and X < 492) or
		(Y > 93 and Y <193) or (Y > 286 and Y <386))
		else '0';
		
	
		
		
yellowrgb <= "11111000";
blackrgb <= "00000000";
redrgb <= "11100000";
background <= "00011100";
orangergb <= "11110000";
purplergb <= "10000110";
greyrgb <= "00000101";
roadrgb <= "11111111";



rgb <= "00000000" when display = '0' else
	orangergb when orangeactive = '1' else
	blackrgb when blackactive = '1' else
	redrgb when redactive = '1' else
	purplergb when purpleactive = '1' else
	yellowrgb when yellowactive = '1' else
	greyrgb when greyactive = '1' else
	roadrgb when roadactive = '1' else
	background;
		

end Behavioral;

