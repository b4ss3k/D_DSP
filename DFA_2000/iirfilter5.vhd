-------------------------------
-- iirfilter5.vhd Aug/04/00
-------------------------------
-----------------------------------------------
-- accumulator.vhd
-- by Toshio Iwata Jul/28/00
-- Accumulator
-- Sum up multiplied five data to get filtered output
-- We have only one full adder (DIOB+8)bits+(DIOB+12)bits
-- acc_round is (DIOB+8-1)bits, upper 6 bits and lower 6 bits are discarded

library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_arith.all;

entity accumulator is
   Port (
          RST : In std_logic; -- reset
          MCLK : In std_logic; -- 192Fs
          A_IN : In std_logic_vector(DIOB+8-1 downto 0); -- an input to adder
          ACCLAT : In std_logic; -- accumulation latch
          ACCCL : In std_logic; -- accumulation clear
          ACCENB : In std_logic; -- accumulation enable
          ACC_OUT : Out std_logic_vector(DIOB-1 downto 0) ); -- accumulated data
end accumulator;

architecture STRUCTURE of accumulator is

  signal A_tmp : signed( DIOB+8-1 downto 0 );
  signal B_tmp : signed( DIOB+12-1 downto 0 );
  signal C_tmp : signed( DIOB+12-1 downto 0 );
  signal ACC_tmp : signed( DIOB+12-1 downto 0 );
  signal acc_round : signed( DIOB+12-1 downto 0 );

begin -- architecture accumulator

-------------------------------------------------------------------
  gen_A_tmp : process( A_IN )
  begin -- process gen_A_tmp
 
    for i in DIOB+8-1 downto 0 loop
      A_tmp(i) <= A_IN(i);
    end loop;
 
  end process gen_A_tmp;
 
-------------------------------------------------------------------
  B_tmp <= ACC_tmp;
 
-------------------------------------------------------------------
  C_tmp <= A_tmp + B_tmp; -- adder
 
