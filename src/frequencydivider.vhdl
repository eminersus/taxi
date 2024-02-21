----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:35:25 05/16/2023 
-- Design Name: 
-- Module Name:    frequencydivider - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity frequencydivider is
    Port ( clkin : in  STD_LOGIC;
           clkout : out  STD_LOGIC;
           rst : in  STD_LOGIC);
end frequencydivider;

architecture Behavioral of frequencydivider is
signal counter: integer := 0;
signal refrclk : std_logic := '0';
begin

	FREQ_DIV: process (clkin) begin
	if rising_edge(clkin) then
		if (counter = 1) then 
			refrclk <= not refrclk;
			counter <= 0;
		else
			counter <= counter + 1;
		end if;
	end if;
	end process;
	
	clkout <= refrclk;

		
end Behavioral;

