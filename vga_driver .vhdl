
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vga_driver is
	port (
		clk: in std_logic;
		reset: in std_logic;
		enable: in std_logic;
		H_pulse: out std_logic;
		V_pulse: out std_logic;
		X: out integer;
		Y: out integer;
		display: out std_logic
		);
end vga_driver;

architecture Behavioral of vga_driver is
	constant v_sync_pulse_time: integer := 521;
	constant v_pulse_width: integer := 2;
	constant v_back_porch: integer := 29;
	constant v_front_porch: integer := 10;
	
	constant h_sync_pulse_time: integer := 800;
	constant h_pulse_width: integer := 96;
	constant h_back_porch: integer := 48;
	constant h_front_porch: integer := 16;
	
	
begin
	
vg_process: process(clk, Enable)

	variable h_counter: integer range 1 to h_sync_pulse_time;
	variable v_counter: integer range 1 to v_sync_pulse_time;
	variable h_next: integer range 1 to h_sync_pulse_time;
	variable v_next: integer range 1 to v_sync_pulse_time;
	
	begin
		if(rising_edge(clk)) then
			if reset = '1' then
				v_counter := 1;
				h_counter := 1;
			elsif enable = '1' then 
				v_counter := v_next;
				h_counter := h_next;
			end if;
		
		
		if(h_counter = h_sync_pulse_time) then
			h_next := 1;
		else
			h_next := h_counter + 1;
		end if;
		
		if(v_counter = v_sync_pulse_time and h_counter = h_sync_pulse_time) then
			v_next := 1;
		elsif(h_counter = h_sync_pulse_time) then
			v_next := v_counter + 1;
		else 
			v_next := v_counter;
		end if;

		if(h_counter >= 1 and h_counter <= h_pulse_width) then
			H_pulse <= '1';
		else
			H_pulse <= '0';
		end if;
		
		if(v_counter >= 1 and v_counter <= v_pulse_width) then
			V_pulse <= '1';
		else
			V_pulse <= '0';
		end if;
		
		if(((h_counter >= 1 and h_counter <= h_pulse_width+ h_back_porch)or(h_counter > h_sync_pulse_time-h_front_porch and h_counter <= h_sync_pulse_time)) or ((v_counter >= 1 and v_counter <= v_pulse_width+v_back_porch)or(v_counter > v_sync_pulse_time-v_front_porch and v_counter <= v_sync_pulse_time))) then
			display <= '0';
		else
			display <= '1';
		end if;
		
		X<= (h_counter-(h_back_porch+h_pulse_width));
		Y<= (v_counter-(v_back_porch+v_pulse_width));
		
		end if;
		
		
end process vg_process;
	


end Behavioral;