-------------------------------------------------------------------
gen_ACC_tmp : process( RST, MCLK, ACCCL ) -- accumulator
begin -- process gen_ACC_tmp

  if(RST = '1' or ACCCL = '1') then
    ACC_tmp <= (others => '0');
  elsif( MCLK'event and MCLK = '1' ) then
    if( ACCENB = '1' ) then
      ACC_tmp <= C_tmp;
    end if;
  end if;

end process gen_ACC_tmp;

-------------------------------------------------------------------    
  acc_round <= C_tmp + 32; -- to round it on sixth bit

-------------------------------------------------------------------                   
gen_ACC_OUT : process( RST, MCLK ) -- to pick up accumulated data
begin -- process gen_ACC_OUT
 
  if( RST = '1' ) then
    ACC_OUT <= (others => '0');
  elsif( MCLK'event and MCLK = '1' ) then
    if ( ACCLAT = '1' ) then
      if (acc_round(DIOB+12-1) = '0' and
            (acc_round(DIOB+12-2) = '1'
          or acc_round(DIOB+12-3) = '1'
          or acc_round(DIOB+12-4) = '1'
          or acc_round(DIOB+12-5) = '1'
          or acc_round(DIOB+12-6) = '1'
          or acc_round(DIOB+12-7) = '1')) then -- overflow
--        ACC_OUT <= "01111111";
        ACC_OUT <= (others => '1');
        ACC_OUT(DIOB-1) <= '0';
      elsif (acc_round(DIOB+12-1) = '1' and
            (acc_round(DIOB+12-2) = '0'
          or acc_round(DIOB+12-3) = '0'
          or acc_round(DIOB+12-4) = '0'
          or acc_round(DIOB+12-5) = '0'
          or acc_round(DIOB+12-6) = '0'
          or acc_round(DIOB+12-7) = '0')) then -- underflow
--        ACC_OUT <= "10000000";
        ACC_OUT <= (others => '0');
        ACC_OUT(DIOB-1) <= '1';
      else
        for i in DIOB-1 downto 0 loop 
          ACC_OUT(i) <= acc_round(i + 6);
        end loop; 
      end if;
    end if;
  end if;
  
end process gen_ACC_OUT; 
 
end; -- architecture accumulator

---------------------------------------------
-- divider.vhd
-- by Toshio Iwata Jul/28/00
-- Divider to generate clocks
-- Master clock(MCLK) is 384/512Fs

library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_arith.all;

entity divider is
   Port (
          RST : In std_logic; -- reset
          FSCLK : In std_logic; -- Fs (a clock synchronized with input data)
          MCLK : In std_logic; -- 384Fs (master clock)
          CO16 : Out std_logic_vector(3 downto 0); -- Jul/25/00
          MULSTART : Out std_logic;
          MULEND : Out std_logic;
          ACCLAT : Out std_logic; -- accumulation latch
          ACCCL : Out std_logic; -- accumulation clear
          ACCENB : Out std_logic ); -- accumulation enable
end divider;

architecture STRUCTURE of divider is

  signal counter_12_16 : unsigned( 3 downto 0 ); -- 12co when 384fs, 16co when 512fs
  signal counter_32 : unsigned( 4 downto 0 );
  signal counter_2 : unsigned( 1 downto 0 );
  signal fsclk_delay1 : std_logic;
  signal fsclk_delay2 : std_logic;
  signal fsclk_edge_dummy : std_logic;

begin -- architecture divider

--------------------------------------------------------------
gen_CO16 : process( counter_12_16 ) -- output for dly_mux_coeff
begin -- process gen_CO16

  for i in 3 downto 0 loop
    CO16(i) <= counter_12_16(i);
  end loop;

end process gen_CO16;

--------------------------------------------------------------
gen_counter_12_16 : process( RST, MCLK ) -- counter to generate ACCENB
begin -- process gen_counter_12_16

  if(RST = '1') then
    counter_12_16 <= "0000";
  elsif( MCLK'event and MCLK = '1' ) then
    if(fsclk_edge_dummy = '1') then
      counter_12_16 <= "0000";
    elsif(counter_32 = 31) then
      counter_12_16 <= counter_12_16 + 1;
    end if;
  end if;

end process gen_counter_12_16;

-------------------------------------------------------------- 
gen_MULSTART : process( counter_12_16, counter_32 ) -- multiplication start
begin -- process gen_MULSTART 
 
  if( counter_12_16 < 5 and counter_32 = 0 ) then 
    MULSTART <= '1'; 
  else 
    MULSTART <= '0'; 
  end if; 
 
end process gen_MULSTART; 
 
-------------------------------------------------------------- 
gen_MULEND : process( counter_12_16, counter_32 ) -- multiplication end
begin -- process gen_MULEND 
 
  if( counter_12_16 < 5 
      and counter_32 = COB+1 ) then
    MULEND <= '1'; 
  else 
    MULEND <= '0'; 
  end if; 
 
end process gen_MULEND; 
 
-------------------------------------------------------------- 
gen_ACCENB : process( counter_12_16, counter_32 ) 
begin -- process gen_ACCENB 
 
  if( counter_12_16 > 0 and counter_12_16 < 6 
      and counter_32 = COB+1 ) then
    ACCENB <= '1'; 
  else 
    ACCENB <= '0'; 
  end if; 
 
end process gen_ACCENB; 
 
-------------------------------------------------------------- 
gen_ACCLAT : process( counter_12_16, counter_32 ) 
begin -- process gen_ACCLAT 
 
  if( counter_12_16 = 5 
      and counter_32 = COB+1 ) then
    ACCLAT <= '1'; 
  else 
    ACCLAT <= '0'; 
  end if; 
 
end process gen_ACCLAT; 
 
-------------------------------------------------------------- 
gen_ACCCL : process( counter_12_16, counter_32 ) 
begin -- process gen_ACCCL 
 
  if( counter_12_16 = 1 and counter_32 = 0 ) then 
    ACCCL <= '1'; 
  else 
    ACCCL <= '0'; 
  end if; 
 
end process gen_ACCCL; 
 
--------------------------------------------------------------
gen_fsclk_delay : process( RST, MCLK )
begin -- process gen_fsclk_delay
 
  if( RST = '1' ) then
    fsclk_delay1 <= '0';
    fsclk_delay2 <= '0';
  elsif( MCLK'event and MCLK = '1' ) then
    fsclk_delay1 <= FSCLK;
    fsclk_delay2 <= fsclk_delay1;
  end if;

end process gen_fsclk_delay;

--------------------------------------------------------------
fsclk_edge_dummy <= fsclk_delay1 and not fsclk_delay2;

--------------------------------------------------------------
gen_counter_32 : process( RST, MCLK ) -- counter to generate ACCCLK
begin -- process gen_counter_32

  if(RST = '1') then
    counter_32 <= "00000";
  elsif( MCLK'event and MCLK = '1' ) then
    if(counter_32 = 31 or fsclk_edge_dummy = '1') then
      counter_32 <= "00000";
    else
      counter_32 <= counter_32 + 1;
    end if;
  end if;

end process gen_counter_32;

-------------------------------------------------------------------
end; -- architecture divider

---------------------------------------------
-- dly_mux_coeff.vhd
-- by Toshio Iwata Jul/28/00
-- Delays and MUX and Coefficients generator
-- We have only one multiplier so that, we need to 
-- multiplex data and coefficients

library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_arith.all;

entity dly_mux_coeff is
   Port (
          CO16 : In std_logic_vector(3 downto 0); -- Jul/25/0
          RST : In std_logic; -- reset
          FSCLK : In std_logic; -- Fs (a clock synchronized with input data)
          D_IN : In std_logic_vector(DIOB-1 downto 0); -- data input
          ACC_IN : In std_logic_vector(DIOB-1 downto 0); -- from accumulator
          A0 : In std_logic_vector(COB-1 downto 0); -- coeff a0
          A1 : In std_logic_vector(COB-1 downto 0); -- coeff a1
          A2 : In std_logic_vector(COB-1 downto 0); -- coeff a2
          B1 : In std_logic_vector(COB-1 downto 0); -- coeff b1
          B2 : In std_logic_vector(COB-1 downto 0); -- coeff b2
          COEFF_OUT : Out std_logic_vector(COB-1 downto 0); -- coefficients
          MUX_OUT : Out std_logic_vector(DIOB-1 downto 0); -- multiplexed data along with coefficients
          D_OUT : Out std_logic_vector(DIOB-1 downto 0) ); -- filterd data output
end dly_mux_coeff;

architecture STRUCTURE of dly_mux_coeff is

  signal d_a1, d_a2, d_b1, d_b2 : std_logic_vector( DIOB-1 downto 0 );

begin -- architecture dly_mux_coeff

-------------------------------------------------------------------
gen_d_a : process( RST, FSCLK ) -- delay input data (corresponds to z^(-1)
begin -- process gen_d_a

  if(RST = '1') then
    d_a1 <= (others => '0');
    d_a2 <= (others => '0');
  elsif( FSCLK'event and FSCLK = '1' ) then
    d_a1 <= D_IN;
    d_a2 <= d_a1;
  end if;

end process gen_d_a;

-------------------------------------------------------------------
gen_d_b : process( RST, FSCLK ) -- delay output data (corresponds to z^(-1)
begin -- process gen_d_b

  if(RST = '1') then
    d_b1 <= (others => '0');
    d_b2 <= (others => '0');
  elsif( FSCLK'event and FSCLK = '1' ) then
    d_b1 <= ACC_IN;
    d_b2 <= d_b1;
  end if;

end process gen_d_b;

-------------------------------------------------------------------                   
  gen_D_OUT : process( d_b1 ) -- filtered output
  begin -- process gen_D_OUT
 
    for i in DIOB-1 downto 0 loop 
      D_OUT(i) <= d_b1(i);
    end loop; 
  
  end process gen_D_OUT; 
 
--------------------------------------------------------------
  gen_COEFF_OUT : process( CO16, D_IN, d_a1, d_a2, d_b1, d_b2, A0, A1, A2, B1, B2 ) -- multiplex coefficients because we have only one multiplier
  begin -- process gen_COEFF_OUT
 
    if( CO16 = "0000" ) then
      COEFF_OUT <= A0;
      MUX_OUT <= D_IN;
    elsif( CO16 = "0001" ) then
      COEFF_OUT <= A1;
      MUX_OUT <= d_a1;
    elsif( CO16 = "0010" ) then
      COEFF_OUT <= A2;
      MUX_OUT <= d_a2;
    elsif( CO16 = "0011" ) then
      COEFF_OUT <= B1; -- b1 needs to be multiplied by (-1)
      MUX_OUT <= d_b1;
    elsif( CO16 = "0100" ) then
      COEFF_OUT <= B2; -- b2 needs to be multiplied by (-1)
      MUX_OUT <= d_b2;
    else
      COEFF_OUT <= (others => '0');
      MUX_OUT <= (others => '0');
    end if;
 
  end process gen_COEFF_OUT;

-------------------------------------------------------------------

end; -- architecture dly_mux_coeff

-- multiplier_mxn.vhd
-- by Toshio Iwata Jul/28/00
-- Multiplier (COB)bitsx(DIOB)bits (signed, has polarity bits)
-- Data is shifted and added to get multiplied rusults
-- shifted_A_IN is shifted up to COB-2, which can be (DIOB+COB-2)bits
-- sigma is accumulated with the range DIOB+COB-2
-- MULTIPLIED_OUT is (DIOB+8)bits but lower 6 bits are below decimal point 
-- because maximum value of a coefficient corresponds to 4.0

library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_arith.all;

entity multiplier_mxn is
   Port (
          RST : In std_logic; -- reset
          COEFF_IN : In std_logic_vector( COB-1 downto 0 ); -- coefficients
          A_IN : In std_logic_vector( DIOB-1 downto 0 ); -- multiplexed data along with coefficients
          MULSTART : In std_logic; -- multiplication start
          MULEND : In std_logic; -- multiplication end
          MCLK : In std_logic; -- 384/512Fs
          MULTIPLIED_OUT : Out std_logic_vector( DIOB+8-1 downto 0 ) ); -- multiplication results
end multiplier_mxn;

architecture STRUCTURE of multiplier_mxn is

  signal abs_COEFF_IN : unsigned( COB-2 downto 0 );
  signal abs_A_IN : unsigned( DIOB-2 downto 0 );
  signal shifted_A_IN : unsigned( DIOB+COB-3 downto 0 );
  signal sigma : unsigned( DIOB+COB-3 downto 0 );
  signal sigma_delay : unsigned( DIOB+COB-3 downto 0 );
  signal multi_start : std_logic;
  signal multiplied_flag : std_logic;

type state_type is ( S_start, 
                     S_sigma0, S_sigma1, S_sigma2, S_sigma3, 
                     S_sigma4, S_sigma5, S_sigma6, S_sigma7, 
                     S_sigma8, S_sigma9, S_sigma10, S_sigma11, 
                     S_sigma12, S_sigma13, S_sigma14, S_sigma15, 
                     S_sigma16, S_sigma17, S_sigma18, S_sigma19, 
                     S_sigma20, S_sigma21, S_sigma22, S_sigma23, 
                     S_sigma24, S_end );
  signal current_state : state_type;

begin -- architecture multiplier_mxn

-------------------------------------------------------------------
gen_multiplied_flag : process( COEFF_IN, A_IN ) -- check polarity of data 
variable all_zero_c, all_zero_d : boolean;
begin -- process gen_multiplied_flag

  all_zero_c := true;
  all_zero_d := true;
  for i in COB-1 downto 0 loop 
    if( COEFF_IN(i) = '1' ) then 
      all_zero_c := false;
    end if;
  end loop;
  for i in DIOB-1 downto 0 loop 
    if( A_IN(i) = '1' ) then 
      all_zero_d := false;
    end if;
  end loop;

  if ( all_zero_c or all_zero_d ) then
    multiplied_flag <= '0';
  else 
    multiplied_flag <= COEFF_IN( COB-1 ) xor A_IN( DIOB-1 );
  end if;

end process gen_multiplied_flag;
-------------------------------------------------------------------
  multi_start <= MULSTART;


-------------------------------------------------------------------
  gen_abs_COEFF_IN : process( COEFF_IN ) -- convert coefficients to absolute value
  variable tmp_abs : unsigned( COB-2 downto 0 );
  variable max_abs : unsigned( COB-2 downto 0 );
  begin -- process gen_abs_COEFF_IN

    for i in COB-2 downto 0 loop 
      max_abs(i) := '1';
    end loop;

    for i in COB-2 downto 0 loop -- initialize
      abs_COEFF_IN(i) <= '0';
    end loop;

    if( COEFF_IN(COB-1) = '0' ) then
      for i in COB-2 downto 0 loop
        abs_COEFF_IN(i) <= COEFF_IN(i);
      end loop;
    end if;
    if( COEFF_IN(COB-1) = '1' ) then
      for i in COB-2 downto 0 loop
        tmp_abs(i) := not COEFF_IN(i);
      end loop;

      if (tmp_abs /= max_abs) then
        tmp_abs := tmp_abs + 1;
      end if;

      for i in COB-2 downto 0 loop
        abs_COEFF_IN(i) <= tmp_abs(i);
      end loop;
    end if;

  end process gen_abs_COEFF_IN;

-------------------------------------------------------------------
  gen_abs_A_IN : process( A_IN ) -- convert the input data to absolute value
  variable tmp_abs : unsigned( DIOB-2 downto 0 ); 
  variable max_abs : unsigned( DIOB-2 downto 0 );
  begin -- process gen_abs_A_IN

    for i in DIOB-2 downto 0 loop 
      max_abs(i) := '1';
    end loop;

    for i in DIOB-2 downto 0 loop -- initialize
      abs_A_IN(i) <= '0';
    end loop;

    if( A_IN(DIOB-1) = '0' ) then
      for i in DIOB-2 downto 0 loop
        abs_A_IN(i) <= A_IN(i);
      end loop;
    end if;
    if( A_IN(DIOB-1) = '1' ) then
      for i in DIOB-2 downto 0 loop
        tmp_abs(i) := not A_IN(i); 
      end loop;
 
      if (tmp_abs /= max_abs) then
        tmp_abs := tmp_abs + 1;
      end if;
 
      for i in DIOB-2 downto 0 loop
        abs_A_IN(i) <= tmp_abs(i);
      end loop;
    end if;

  end process gen_abs_A_IN;

-------------------------------------------------------------------
  gen_shifted_A_IN : process( RST, MCLK ) -- executes multiplication by shifter and adder
  variable bit_num : integer;
  begin -- process gen_shifted_A_IN

    if( RST = '1' ) then
      current_state <= S_start;
    elsif( MCLK'event and MCLK = '1' ) then
      shifted_A_IN <= (others => '0');

      case current_state is 
      when S_start =>
	current_state <= S_sigma0;

      when S_sigma0 =>
	bit_num := 0;
        if(bit_num > COB-2) then bit_num := COB-2; end if;
	if( abs_COEFF_IN(bit_num) = '1' ) then
	  for i in DIOB-2 downto 0 loop
	    shifted_A_IN(i + bit_num) <= abs_A_IN(i);
          end loop;
        end if;
        if( COB = 2 ) then
          current_state <= S_end;
        else
	  current_state <= S_sigma1;
        end if;

      when S_sigma1 =>
	bit_num := 1;
        if(bit_num > COB-2) then bit_num := COB-2; end if;
	if( abs_COEFF_IN(bit_num) = '1' ) then
	  for i in DIOB-2 downto 0 loop
	    shifted_A_IN(i + bit_num) <= abs_A_IN(i);
          end loop;
        end if;
        if( COB = 3 ) then
          current_state <= S_end;
        else
	  current_state <= S_sigma2;
        end if;

      when S_sigma2 =>
	bit_num := 2;
        if(bit_num > COB-2) then bit_num := COB-2; end if;
	if( abs_COEFF_IN(bit_num) = '1' ) then
	  for i in DIOB-2 downto 0 loop
	    shifted_A_IN(i + bit_num) <= abs_A_IN(i);
          end loop;
        end if;
        if( COB = 4 ) then
          current_state <= S_end;
        else
	  current_state <= S_sigma3;
        end if;

      when S_sigma3 =>
	bit_num := 3;
        if(bit_num > COB-2) then bit_num := COB-2; end if;
	if( abs_COEFF_IN(bit_num) = '1' ) then
	  for i in DIOB-2 downto 0 loop
	    shifted_A_IN(i + bit_num) <= abs_A_IN(i);
          end loop;
        end if;
        if( COB = 5 ) then
          current_state <= S_end;
        else
	  current_state <= S_sigma4;
        end if;

      when S_sigma4 =>
	bit_num := 4;
        if(bit_num > COB-2) then bit_num := COB-2; end if;
	if( abs_COEFF_IN(bit_num) = '1' ) then
	  for i in DIOB-2 downto 0 loop
	    shifted_A_IN(i + bit_num) <= abs_A_IN(i);
          end loop;
        end if;
        if( COB = 6 ) then
          current_state <= S_end;
        else
	  current_state <= S_sigma5;
        end if;

      when S_sigma5 =>
	bit_num := 5;
        if(bit_num > COB-2) then bit_num := COB-2; end if;
	if( abs_COEFF_IN(bit_num) = '1' ) then
	  for i in DIOB-2 downto 0 loop
	    shifted_A_IN(i + bit_num) <= abs_A_IN(i);
          end loop;
        end if;
        if( COB = 7 ) then
          current_state <= S_end;
        else
	  current_state <= S_sigma6;
        end if;

      when S_sigma6 =>
	bit_num := 6;
        if(bit_num > COB-2) then bit_num := COB-2; end if;
	if( abs_COEFF_IN(bit_num) = '1' ) then
	  for i in DIOB-2 downto 0 loop
	    shifted_A_IN(i + bit_num) <= abs_A_IN(i);
          end loop;
        end if;
        if( COB = 8 ) then
          current_state <= S_end;
        else
	  current_state <= S_sigma7;
        end if;

      when S_sigma7 =>
	bit_num := 7;
        if(bit_num > COB-2) then bit_num := COB-2; end if;
	if( abs_COEFF_IN(bit_num) = '1' ) then
	  for i in DIOB-2 downto 0 loop
	    shifted_A_IN(i + bit_num) <= abs_A_IN(i);
          end loop;
        end if;
        if( COB = 9 ) then
          current_state <= S_end;
        else
	  current_state <= S_sigma8;
        end if;

      when S_sigma8 =>
	bit_num := 8;
        if(bit_num > COB-2) then bit_num := COB-2; end if;
	if( abs_COEFF_IN(bit_num) = '1' ) then
	  for i in DIOB-2 downto 0 loop
	    shifted_A_IN(i + bit_num) <= abs_A_IN(i);
          end loop;
        end if;
        if( COB = 10 ) then
          current_state <= S_end;
        else
	  current_state <= S_sigma9;
        end if;

      when S_sigma9 =>
	bit_num := 9;
        if(bit_num > COB-2) then bit_num := COB-2; end if;
	if( abs_COEFF_IN(bit_num) = '1' ) then
	  for i in DIOB-2 downto 0 loop
	    shifted_A_IN(i + bit_num) <= abs_A_IN(i);
          end loop;
        end if;
        if( COB = 11 ) then
          current_state <= S_end;
        else
	  current_state <= S_sigma10;
        end if;

      when S_sigma10 =>
	bit_num := 10;
        if(bit_num > COB-2) then bit_num := COB-2; end if;
	if( abs_COEFF_IN(bit_num) = '1' ) then
	  for i in DIOB-2 downto 0 loop
	    shifted_A_IN(i + bit_num) <= abs_A_IN(i);
          end loop;
        end if;
        if( COB = 12 ) then
          current_state <= S_end;
        else
	  current_state <= S_sigma11;
        end if;

      when S_sigma11 =>
	bit_num := 11;
        if(bit_num > COB-2) then bit_num := COB-2; end if;
	if( abs_COEFF_IN(bit_num) = '1' ) then
	  for i in DIOB-2 downto 0 loop
	    shifted_A_IN(i + bit_num) <= abs_A_IN(i);
          end loop;
        end if;
        if( COB = 13 ) then
          current_state <= S_end;
        else
	  current_state <= S_sigma12;
        end if;

      when S_sigma12 =>
	bit_num := 12;
        if(bit_num > COB-2) then bit_num := COB-2; end if;
	if( abs_COEFF_IN(bit_num) = '1' ) then
	  for i in DIOB-2 downto 0 loop
	    shifted_A_IN(i + bit_num) <= abs_A_IN(i);
          end loop;
        end if;
        if( COB = 14 ) then
          current_state <= S_end;
        else
	  current_state <= S_sigma13;
        end if;

      when S_sigma13 =>
	bit_num := 13;
        if(bit_num > COB-2) then bit_num := COB-2; end if;
	if( abs_COEFF_IN(bit_num) = '1' ) then
	  for i in DIOB-2 downto 0 loop
	    shifted_A_IN(i + bit_num) <= abs_A_IN(i);
          end loop;
        end if;
        if( COB = 15 ) then
          current_state <= S_end;
        else
	  current_state <= S_sigma14;
        end if;

      when S_sigma14 =>
	bit_num := 14;
        if(bit_num > COB-2) then bit_num := COB-2; end if;
	if( abs_COEFF_IN(bit_num) = '1' ) then
	  for i in DIOB-2 downto 0 loop
	    shifted_A_IN(i + bit_num) <= abs_A_IN(i);
          end loop;
        end if;
        if( COB = 16 ) then
          current_state <= S_end;
        else
	  current_state <= S_sigma15;
        end if;

      when S_sigma15 =>
	bit_num := 15;
        if(bit_num > COB-2) then bit_num := COB-2; end if;
	if( abs_COEFF_IN(bit_num) = '1' ) then
	  for i in DIOB-2 downto 0 loop
	    shifted_A_IN(i + bit_num) <= abs_A_IN(i);
          end loop;
        end if;
        if( COB = 17 ) then
          current_state <= S_end;
        else
	  current_state <= S_sigma16;
        end if;

      when S_sigma16 =>
	bit_num := 16;
        if(bit_num > COB-2) then bit_num := COB-2; end if;
	if( abs_COEFF_IN(bit_num) = '1' ) then
	  for i in DIOB-2 downto 0 loop
	    shifted_A_IN(i + bit_num) <= abs_A_IN(i);
          end loop;
        end if;
        if( COB = 18 ) then
          current_state <= S_end;
        else
	  current_state <= S_sigma17;
        end if;

      when S_sigma17 =>
	bit_num := 17;
        if(bit_num > COB-2) then bit_num := COB-2; end if;
	if( abs_COEFF_IN(bit_num) = '1' ) then
	  for i in DIOB-2 downto 0 loop
	    shifted_A_IN(i + bit_num) <= abs_A_IN(i);
          end loop;
        end if;
        if( COB = 19 ) then
          current_state <= S_end;
        else
	  current_state <= S_sigma18;
        end if;

      when S_sigma18 =>
	bit_num := 18;
        if(bit_num > COB-2) then bit_num := COB-2; end if;
	if( abs_COEFF_IN(bit_num) = '1' ) then
	  for i in DIOB-2 downto 0 loop
	    shifted_A_IN(i + bit_num) <= abs_A_IN(i);
          end loop;
        end if;
        if( COB = 20 ) then
          current_state <= S_end;
        else
	  current_state <= S_sigma19;
        end if;

      when S_sigma19 =>
	bit_num := 19;
        if(bit_num > COB-2) then bit_num := COB-2; end if;
	if( abs_COEFF_IN(bit_num) = '1' ) then
	  for i in DIOB-2 downto 0 loop
	    shifted_A_IN(i + bit_num) <= abs_A_IN(i);
          end loop;
        end if;
        if( COB = 21 ) then
          current_state <= S_end;
        else
	  current_state <= S_sigma20;
        end if;

      when S_sigma20 =>
	bit_num := 20;
        if(bit_num > COB-2) then bit_num := COB-2; end if;
	if( abs_COEFF_IN(bit_num) = '1' ) then
	  for i in DIOB-2 downto 0 loop
	    shifted_A_IN(i + bit_num) <= abs_A_IN(i);
          end loop;
        end if;
        if( COB = 22 ) then
          current_state <= S_end;
        else
	  current_state <= S_sigma21;
        end if;

      when S_sigma21 =>
	bit_num := 21;
        if(bit_num > COB-2) then bit_num := COB-2; end if;
	if( abs_COEFF_IN(bit_num) = '1' ) then
	  for i in DIOB-2 downto 0 loop
	    shifted_A_IN(i + bit_num) <= abs_A_IN(i);
          end loop;
        end if;
        if( COB = 23 ) then
          current_state <= S_end;
        else
	  current_state <= S_sigma22;
        end if;

      when S_sigma22 =>
	bit_num := 22;
        if(bit_num > COB-2) then bit_num := COB-2; end if;
	if( abs_COEFF_IN(bit_num) = '1' ) then
	  for i in DIOB-2 downto 0 loop
	    shifted_A_IN(i + bit_num) <= abs_A_IN(i);
          end loop;
        end if;
        if( COB = 24 ) then
          current_state <= S_end;
        else
	  current_state <= S_sigma23;
        end if;

      when S_sigma23 =>
	bit_num := 23;
        if(bit_num > COB-2) then bit_num := COB-2; end if;
	if( abs_COEFF_IN(bit_num) = '1' ) then
	  for i in DIOB-2 downto 0 loop
	    shifted_A_IN(i + bit_num) <= abs_A_IN(i);
          end loop;
        end if;
        if( COB = 25 ) then
          current_state <= S_end;
        else
          current_state <= S_sigma24;
        end if;

      when S_sigma24 =>
	bit_num := 24;
        if(bit_num > COB-2) then bit_num := COB-2; end if;
	if( abs_COEFF_IN(bit_num) = '1' ) then
	  for i in DIOB-2 downto 0 loop
	    shifted_A_IN(i + bit_num) <= abs_A_IN(i);
          end loop;
        end if;
	current_state <= S_end;

      when S_end =>
	if(multi_start = '1') then 
	  current_state <= S_start;
        else
	  current_state <= S_end;
        end if;
      
      when others => 
	current_state <= S_start;
      
      end case;
    end if;

  end process gen_shifted_A_IN;

-------------------------------------------------------------------
  gen_sigma_delay : process( RST, multi_start, MCLK )
  begin -- process gen_sigma_delay

    if( RST = '1' or multi_start = '1') then
      sigma_delay <= (others => '0');
    elsif( MCLK'event and MCLK = '1' ) then
      sigma_delay <= sigma;
    end if;

  end process gen_sigma_delay;

-------------------------------------------------------------------
  sigma <= shifted_A_IN + sigma_delay;

-------------------------------------------------------------------
  gen_MULTIPLIED_OUT : process( RST, MCLK ) -- pick up multiplication results
  begin -- process gen_MULTIPLIED_OUT

    if( RST = '1' ) then
      MULTIPLIED_OUT <= (others => '0');
    elsif( MCLK'event and MCLK = '1' ) then
      if( MULEND = '1' ) then
        if( multiplied_flag = '0' ) then
          MULTIPLIED_OUT( DIOB+8-1 ) <= '0';
          for i in DIOB+8-2 downto 0 loop
            MULTIPLIED_OUT( i ) <= sigma(i + COB-8-1);
          end loop;
        else
          MULTIPLIED_OUT( DIOB+8-1 ) <= '1';
          for i in DIOB+8-2 downto 0 loop
            MULTIPLIED_OUT( i ) <= not sigma(i + COB-8-1);
          end loop;
        end if;
      end if;
    end if;

  end process gen_MULTIPLIED_OUT;

-------------------------------------------------------------------
end; -- architecture multiplier_mxn

---------------------------------------------
-- iir_top.vhd
-- by Toshio Iwata Jul/28/00
-- The top module of 2 order IIR Filter

library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_arith.all;

entity iir_top is
   Port (
          RST : In std_logic; -- reset
          FSCLK : In std_logic; -- Fs (a clock synchronized with input data)
          D_IN : In std_logic_vector(DIOB-1 downto 0); -- data input
          MCLK : In std_logic; -- 384Fs (master clock)
          A0 : In std_logic_vector(COB-1 downto 0); -- coeff a0
          A1 : In std_logic_vector(COB-1 downto 0); -- coeff a1
          A2 : In std_logic_vector(COB-1 downto 0); -- coeff a2
          B1 : In std_logic_vector(COB-1 downto 0); -- coeff b1
          B2 : In std_logic_vector(COB-1 downto 0); -- coeff b2
          D_OUT : Out std_logic_vector(DIOB-1 downto 0) ); -- filtered data output
end iir_top;

architecture STRUCTURE of iir_top is

  signal coeff_signal : std_logic_vector(COB-1 downto 0);
  signal mul_signal : std_logic_vector(DIOB+8-1 downto 0);
  signal acc_signal : std_logic_vector(DIOB-1 downto 0);
  signal accenb_signal : std_logic;
  signal acclat_signal : std_logic;
  signal acccl_signal : std_logic;
  signal mux_signal : std_logic_vector(DIOB-1 downto 0);
  signal mulstart_signal : std_logic;
  signal mulend_signal : std_logic;
  signal co16_signal : std_logic_vector(3 downto 0);

component divider
Port (
          RST : In std_logic;
          FSCLK : In std_logic;
          MCLK : In std_logic;
          CO16 : Out std_logic_vector(3 downto 0);
          MULSTART : Out std_logic;
          MULEND : Out std_logic;
          ACCLAT : Out std_logic;
          ACCCL : Out std_logic;
          ACCENB : Out std_logic );
end component;

component multiplier_mxn
Port (
          RST : In std_logic;
          COEFF_IN : In std_logic_vector( COB-1 downto 0 );
          A_IN : In std_logic_vector( DIOB-1 downto 0 );
          MULSTART : In std_logic;
          MULEND : In std_logic;
          MCLK : In std_logic;
          MULTIPLIED_OUT : Out std_logic_vector( DIOB+8-1 downto 0 ) );
end component;

component accumulator
Port (
          RST : In std_logic;
          MCLK : In std_logic;
          A_IN : In std_logic_vector(DIOB+8-1 downto 0);
          ACCLAT : In std_logic;
          ACCCL : In std_logic;
          ACCENB : In std_logic;
          ACC_OUT : Out std_logic_vector(DIOB-1 downto 0) );
end component;

component dly_mux_coeff
Port (
          CO16 : In std_logic_vector(3 downto 0);
          RST : In std_logic;
          FSCLK : In std_logic;
          D_IN : In std_logic_vector(DIOB-1 downto 0);
          ACC_IN : In std_logic_vector(DIOB-1 downto 0);
          A0 : In std_logic_vector(COB-1 downto 0);
          A1 : In std_logic_vector(COB-1 downto 0);
          A2 : In std_logic_vector(COB-1 downto 0);
          B1 : In std_logic_vector(COB-1 downto 0);
          B2 : In std_logic_vector(COB-1 downto 0);
          COEFF_OUT : Out std_logic_vector(COB-1 downto 0);
          MUX_OUT : Out std_logic_vector(DIOB-1 downto 0);
          D_OUT : Out std_logic_vector(DIOB-1 downto 0) );
end component;

begin -- architecture iir_top

divider_1: divider port map (
          RST => RST,
          FSCLK => FSCLK,
          MCLK => MCLK,
          CO16 => co16_signal,
          MULSTART => mulstart_signal,
          MULEND => mulend_signal,
          ACCLAT => acclat_signal,
          ACCCL => acccl_signal,
          ACCENB => accenb_signal );

multiplier_mxn_1: multiplier_mxn port map ( 
          RST => RST, 
          COEFF_IN => coeff_signal, 
          A_IN => mux_signal, 
          MULSTART => mulstart_signal, 
          MULEND => mulend_signal, 
          MCLK => MCLK, 
          MULTIPLIED_OUT => mul_signal); 

accumulator_1: accumulator port map ( 
          RST => RST, 
          MCLK => MCLK, 
          A_IN => mul_signal, 
          ACCLAT => acclat_signal, 
          ACCCL => acccl_signal, 
          ACCENB => accenb_signal, 
          ACC_OUT => acc_signal); 

dly_mux_coeff_1: dly_mux_coeff port map ( 
          CO16 => co16_signal, 
          RST => RST, 
          FSCLK => FSCLK, 
          D_IN => D_IN, 
          ACC_IN => acc_signal, 
          A0 => A0, 
          A1 => A1, 
          A2 => A2, 
          B1 => B1, 
          B2 => B2, 
          COEFF_OUT => coeff_signal, 
          MUX_OUT => mux_signal, 
          D_OUT => D_OUT); 

end; -- architecture iir_top

---------------------------------------------
-- iir_5_top.vhd
-- by Toshio Iwata Jul/28/00
-- The top module of IIR Filter
-- 2 order IIR Filter x5 
-- Be careful of that b1, b2, d1 and d2 have been inverted 

library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_arith.all;

entity iir_5_top is
   Port (
          RST : In std_logic; -- reset
          FSCLK : In std_logic; -- Fs (a clock synchronized with input data)
          D_IN : In std_logic_vector(DIOB-4-1 downto 0); -- input data
          MCLK : In std_logic; -- 384/512Fs (master clock)
          D_OUT : Out std_logic_vector(DIOB-4-1 downto 0) ); -- filtered data output
end iir_5_top;

architecture STRUCTURE of iir_5_top is

component iir_top
Port (
          RST : In std_logic;
          FSCLK : In std_logic;
          D_IN : In std_logic_vector(DIOB-1 downto 0);
          MCLK : In std_logic;
          A0 : In std_logic_vector(COB-1 downto 0);
          A1 : In std_logic_vector(COB-1 downto 0);
          A2 : In std_logic_vector(COB-1 downto 0);
          B1 : In std_logic_vector(COB-1 downto 0);
          B2 : In std_logic_vector(COB-1 downto 0);
          D_OUT : Out std_logic_vector(DIOB-1 downto 0) );
end component;

  signal a0_sig : std_logic_vector(COB-1 downto 0);
  signal a1_sig : std_logic_vector(COB-1 downto 0);
  signal a2_sig : std_logic_vector(COB-1 downto 0);
  signal b1_sig : std_logic_vector(COB-1 downto 0);
  signal b2_sig : std_logic_vector(COB-1 downto 0);
  signal c0_sig : std_logic_vector(COB-1 downto 0);
  signal c1_sig : std_logic_vector(COB-1 downto 0);
  signal c2_sig : std_logic_vector(COB-1 downto 0);
  signal d1_sig : std_logic_vector(COB-1 downto 0);
  signal d2_sig : std_logic_vector(COB-1 downto 0);
  signal e0_sig : std_logic_vector(COB-1 downto 0);
  signal e1_sig : std_logic_vector(COB-1 downto 0);
  signal e2_sig : std_logic_vector(COB-1 downto 0);
  signal f1_sig : std_logic_vector(COB-1 downto 0);
  signal f2_sig : std_logic_vector(COB-1 downto 0);
  signal g0_sig : std_logic_vector(COB-1 downto 0);
  signal g1_sig : std_logic_vector(COB-1 downto 0);
  signal g2_sig : std_logic_vector(COB-1 downto 0);
  signal h1_sig : std_logic_vector(COB-1 downto 0);
  signal h2_sig : std_logic_vector(COB-1 downto 0);
  signal i0_sig : std_logic_vector(COB-1 downto 0);
  signal i1_sig : std_logic_vector(COB-1 downto 0);
  signal i2_sig : std_logic_vector(COB-1 downto 0);
  signal j1_sig : std_logic_vector(COB-1 downto 0);
  signal j2_sig : std_logic_vector(COB-1 downto 0);

  signal d_in_sig : std_logic_vector(DIOB-1 downto 0);
  signal d_out_sig : std_logic_vector(DIOB-1 downto 0);
  signal d_inter_sig : std_logic_vector(DIOB-1 downto 0);
  signal d_inter2_sig : std_logic_vector(DIOB-1 downto 0);
  signal d_inter3_sig : std_logic_vector(DIOB-1 downto 0);
  signal d_inter4_sig : std_logic_vector(DIOB-1 downto 0);

begin -- architecture iir_5_top

-- Note: we need two more bits for coefficients
-- and four more bits for in/out data internally,
-- so we compensate those in this architecture

  a0_sig <= "repa0";
  a1_sig <= "repa1";
  a2_sig <= "repa2";
  b1_sig <= "repb1"; -- polarity has been inverted
  b2_sig <= "repb2"; -- polarity has been inverted

  c0_sig <= "repa0";
  c1_sig <= "repa1";
  c2_sig <= "repa2";
  d1_sig <= "repb1"; -- polarity has been inverted
  d2_sig <= "repb2"; -- polarity has been inverted

  e0_sig <= "repa0";
  e1_sig <= "repa1";
  e2_sig <= "repa2";
  f1_sig <= "repb1"; -- polarity has been inverted
  f2_sig <= "repb2"; -- polarity has been inverted

  g0_sig <= "repa0";
  g1_sig <= "repa1";
  g2_sig <= "repa2";
  h1_sig <= "repb1"; -- polarity has been inverted
  h2_sig <= "repb2"; -- polarity has been inverted

  i0_sig <= "repa0";
  i1_sig <= "repa1";
  i2_sig <= "repa2";
  j1_sig <= "repb1"; -- polarity has been inverted
  j2_sig <= "repb2"; -- polarity has been inverted

--------------------------------------------------------------
gen_d_in_sig : process(D_IN) -- compensate two bits for D_IN
begin -- process gen_d_in_sig
 
  if( D_IN(DIOB-4-1) = '0' ) then
    d_in_sig <= "0000" & D_IN;
  else
    d_in_sig <= "1111" & D_IN;
  end if;
 
end process gen_d_in_sig;
 
--------------------------------------------------------------
gen_d_out_sig : process(d_out_sig) -- compensate two bits for D_OUT
begin -- process gen_d_out_sig
 
  if( d_out_sig(DIOB-1) = '0' and
     (d_out_sig(DIOB-2) = '1' or
      d_out_sig(DIOB-3) = '1' or
      d_out_sig(DIOB-4) = '1' or
      d_out_sig(DIOB-5) = '1') ) then -- overflow
    D_OUT <= (others => '1');
    D_OUT(DIOB-4-1) <= '0';
  elsif( d_out_sig(DIOB-1) = '1' and
        (d_out_sig(DIOB-2) = '0' or
         d_out_sig(DIOB-3) = '0' or
         d_out_sig(DIOB-4) = '0' or
         d_out_sig(DIOB-5) = '0') ) then -- underflow
    D_OUT <= (others => '0');
    D_OUT(DIOB-4-1) <= '1';
  else
    for i in DIOB-4-1 downto 0 loop
      D_OUT(i) <= d_out_sig(i);
    end loop;
  end if;
 
end process gen_d_out_sig;
 
iir_top_a: iir_top port map ( -- 1st iir filter
          RST => RST,
          FSCLK => FSCLK,
          D_IN => d_in_sig,
          MCLK => MCLK,
          A0 => a0_sig,
          A1 => a1_sig,
          A2 => a2_sig,
          B1 => b1_sig,
          B2 => b2_sig,
          D_OUT => d_inter_sig);

iir_top_b: iir_top port map ( -- 2nd iir filter
          RST => RST,
          FSCLK => FSCLK,
          D_IN => d_inter_sig,
          MCLK => MCLK,
          A0 => c0_sig,
          A1 => c1_sig,
          A2 => c2_sig,
          B1 => d1_sig,
          B2 => d2_sig,
          D_OUT => d_inter2_sig);

iir_top_c: iir_top port map ( -- 3rd iir filter
          RST => RST,
          FSCLK => FSCLK,
          D_IN => d_inter2_sig,
          MCLK => MCLK,
          A0 => e0_sig,
          A1 => e1_sig,
          A2 => e2_sig,
          B1 => f1_sig,
          B2 => f2_sig,
          D_OUT => d_inter3_sig);

iir_top_d: iir_top port map ( -- 4th iir filter
          RST => RST,
          FSCLK => FSCLK,
          D_IN => d_inter3_sig,
          MCLK => MCLK,
          A0 => g0_sig,
          A1 => g1_sig,
          A2 => g2_sig,
          B1 => h1_sig,
          B2 => h2_sig,
          D_OUT => d_inter4_sig);

iir_top_e: iir_top port map ( -- 5th iir filter
          RST => RST,
          FSCLK => FSCLK,
          D_IN => d_inter4_sig,
          MCLK => MCLK,
          A0 => i0_sig,
          A1 => i1_sig,
          A2 => i2_sig,
          B1 => j1_sig,
          B2 => j2_sig,
          D_OUT => d_out_sig);

end; -- architecture iir_5_top

