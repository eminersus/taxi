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

entity Counter is
    Port ( drive : in  STD_LOGIC;
           clkin : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           score : out  STD_LOGIC_VECTOR (10 downto 0));
end Counter;

architecture Behavioral of Counter is
signal scoreint : std_logic_vector(10 downto 0) := (others => '0');

begin
counter:process(rst,clkin,drive)
	begin
	if rising_edge(clkin) then 
		if rst = '1' then
			scoreint <= (others => '0');
		else 
			if drive = '1' then
				scoreint <= scoreint + 10;
			else 
				scoreint <= scoreint + 3;
			end if;
		end if;
	end if;
end process;
score <= scoreint;


end Behavioral;