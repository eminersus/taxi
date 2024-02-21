----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:28:39 05/02/2023 
-- Design Name: 
-- Module Name:    adder3 - structural 
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

entity adder3 is
    Port ( i3 : in  STD_LOGIC;
           i2 : in  STD_LOGIC;
           i1 : in  STD_LOGIC;
           i0 : in  STD_LOGIC;
           o3 : out  STD_LOGIC;
           o2 : out  STD_LOGIC;
           o1 : out  STD_LOGIC;
           o0 : out  STD_LOGIC);
end adder3;

architecture dataflow of adder3 is

begin
	o3 <= i3 or (i2 AND (i1 or i0));
	o2 <= (i2 and not (i1 or i0)) or (i3 and i0);
	o1 <= (i1 and not i2) or (i1 and i0) or (i3 and not i0);
	o0 <= i0 XOR (i3 or (i2 AND (i1 or i0)));


end dataflow;

