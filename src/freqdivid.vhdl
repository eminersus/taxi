--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : freqdivid.vhf
-- /___/   /\     Timestamp : 04/11/2023 23:04:55
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\14.7\ISE_DS\ISE\bin\nt64\unwrapped\sch2hdl.exe -intstyle ise -family spartan6 -flat -suppress -vhdl freqdivid.vhf -w C:/Users/emin/Desktop/EE244/labbbb3/freqdivid.sch
--Design Name: freqdivid
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL CB16RE_HXILINX_freqdivid -----

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB16RE_HXILINX_freqdivid is
port (
    CEO : out STD_LOGIC;
    Q   : out STD_LOGIC_VECTOR(15 downto 0);
    TC  : out STD_LOGIC;
    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    R   : in STD_LOGIC
    );
end CB16RE_HXILINX_freqdivid;

architecture CB16RE_HXILINX_freqdivid_V of CB16RE_HXILINX_freqdivid is

  signal COUNT : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(15 downto 0) := (others => '1');

begin

process(C)
begin
  if (C'event and C ='1') then
    if (R='1') then
      COUNT <= (others => '0');
    elsif (CE='1') then 
      COUNT <= COUNT+1;
    end if;
  end if;
end process;

TC  <= '1' when (COUNT = TERMINAL_COUNT) else '0'; 
CEO <= '1' when ((COUNT = TERMINAL_COUNT) and CE='1') else '0'; 
Q   <= COUNT;

end CB16RE_HXILINX_freqdivid_V;
----- CELL CB4RE_HXILINX_freqdivid -----

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB4RE_HXILINX_freqdivid is
port (
    CEO : out STD_LOGIC;
    Q   : out STD_LOGIC_VECTOR(3 downto 0);
    TC  : out STD_LOGIC;
    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    R   : in STD_LOGIC
    );
end CB4RE_HXILINX_freqdivid;

architecture CB4RE_HXILINX_freqdivid_V of CB4RE_HXILINX_freqdivid is

  signal COUNT : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(3 downto 0) := (others => '1');

begin

process(C)
begin
  if (C'event and C ='1') then
    if (R='1') then
      COUNT <= (others => '0');
    elsif (CE='1') then 
      COUNT <= COUNT+1;
    end if;
  end if;
end process;

TC  <= '1' when (COUNT = TERMINAL_COUNT) else '0'; 
CEO <= '1' when ((COUNT = TERMINAL_COUNT) and CE='1') else '0'; 
Q   <= COUNT;

end CB4RE_HXILINX_freqdivid_V;
----- CELL CB2RE_HXILINX_freqdivid -----

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB2RE_HXILINX_freqdivid is
  port (
    CEO : out STD_LOGIC;
    Q0  : out STD_LOGIC;
    Q1  : out STD_LOGIC;
    TC  : out STD_LOGIC;
    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    R   : in STD_LOGIC
    );
end CB2RE_HXILINX_freqdivid;

architecture CB2RE_HXILINX_freqdivid_V of CB2RE_HXILINX_freqdivid is

  signal COUNT : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(1 downto 0) := (others => '1');

begin

process(C)
begin
  if (C'event and C ='1') then
    if (R='1') then
      COUNT <= (others => '0');
    elsif (CE='1') then 
      COUNT <= COUNT+1;
    end if;
  end if;
end process;

TC  <= '1' when (COUNT = TERMINAL_COUNT) else '0'; 
CEO <= '1' when ((COUNT = TERMINAL_COUNT) and CE='1') else '0'; 
Q1  <= COUNT(1);
Q0  <= COUNT(0);

end CB2RE_HXILINX_freqdivid_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity freqdivid is
   port ( clk : in    std_logic; 
          TC  : out   std_logic);
end freqdivid;

architecture BEHAVIORAL of freqdivid is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal reset   : std_logic;
   signal XLXN_62 : std_logic;
   signal XLXN_63 : std_logic;
   signal XLXN_67 : std_logic;
   signal XLXN_68 : std_logic;
   signal XLXN_69 : std_logic;
   signal XLXN_70 : std_logic;
   component CB16RE_HXILINX_freqdivid
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             R   : in    std_logic; 
             CEO : out   std_logic; 
             Q   : out   std_logic_vector (15 downto 0); 
             TC  : out   std_logic);
   end component;
   
   component CB4RE_HXILINX_freqdivid
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             R   : in    std_logic; 
             CEO : out   std_logic; 
             Q   : out   std_logic_vector (3 downto 0); 
             TC  : out   std_logic);
   end component;
   
   component CB2RE_HXILINX_freqdivid
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             R   : in    std_logic; 
             CEO : out   std_logic; 
             Q0  : out   std_logic; 
             Q1  : out   std_logic; 
             TC  : out   std_logic);
   end component;
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_0";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_1";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_2";
begin
   reset <= '0';
   XLXN_67 <= '1';
   XLXI_1 : CB16RE_HXILINX_freqdivid
      port map (C=>clk,
                CE=>XLXN_67,
                R=>reset,
                CEO=>XLXN_62,
                Q=>open,
                TC=>XLXN_68);
   
   XLXI_2 : CB4RE_HXILINX_freqdivid
      port map (C=>clk,
                CE=>XLXN_62,
                R=>reset,
                CEO=>XLXN_63,
                Q=>open,
                TC=>XLXN_69);
   
   XLXI_3 : CB2RE_HXILINX_freqdivid
      port map (C=>clk,
                CE=>XLXN_63,
                R=>reset,
                CEO=>open,
                Q0=>open,
                Q1=>open,
                TC=>XLXN_70);
   
   XLXI_10 : AND3
      port map (I0=>XLXN_70,
                I1=>XLXN_69,
                I2=>XLXN_68,
                O=>TC);
   
end BEHAVIORAL;


