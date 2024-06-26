library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.simple_risc_def.all;
use work.simple_risc_programs.all;

entity simple_risc_tb is
end simple_risc_tb;

architecture test of simple_risc_tb is

   component simple_risc is
   generic(
      inst_memory : inst_mem_type := program_1
   );
   port(
      rst : in  std_logic;
      clk : in  std_logic
   );
   end component;

   signal rst    : std_logic := '1';
   signal clk    : std_logic := '0';
   
   constant period : time    := 10 ns;

begin

   UUT1 : simple_risc
   generic map( inst_memory => program_1 ) -- CHARGER VOTRE PROGRAMME ICI -> program_1
   port map( rst => rst, clk => clk);
   
   clk <= not clk after period / 2;
   rst <= '1' after 0 ns,
          '0' after 3*period / 2;

end test;
