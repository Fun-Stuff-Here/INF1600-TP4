library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.simple_risc_def.all;

package simple_risc_programs is

   constant program_0 : inst_mem_type := (
      x"A000001", -- r0    <- +1           - addr x00
      x"A010002", -- r1    <- +2           - addr x01
      x"0040200", -- r4    <- r2 + r0      - addr x02
      x"0040400", -- r4    <- r4 + r0      - addr x03
      x"0040400", -- r4    <- r4 + r0      - addr x04
      x"1050301", -- r5    <- r3 - r1      - addr x05
      x"A060009", -- r6    <- +9           - addr x06
      x"9000106", -- M[r1] <- r6           - addr x07
      x"8070100", -- r7    <- M[r1]        - addr x08
      x"0010100", -- r1    <- r1 + r0      - addr x09
      x"0060600", -- r6    <- r6 + r0      - addr x0A
      x"1040400", -- r4    <- r4 - r0      - addr x0B
      x"C020007", -- jnz 0x07              - addr x0C
      others => (others => '1')
   );

   constant program_1 : inst_mem_type := (
      -- init
      x"A000001", -- 1                             - addr x00                          
      x"A010000", -- c                             - addr x01
      x"A020000", -- p                             - addr x02 
      x"A030000", -- t                             - addr x03 
      x"A040006", -- n                             - addr x04 
      x"A050000", -- ptr                           - addr x05 

      -- do while (n != 0)
      x"7030100", -- r[t]        <- r[c]           - addr x06 
      x"0010001", -- r[c]        <- 1 + r[c]       - addr x07 
      x"0010201", -- r[c]        <- r[p] + r[c]    - addr x08 
      x"7020300", -- r[p]        <- r[t]           - addr x09 
      x"9000501", -- Md[r[ptr]]  <- r[c]           - addr x0A 
      x"0050005", -- r[ptr]      <- 1 + r[ptr]     - addr x0B 
      x"1040400", -- r[n]        <- r[n] - 1       - addr x0C

      -- jump if (n != 0)
      x"C020006",

      others => (others => '1')
   );
   
end simple_risc_programs;

package body simple_risc_programs is  
end simple_risc_programs;
