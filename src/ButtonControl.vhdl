----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:47:57 05/22/2023 
-- Design Name: 
-- Module Name:    ButtonControl - Behavioral 
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

entity ButtonControl is
    Port ( 	clkin : in  STD_LOGIC;
				rst : in  STD_LOGIC;
            up : in  STD_LOGIC;
				down : in  STD_LOGIC;
				right : in  STD_LOGIC;
				left : in  STD_LOGIC;
				h_pos : out  integer;
            v_pos : out  integer;
				drive : out STD_LOGIC);
end ButtonControl;

architecture Behavioral of ButtonControl is
	signal h_state: integer := 280;
	signal v_state: integer := 122;

begin

buttoncontrol: process(clkin,rst)

begin
if rising_edge(clkin) then
	if rst = '1' then
		h_state <= 280;
		v_state <= 122;
	else
		if (up or down or left or right) = '1' then
			drive <= '1';
		else 
			drive <= '0';
		end if;
		--Don't forget to write the boundary conditions later on
		if up = '1' then
			if v_state > 1 then
				v_state <= v_state - 1;
			end if; 
		end if; 
		if down = '1' then
			if v_state < 445 then
				v_state <= v_state + 1;
			end if;
		end if; 

		if left = '1' then
			if h_state > 1 then
				h_state <= h_state - 1;
			end if; 
		end if; 
		if right = '1' then
			if h_state < 565 then 
				h_state <= h_state + 1;
			end if;
		end if;
	end if;
end if;
end process;

v_pos <= v_state;
h_pos <= h_state;

end Behavioral;

