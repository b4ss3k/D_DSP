-----------------------------------------
-- firfilter.vhd Aug/03/00
-----------------------------------------
---------------------------------------------
-- rom.vhd
-- by Toshio Iwata Aug/01/00
-- COB bits x 512 words
-- includes coefficients for FIR Filter

library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_arith.all;

entity rom is
   Port (
          RDN : In std_logic;
          CSN : In std_logic;
          ADDR : In std_logic_vector(ADDB-1 downto 0);
          DOUT : Out std_logic_vector(COB-1 downto 0) );
end rom;

architecture STRUCTURE of rom is

  subtype ROMWORD is std_logic_vector(COB-1 downto 0);
  type ROMARRAY is array (0 to 2**ADDB - 1) of ROMWORD;

  signal ROMDATA : ROMARRAY;
  signal ADDR_IN : integer range 0 to 2**ADDB - 1;
--  signal DIN_CHANGE, WRN_RISE : time := 0 ps;
  signal addr_tmp : unsigned(ADDB-1 downto 0);

begin -- architecture rom

----------------------------------------------------
gen_addr_tmp : process( ADDR )
begin -- process gen_addr_tmp

  for i in ADDB-1 downto 0 loop
    addr_tmp(i) <= ADDR(i);
  end loop;

end process gen_addr_tmp;

----------------------------------------------------
  ADDR_IN <= conv_integer(addr_tmp);

  ROMDATA(  1) <= "reph  0";
  ROMDATA(  2) <= "reph  1";
  ROMDATA(  3) <= "reph  2";
  ROMDATA(  4) <= "reph  3";
  ROMDATA(  5) <= "reph  4";
  ROMDATA(  6) <= "reph  5";
  ROMDATA(  7) <= "reph  6";
  ROMDATA(  8) <= "reph  7";
  ROMDATA(  9) <= "reph  8";
  ROMDATA( 10) <= "reph  9";
  ROMDATA( 11) <= "reph 10";
  ROMDATA( 12) <= "reph 11";
  ROMDATA( 13) <= "reph 12";
  ROMDATA( 14) <= "reph 13";
  ROMDATA( 15) <= "reph 14";
  ROMDATA( 16) <= "reph 15";
  ROMDATA( 17) <= "reph 16";
  ROMDATA( 18) <= "reph 17";
  ROMDATA( 19) <= "reph 18";
  ROMDATA( 20) <= "reph 19";
  ROMDATA( 21) <= "reph 20";
  ROMDATA( 22) <= "reph 21";
  ROMDATA( 23) <= "reph 22";
  ROMDATA( 24) <= "reph 23";
  ROMDATA( 25) <= "reph 24";
  ROMDATA( 26) <= "reph 25";
  ROMDATA( 27) <= "reph 26";
  ROMDATA( 28) <= "reph 27";
  ROMDATA( 29) <= "reph 28";
  ROMDATA( 30) <= "reph 29";
  ROMDATA( 31) <= "reph 30";
  ROMDATA( 32) <= "reph 31";
  ROMDATA( 33) <= "reph 32";
  ROMDATA( 34) <= "reph 33";
  ROMDATA( 35) <= "reph 34";
  ROMDATA( 36) <= "reph 35";
  ROMDATA( 37) <= "reph 36";
  ROMDATA( 38) <= "reph 37";
  ROMDATA( 39) <= "reph 38";
  ROMDATA( 40) <= "reph 39";
  ROMDATA( 41) <= "reph 40";
  ROMDATA( 42) <= "reph 41";
  ROMDATA( 43) <= "reph 42";
  ROMDATA( 44) <= "reph 43";
  ROMDATA( 45) <= "reph 44";
  ROMDATA( 46) <= "reph 45";
  ROMDATA( 47) <= "reph 46";
  ROMDATA( 48) <= "reph 47";
  ROMDATA( 49) <= "reph 48";
  ROMDATA( 50) <= "reph 49";
  ROMDATA( 51) <= "reph 50";
  ROMDATA( 52) <= "reph 51";
  ROMDATA( 53) <= "reph 52";
  ROMDATA( 54) <= "reph 53";
  ROMDATA( 55) <= "reph 54";
  ROMDATA( 56) <= "reph 55";
  ROMDATA( 57) <= "reph 56";
  ROMDATA( 58) <= "reph 57";
  ROMDATA( 59) <= "reph 58";
  ROMDATA( 60) <= "reph 59";
  ROMDATA( 61) <= "reph 60";
  ROMDATA( 62) <= "reph 61";
  ROMDATA( 63) <= "reph 62";
  ROMDATA( 64) <= "reph 63";
  ROMDATA( 65) <= "reph 64";
  ROMDATA( 66) <= "reph 65";
  ROMDATA( 67) <= "reph 66";
  ROMDATA( 68) <= "reph 67";
  ROMDATA( 69) <= "reph 68";
  ROMDATA( 70) <= "reph 69";
  ROMDATA( 71) <= "reph 70";
  ROMDATA( 72) <= "reph 71";
  ROMDATA( 73) <= "reph 72";
  ROMDATA( 74) <= "reph 73";
  ROMDATA( 75) <= "reph 74";
  ROMDATA( 76) <= "reph 75";
  ROMDATA( 77) <= "reph 76";
  ROMDATA( 78) <= "reph 77";
  ROMDATA( 79) <= "reph 78";
  ROMDATA( 80) <= "reph 79";
  ROMDATA( 81) <= "reph 80";
  ROMDATA( 82) <= "reph 81";
  ROMDATA( 83) <= "reph 82";
  ROMDATA( 84) <= "reph 83";
  ROMDATA( 85) <= "reph 84";
  ROMDATA( 86) <= "reph 85";
  ROMDATA( 87) <= "reph 86";
  ROMDATA( 88) <= "reph 87";
  ROMDATA( 89) <= "reph 88";
  ROMDATA( 90) <= "reph 89";
  ROMDATA( 91) <= "reph 90";
  ROMDATA( 92) <= "reph 91";
  ROMDATA( 93) <= "reph 92";
  ROMDATA( 94) <= "reph 93";
  ROMDATA( 95) <= "reph 94";
  ROMDATA( 96) <= "reph 95";
  ROMDATA( 97) <= "reph 96";
  ROMDATA( 98) <= "reph 97";
  ROMDATA( 99) <= "reph 98";
  ROMDATA(100) <= "reph 99";
  ROMDATA(101) <= "reph100";
  ROMDATA(102) <= "reph101";
  ROMDATA(103) <= "reph102";
  ROMDATA(104) <= "reph103";
  ROMDATA(105) <= "reph104";
  ROMDATA(106) <= "reph105";
  ROMDATA(107) <= "reph106";
  ROMDATA(108) <= "reph107";
  ROMDATA(109) <= "reph108";
  ROMDATA(110) <= "reph109";
  ROMDATA(111) <= "reph110";
  ROMDATA(112) <= "reph111";
  ROMDATA(113) <= "reph112";
  ROMDATA(114) <= "reph113";
  ROMDATA(115) <= "reph114";
  ROMDATA(116) <= "reph115";
  ROMDATA(117) <= "reph116";
  ROMDATA(118) <= "reph117";
  ROMDATA(119) <= "reph118";
  ROMDATA(120) <= "reph119";
  ROMDATA(121) <= "reph120";
  ROMDATA(122) <= "reph121";
  ROMDATA(123) <= "reph122";
  ROMDATA(124) <= "reph123";
  ROMDATA(125) <= "reph124";
  ROMDATA(126) <= "reph125";
  ROMDATA(127) <= "reph126";
  ROMDATA(128) <= "reph127";
  ROMDATA(129) <= "reph128";
  ROMDATA(130) <= "reph129";
  ROMDATA(131) <= "reph130";
  ROMDATA(132) <= "reph131";
  ROMDATA(133) <= "reph132";
  ROMDATA(134) <= "reph133";
  ROMDATA(135) <= "reph134";
  ROMDATA(136) <= "reph135";
  ROMDATA(137) <= "reph136";
  ROMDATA(138) <= "reph137";
  ROMDATA(139) <= "reph138";
  ROMDATA(140) <= "reph139";
  ROMDATA(141) <= "reph140";
  ROMDATA(142) <= "reph141";
  ROMDATA(143) <= "reph142";
  ROMDATA(144) <= "reph143";
  ROMDATA(145) <= "reph144";
  ROMDATA(146) <= "reph145";
  ROMDATA(147) <= "reph146";
  ROMDATA(148) <= "reph147";
  ROMDATA(149) <= "reph148";
  ROMDATA(150) <= "reph149";
  ROMDATA(151) <= "reph150";
  ROMDATA(152) <= "reph151";
  ROMDATA(153) <= "reph152";
  ROMDATA(154) <= "reph153";
  ROMDATA(155) <= "reph154";
  ROMDATA(156) <= "reph155";
  ROMDATA(157) <= "reph156";
  ROMDATA(158) <= "reph157";
  ROMDATA(159) <= "reph158";
  ROMDATA(160) <= "reph159";
  ROMDATA(161) <= "reph160";
  ROMDATA(162) <= "reph161";
  ROMDATA(163) <= "reph162";
  ROMDATA(164) <= "reph163";
  ROMDATA(165) <= "reph164";
  ROMDATA(166) <= "reph165";
  ROMDATA(167) <= "reph166";
  ROMDATA(168) <= "reph167";
  ROMDATA(169) <= "reph168";
  ROMDATA(170) <= "reph169";
  ROMDATA(171) <= "reph170";
  ROMDATA(172) <= "reph171";
  ROMDATA(173) <= "reph172";
  ROMDATA(174) <= "reph173";
  ROMDATA(175) <= "reph174";
  ROMDATA(176) <= "reph175";
  ROMDATA(177) <= "reph176";
  ROMDATA(178) <= "reph177";
  ROMDATA(179) <= "reph178";
  ROMDATA(180) <= "reph179";
  ROMDATA(181) <= "reph180";
  ROMDATA(182) <= "reph181";
  ROMDATA(183) <= "reph182";
  ROMDATA(184) <= "reph183";
  ROMDATA(185) <= "reph184";
  ROMDATA(186) <= "reph185";
  ROMDATA(187) <= "reph186";
  ROMDATA(188) <= "reph187";
  ROMDATA(189) <= "reph188";
  ROMDATA(190) <= "reph189";
  ROMDATA(191) <= "reph190";
  ROMDATA(192) <= "reph191";
  ROMDATA(193) <= "reph192";
  ROMDATA(194) <= "reph193";
  ROMDATA(195) <= "reph194";
  ROMDATA(196) <= "reph195";
  ROMDATA(197) <= "reph196";
  ROMDATA(198) <= "reph197";
  ROMDATA(199) <= "reph198";
  ROMDATA(200) <= "reph199";
  ROMDATA(201) <= "reph200";
  ROMDATA(202) <= "reph201";
  ROMDATA(203) <= "reph202";
  ROMDATA(204) <= "reph203";
  ROMDATA(205) <= "reph204";
  ROMDATA(206) <= "reph205";
  ROMDATA(207) <= "reph206";
  ROMDATA(208) <= "reph207";
  ROMDATA(209) <= "reph208";
  ROMDATA(210) <= "reph209";
  ROMDATA(211) <= "reph210";
  ROMDATA(212) <= "reph211";
  ROMDATA(213) <= "reph212";
  ROMDATA(214) <= "reph213";
  ROMDATA(215) <= "reph214";
  ROMDATA(216) <= "reph215";
  ROMDATA(217) <= "reph216";
  ROMDATA(218) <= "reph217";
  ROMDATA(219) <= "reph218";
  ROMDATA(220) <= "reph219";
  ROMDATA(221) <= "reph220";
  ROMDATA(222) <= "reph221";
  ROMDATA(223) <= "reph222";
  ROMDATA(224) <= "reph223";
  ROMDATA(225) <= "reph224";
  ROMDATA(226) <= "reph225";
  ROMDATA(227) <= "reph226";
  ROMDATA(228) <= "reph227";
  ROMDATA(229) <= "reph228";
  ROMDATA(230) <= "reph229";
  ROMDATA(231) <= "reph230";
  ROMDATA(232) <= "reph231";
  ROMDATA(233) <= "reph232";
  ROMDATA(234) <= "reph233";
  ROMDATA(235) <= "reph234";
  ROMDATA(236) <= "reph235";
  ROMDATA(237) <= "reph236";
  ROMDATA(238) <= "reph237";
  ROMDATA(239) <= "reph238";
  ROMDATA(240) <= "reph239";
  ROMDATA(241) <= "reph240";
  ROMDATA(242) <= "reph241";
  ROMDATA(243) <= "reph242";
  ROMDATA(244) <= "reph243";
  ROMDATA(245) <= "reph244";
  ROMDATA(246) <= "reph245";
  ROMDATA(247) <= "reph246";
  ROMDATA(248) <= "reph247";
  ROMDATA(249) <= "reph248";
  ROMDATA(250) <= "reph249";
  ROMDATA(251) <= "reph250";
  ROMDATA(252) <= "reph251";
  ROMDATA(253) <= "reph252";
  ROMDATA(254) <= "reph253";
  ROMDATA(255) <= "reph254";
  ROMDATA(256) <= "reph255";
  ROMDATA(257) <= "reph256";
  ROMDATA(258) <= "reph257";
  ROMDATA(259) <= "reph258";
  ROMDATA(260) <= "reph259";
  ROMDATA(261) <= "reph260";
  ROMDATA(262) <= "reph261";
  ROMDATA(263) <= "reph262";
  ROMDATA(264) <= "reph263";
  ROMDATA(265) <= "reph264";
  ROMDATA(266) <= "reph265";
  ROMDATA(267) <= "reph266";
  ROMDATA(268) <= "reph267";
  ROMDATA(269) <= "reph268";
  ROMDATA(270) <= "reph269";
  ROMDATA(271) <= "reph270";
  ROMDATA(272) <= "reph271";
  ROMDATA(273) <= "reph272";
  ROMDATA(274) <= "reph273";
  ROMDATA(275) <= "reph274";
  ROMDATA(276) <= "reph275";
  ROMDATA(277) <= "reph276";
  ROMDATA(278) <= "reph277";
  ROMDATA(279) <= "reph278";
  ROMDATA(280) <= "reph279";
  ROMDATA(281) <= "reph280";
  ROMDATA(282) <= "reph281";
  ROMDATA(283) <= "reph282";
  ROMDATA(284) <= "reph283";
  ROMDATA(285) <= "reph284";
  ROMDATA(286) <= "reph285";
  ROMDATA(287) <= "reph286";
  ROMDATA(288) <= "reph287";
  ROMDATA(289) <= "reph288";
  ROMDATA(290) <= "reph289";
  ROMDATA(291) <= "reph290";
  ROMDATA(292) <= "reph291";
  ROMDATA(293) <= "reph292";
  ROMDATA(294) <= "reph293";
  ROMDATA(295) <= "reph294";
  ROMDATA(296) <= "reph295";
  ROMDATA(297) <= "reph296";
  ROMDATA(298) <= "reph297";
  ROMDATA(299) <= "reph298";
  ROMDATA(300) <= "reph299";
  ROMDATA(301) <= "reph300";
  ROMDATA(302) <= "reph301";
  ROMDATA(303) <= "reph302";
  ROMDATA(304) <= "reph303";
  ROMDATA(305) <= "reph304";
  ROMDATA(306) <= "reph305";
  ROMDATA(307) <= "reph306";
  ROMDATA(308) <= "reph307";
  ROMDATA(309) <= "reph308";
  ROMDATA(310) <= "reph309";
  ROMDATA(311) <= "reph310";
  ROMDATA(312) <= "reph311";
  ROMDATA(313) <= "reph312";
  ROMDATA(314) <= "reph313";
  ROMDATA(315) <= "reph314";
  ROMDATA(316) <= "reph315";
  ROMDATA(317) <= "reph316";
  ROMDATA(318) <= "reph317";
  ROMDATA(319) <= "reph318";
  ROMDATA(320) <= "reph319";
  ROMDATA(321) <= "reph320";
  ROMDATA(322) <= "reph321";
  ROMDATA(323) <= "reph322";
  ROMDATA(324) <= "reph323";
  ROMDATA(325) <= "reph324";
  ROMDATA(326) <= "reph325";
  ROMDATA(327) <= "reph326";
  ROMDATA(328) <= "reph327";
  ROMDATA(329) <= "reph328";
  ROMDATA(330) <= "reph329";
  ROMDATA(331) <= "reph330";
  ROMDATA(332) <= "reph331";
  ROMDATA(333) <= "reph332";
  ROMDATA(334) <= "reph333";
  ROMDATA(335) <= "reph334";
  ROMDATA(336) <= "reph335";
  ROMDATA(337) <= "reph336";
  ROMDATA(338) <= "reph337";
  ROMDATA(339) <= "reph338";
  ROMDATA(340) <= "reph339";
  ROMDATA(341) <= "reph340";
  ROMDATA(342) <= "reph341";
  ROMDATA(343) <= "reph342";
  ROMDATA(344) <= "reph343";
  ROMDATA(345) <= "reph344";
  ROMDATA(346) <= "reph345";
  ROMDATA(347) <= "reph346";
  ROMDATA(348) <= "reph347";
  ROMDATA(349) <= "reph348";
  ROMDATA(350) <= "reph349";
  ROMDATA(351) <= "reph350";
  ROMDATA(352) <= "reph351";
  ROMDATA(353) <= "reph352";
  ROMDATA(354) <= "reph353";
  ROMDATA(355) <= "reph354";
  ROMDATA(356) <= "reph355";
  ROMDATA(357) <= "reph356";
  ROMDATA(358) <= "reph357";
  ROMDATA(359) <= "reph358";
  ROMDATA(360) <= "reph359";
  ROMDATA(361) <= "reph360";
  ROMDATA(362) <= "reph361";
  ROMDATA(363) <= "reph362";
  ROMDATA(364) <= "reph363";
  ROMDATA(365) <= "reph364";
  ROMDATA(366) <= "reph365";
  ROMDATA(367) <= "reph366";
  ROMDATA(368) <= "reph367";
  ROMDATA(369) <= "reph368";
  ROMDATA(370) <= "reph369";
  ROMDATA(371) <= "reph370";
  ROMDATA(372) <= "reph371";
  ROMDATA(373) <= "reph372";
  ROMDATA(374) <= "reph373";
  ROMDATA(375) <= "reph374";
  ROMDATA(376) <= "reph375";
  ROMDATA(377) <= "reph376";
  ROMDATA(378) <= "reph377";
  ROMDATA(379) <= "reph378";
  ROMDATA(380) <= "reph379";
  ROMDATA(381) <= "reph380";
  ROMDATA(382) <= "reph381";
  ROMDATA(383) <= "reph382";
  ROMDATA(384) <= "reph383";
  ROMDATA(385) <= "reph384";
  ROMDATA(386) <= "reph385";
  ROMDATA(387) <= "reph386";
  ROMDATA(388) <= "reph387";
  ROMDATA(389) <= "reph388";
  ROMDATA(390) <= "reph389";
  ROMDATA(391) <= "reph390";
  ROMDATA(392) <= "reph391";
  ROMDATA(393) <= "reph392";
  ROMDATA(394) <= "reph393";
  ROMDATA(395) <= "reph394";
  ROMDATA(396) <= "reph395";
  ROMDATA(397) <= "reph396";
  ROMDATA(398) <= "reph397";
  ROMDATA(399) <= "reph398";
  ROMDATA(400) <= "reph399";

--------------------------------------------------------------
rd_data : process(RDN, CSN, ADDR_IN, ROMDATA)
begin -- process rd_data

  if(RDN = '0' and CSN = '0') then
    DOUT <= ROMDATA(ADDR_IN);
  else
    DOUT <= (others => 'Z');
  end if;

end process rd_data;

--------------------------------------------------------------
end; -- architecture rom

---------------------------------------------
-- sram.vhd
-- by Toshio Iwata Aug/01/00
-- DIOB bits x 512 words

library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_arith.all;

entity sram is
   Port (
          WRN : In std_logic;
          RDN : In std_logic;
          CSN : In std_logic;
          ADDR : In std_logic_vector(ADDB-1 downto 0);
          DIN : In std_logic_vector(DIOB-1 downto 0);
          DOUT : Out std_logic_vector(DIOB-1 downto 0) );
end sram;

architecture STRUCTURE of sram is

  subtype RAMWORD is std_logic_vector(DIOB-1 downto 0);
  type RAMARRAY is array (0 to 2**ADDB - 1) of RAMWORD;

  signal RAMDATA : RAMARRAY;
  signal ADDR_IN : integer range 0 to 2**ADDB - 1;
--  signal DIN_CHANGE, WRN_RISE : time := 0 ps;
  signal addr_tmp : unsigned(ADDB-1 downto 0);

begin -- architecture sram

-------------------------------------------------------------------
gen_addr_tmp : process( ADDR )
begin -- process gen_addr_tmp
 
  for i in ADDB-1 downto 0 loop
    addr_tmp(i) <= ADDR(i);
  end loop;
   
end process gen_addr_tmp;
 
  ADDR_IN <= conv_integer(addr_tmp);

--------------------------------------------------------------
wr_data : process(WRN)
begin -- process wr_data

  if(WRN'event and WRN = '1') then
    if(CSN = '0') then
      RAMDATA(ADDR_IN) <= DIN;
    end if;
  end if;
--  WRN_RISE <= NOW;
--  assert(NOW - DIN_CHANGE > 800 ps) 
--  report "Setup Error DIN(SRAM)"
--  severity WARNING;

end process wr_data;

--------------------------------------------------------------
rd_data : process(RDN, CSN, ADDR_IN, RAMDATA) -- modified Jul/21/00
begin -- process rd_data

  if(RDN = '0' and CSN = '0') then
    DOUT <= RAMDATA(ADDR_IN);
  else
    DOUT <= (others => 'Z');
  end if;

end process rd_data;

--------------------------------------------------------------
--hold_check : process(DIN)
--begin -- process hold_check
--
--  DIN_CHANGE <= NOW;
--  assert(NOW - WRN_RISE > 300 ps) 
--  report "Hold Error DIN(SRAM)"
--  severity WARNING;
--
--end process hold_check;
--
-------------------------------------------------------------------
end; -- architecture sram

---------------------------------------------
-- memctrl.vhd
-- by Toshio Iwata Aug/01/00
-- generate signals to control sram and rom

library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_arith.all;

entity memctrl is
   Port (
          RST : In std_logic; -- reset
          MCLK : In std_logic; -- 384/512Fs
          FSCLK : In std_logic; -- Fs (a clock synchronized with input data)
          FSCLK_EDGE : In std_logic;
          ACCENB : Out std_logic;
          ACCLAT : Out std_logic;
          ROMRDN : Out std_logic;
          ROMCSN : Out std_logic;
          ROMADDR : Out std_logic_vector(8 downto 0);
          SRAMWRN : Out std_logic;
          SRAMRDN : Out std_logic;
          SRAMCSN : Out std_logic;
          SRAMADDR : Out std_logic_vector(8 downto 0) );
end memctrl;

architecture STRUCTURE of memctrl is

  signal counter_512 : unsigned( 8 downto 0 );
  signal down_counter_512 : unsigned( 8 downto 0 );
  signal sramaddr_tmp : unsigned( 8 downto 0 );

begin -- architecture memctrl

--------------------------------------------------------------
  gen_counter_512 : process( RST, MCLK )
  begin -- process gen_counter_512
 
    if( RST = '1' ) then
      counter_512 <= "000000000";
    elsif( MCLK'event and MCLK = '1' ) then
      if( FSCLK_EDGE = '1' ) then
        counter_512 <= "000000000";
      else
        counter_512 <= counter_512 + 1;
      end if;
    end if;
 
  end process gen_counter_512;

--------------------------------------------------------------
  gen_down_counter_512 : process( RST, MCLK )
  begin -- process gen_down_counter_512
 
    if( RST = '1' ) then
      down_counter_512 <= "111111111";
    elsif( MCLK'event and MCLK = '1' ) then
      if( FSCLK_EDGE = '1' ) then
        if( down_counter_512 = 0 ) then
          down_counter_512 <= "111111111";
        else
          down_counter_512 <= down_counter_512 - 1;
        end if;
      end if;
    end if;
 
  end process gen_down_counter_512;

--------------------------------------------------------------
gen_ROMADDR : process( counter_512 )
begin 
  for i in 8 downto 0 loop
    ROMADDR(i) <= counter_512(i);
  end loop;
end process gen_ROMADDR;

--------------------------------------------------------------
gen_ROMRDN : process( MCLK, counter_512 )
begin -- process gen_ROMRDN
 
  if( counter_512 >= 1 and counter_512 <= TAPN and MCLK = '0') then
    ROMRDN <= '0';
  else
    ROMRDN <= '1';
  end if;
 
end process gen_ROMRDN;

--------------------------------------------------------------
gen_ROMCSN : process( counter_512 )
begin -- process gen_ROMCSN
 
  if( counter_512 >= 1 and counter_512 <= TAPN ) then
    ROMCSN <= '0';
  else
    ROMCSN <= '1';
  end if;
 
end process gen_ROMCSN;

-------------------------------------------------------------------
  sramaddr_tmp <= counter_512 + down_counter_512; -- adder

--------------------------------------------------------------
gen_ACCLAT : process( RST, MCLK )
begin -- process gen_ACCLAT

  if( RST = '1' ) then
    ACCLAT <= '0';
  elsif( MCLK'event and MCLK = '1' ) then
    if( counter_512 = TAPN + 2 ) then
      ACCLAT <= '1';
    else
      ACCLAT <= '0';
    end if;
  end if;

end process gen_ACCLAT;

--------------------------------------------------------------
gen_SRAMADD : process( sramaddr_tmp )
begin 
  for i in 8 downto 0 loop
    SRAMADDR(i) <= sramaddr_tmp(i);
  end loop;
end process gen_SRAMADD;
 
--------------------------------------------------------------
gen_SRAMWRN : process( MCLK, counter_512 )
begin -- process gen_SRAMWRN
 
  if( counter_512 = 0 and MCLK = '0') then
    SRAMWRN <= '0';
  else
    SRAMWRN <= '1';
  end if;
 
end process gen_SRAMWRN;

--------------------------------------------------------------
gen_SRAMRDN : process( MCLK, counter_512 )
begin -- process gen_SRAMRDN
 
  if( counter_512 >= 1 and counter_512 <= TAPN and MCLK = '0') then
    SRAMRDN <= '0';
  else
    SRAMRDN <= '1';
  end if;
 
end process gen_SRAMRDN;

--------------------------------------------------------------
gen_ACCENB : process( counter_512 )
begin -- process gen_ACCENB
 
  if( counter_512 >= 3 and counter_512 <= TAPN + 2 ) then
    ACCENB <= '1';
  else
    ACCENB <= '0';
  end if;
 
end process gen_ACCENB;

--------------------------------------------------------------
gen_SRAMCSN : process( counter_512 )
begin -- process gen_SRAMCSN
 
  if( counter_512 <= TAPN ) then
    SRAMCSN <= '0';
  else
    SRAMCSN <= '1';
  end if;
 
end process gen_SRAMCSN;

end; -- architecture memctrl

---------------------------------------------
-- divider.vhd
-- by Toshio Iwata Aug/01/00
-- Divider to generate clocks
-- Master clock is 384/512Fs (MCLK) -- input

library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_arith.all;

entity divider is
   Port (
          RST : In std_logic; -- reset
          FSCLK : In std_logic; -- Fs (a clock synchronized with input data)
          FSCLK_EDGE : Out std_logic;
          MCLK : In std_logic ); -- 384/512Fs (master clock)
end divider;

architecture STRUCTURE of divider is

  signal counter_2 : unsigned( 1 downto 0 );
  signal fsclk_delay1 : std_logic;
  signal fsclk_delay2 : std_logic;

begin -- architecture divider

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
FSCLK_EDGE <= fsclk_delay1 and not fsclk_delay2;

-------------------------------------------------------------------
end; -- architecture divider

---------------------------------------------
-- multiplier_mxn.vhd
-- by Toshio Iwata Aug/01/00
-- Multiplier COB bits x DIOB bits (signed, has polarity bits)

library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_arith.all;

entity multiplier_mxn is
   Port (
          RST : In std_logic; -- reset
          MCLK : In std_logic; -- 384/512Fs
          COEFF_IN : In std_logic_vector( COB-1 downto 0 ); -- coefficients
          DATA_IN : In std_logic_vector( DIOB-1 downto 0 ); -- input data
          MULTIPLIED_OUT : Out std_logic_vector( DIOB+8-1 downto 0 ) ); -- multiplication results
end multiplier_mxn;

architecture STRUCTURE of multiplier_mxn is

  signal coeff_tmp : signed( COB-1 downto 0 );
  signal data_tmp : signed( DIOB-1 downto 0 );
  signal mul_tmp : signed( COB+DIOB-1 downto 0 );

begin -- architecture multiplier_mxn
-------------------------------------------------------------------
gen_coeff_tmp : process( RST, MCLK )
begin -- process gen_coeff_tmp

if(RST = '1') then
  coeff_tmp <= (others => '0');
elsif( MCLK'event and MCLK = '1' ) then
  for i in COB-1 downto 0 loop
    coeff_tmp(i) <= COEFF_IN(i);
  end loop;
end if;

end process gen_coeff_tmp;

-------------------------------------------------------------------
gen_data_tmp : process( RST, MCLK )
begin -- process gen_data_tmp

if(RST = '1') then
  data_tmp <= (others => '0');
elsif( MCLK'event and MCLK = '1' ) then
  for i in DIOB-1 downto 0 loop
    data_tmp(i) <= DATA_IN(i);
  end loop;
end if;

end process gen_data_tmp;

-------------------------------------------------------------------
  mul_tmp <= coeff_tmp * data_tmp;

-------------------------------------------------------------------
gen_MULTIPLIED_OUT : process( RST, MCLK )
begin -- process gen_MULTIPLIED_OUT

if(RST = '1') then
  MULTIPLIED_OUT <= (others => '0');
elsif( MCLK'event and MCLK = '1' ) then
  MULTIPLIED_OUT(DIOB+8-1) <= mul_tmp(COB+DIOB-1);
  for i in DIOB+8-2 downto 0 loop
    if((i + COB-8-1) < 0) then
      MULTIPLIED_OUT(i) <= '0';
    else 
      MULTIPLIED_OUT(i) <= mul_tmp(i + COB-8-1);
    end if;
  end loop;
end if;

end process gen_MULTIPLIED_OUT;


-------------------------------------------------------------------
end; -- architecture multiplier_mxn

-----------------------------------------------
-- accumulator.vhd
-- by Toshio Iwata Aug/01/00
-- Accumulator
-- Sum up multiplied five data to get filtered output
-- We have only one full adder (DIOB+8 bits + DIOB+12 bits)

library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_arith.all;

entity accumulator is
   Port (
          RST : In std_logic; -- reset
          MCLK : In std_logic; -- 384/512Fs
          FSCLK : In std_logic; -- Fs
          A_IN : In std_logic_vector(DIOB+8-1 downto 0); -- an input to adder
          ACCENB : In std_logic; -- accumulation enable
          ACCLAT : In std_logic; -- accumulation latch
          ACC_OUT : Out std_logic_vector(DIOB-1 downto 0) ); -- accumulated data
end accumulator;

architecture STRUCTURE of accumulator is

  signal A_tmp : signed( DIOB+8-1 downto 0 );
  signal B_tmp : signed( DIOB+12-1 downto 0 );
  signal C_tmp : signed( DIOB+12-1 downto 0 );
  signal ACC_tmp : signed( DIOB+12-1 downto 0 );
  signal acc_round : signed( DIOB+12-1 downto 0 );
  signal acc_latout : std_logic_vector( DIOB-1 downto 0 );

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
gen_ACC_tmp : process( RST, MCLK ) -- accumulator
begin -- process gen_ACC_tmp

  if(RST = '1') then
    ACC_tmp <= (others => '0');
  elsif( MCLK'event and MCLK = '1' ) then
    if( ACCENB = '0' ) then
      ACC_tmp <= (others => '0');
    elsif( ACCENB = '1' ) then
      ACC_tmp <= C_tmp;
    end if;
  end if;

end process gen_ACC_tmp;

-------------------------------------------------------------------    
  acc_round <= ACC_tmp + 128; -- to round it on eighth bit

-------------------------------------------------------------------                   
gen_acc_latout : process( RST, MCLK ) -- to pick up accumulated data
begin -- process gen_acc_latout
 
  if( RST = '1' ) then
    acc_latout <= (others => '0');
  elsif( MCLK'event and MCLK = '1' ) then
    if( ACCLAT = '1' ) then
      if (acc_round(DIOB+12-1) = '0' and  
         (acc_round(DIOB+12-2) = '1' 
       or acc_round(DIOB+12-3) = '1' 
       or acc_round(DIOB+12-4) = '1' 
       or acc_round(DIOB+12-5) = '1') ) then -- overflow
--        acc_latout <= "011111111111";
        acc_latout <= (others => '1');
        acc_latout(DIOB-1) <= '0';
      elsif (acc_round(DIOB+12-1) = '1' and 
            (acc_round(DIOB+12-2) = '0' 
          or acc_round(DIOB+12-3) = '0' 
          or acc_round(DIOB+12-4) = '0' 
          or acc_round(DIOB+12-5) = '0') ) then -- underflow
--        acc_latout <= "100000000000";
        acc_latout <= (others => '0');
        acc_latout(DIOB-1) <= '1';
      else
        for i in DIOB-1 downto 0 loop 
          acc_latout(i) <= acc_round(i + 8);
        end loop; 
      end if;
    end if;
  end if;
  
end process gen_acc_latout; 
 
-------------------------------------------------------------------
gen_ACC_OUT : process( RST, FSCLK )
begin -- process gen_ACC_OUT

  if(RST = '1') then
    ACC_OUT <= (others => '0');
  elsif( FSCLK'event and FSCLK = '1' ) then
    ACC_OUT <= acc_latout;
  end if;

end process gen_ACC_OUT;

-------------------------------------------------------------------    
end; -- architecture accumulator

---------------------------------------------
-- fir_top.vhd
-- by Toshio Iwata Aug/01/00
-- The top module of FIR Filter

library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_arith.all;

entity fir_top is
   Port (
          RST : In std_logic; -- reset
          FSCLK : In std_logic; -- Fs (a clock synchronized with input data)
          D_IN : In std_logic_vector(DIOB-1 downto 0); -- input data is DIOB bits
          MCLK : In std_logic; -- 384Fs (master clock)
          D_OUT : Out std_logic_vector(DIOB-1 downto 0) ); -- filtered data output
end fir_top;

architecture STRUCTURE of fir_top is

  signal mul_signal : std_logic_vector(DIOB+8-1 downto 0);
  signal fsclk_edge_signal : std_logic;
  signal accenb_signal : std_logic;
  signal acclat_signal : std_logic;
  signal romrdn_signal : std_logic;
  signal romcsn_signal : std_logic;
  signal romaddr_signal : std_logic_vector(8 downto 0);
  signal romdout_signal : std_logic_vector(COB-1 downto 0);
  signal sramwrn_signal : std_logic;
  signal sramrdn_signal : std_logic;
  signal sramcsn_signal : std_logic;
  signal sramaddr_signal : std_logic_vector(8 downto 0);
  signal sramdout_signal : std_logic_vector(DIOB-1 downto 0);

component divider
Port (
          RST : In std_logic;
          FSCLK : In std_logic;
          FSCLK_EDGE : Out std_logic;
          MCLK : In std_logic );
end component;

component multiplier_mxn
Port (
          RST : In std_logic;
          MCLK : In std_logic;
          COEFF_IN : In std_logic_vector( COB-1 downto 0 );
          DATA_IN : In std_logic_vector( DIOB-1 downto 0 );
          MULTIPLIED_OUT : Out std_logic_vector( DIOB+8-1 downto 0 ) );
end component;

component accumulator
Port (
          RST : In std_logic;
          MCLK : In std_logic;
          FSCLK : In std_logic;
          A_IN : In std_logic_vector(DIOB+8-1 downto 0);
          ACCENB : In std_logic;
          ACCLAT : In std_logic;
          ACC_OUT : Out std_logic_vector(DIOB-1 downto 0) );
end component;

component rom
   Port (
          RDN : In std_logic;
          CSN : In std_logic;
          ADDR : In std_logic_vector(8 downto 0);
          DOUT : Out std_logic_vector(COB-1 downto 0) );
end component;

component sram
   Port (
          WRN : In std_logic;
          RDN : In std_logic;
          CSN : In std_logic;
          ADDR : In std_logic_vector(8 downto 0);
          DIN : In std_logic_vector(DIOB-1 downto 0);
          DOUT : Out std_logic_vector(DIOB-1 downto 0) );
end component;

component memctrl
   Port (
          RST : In std_logic;
          MCLK : In std_logic;
          FSCLK : In std_logic;
          FSCLK_EDGE : In std_logic;
          ACCENB : Out std_logic;
          ACCLAT : Out std_logic;
          ROMRDN : Out std_logic;
          ROMCSN : Out std_logic;
          ROMADDR : Out std_logic_vector(8 downto 0);
          SRAMWRN : Out std_logic;
          SRAMRDN : Out std_logic;
          SRAMCSN : Out std_logic;
          SRAMADDR : Out std_logic_vector(8 downto 0) );
end component;

begin -- architecture fir_top

divider_1: divider port map (
          RST => RST,
          FSCLK => FSCLK,
          FSCLK_EDGE => fsclk_edge_signal,
          MCLK => MCLK );

multiplier_mxn_1: multiplier_mxn port map ( 
          RST => RST, 
          MCLK => MCLK, 
          COEFF_IN => romdout_signal, 
          DATA_IN => sramdout_signal, 
          MULTIPLIED_OUT => mul_signal); 

accumulator_1: accumulator port map ( 
          RST => RST, 
          MCLK => MCLK, 
          FSCLK => FSCLK, 
          A_IN => mul_signal, 
          ACCENB => accenb_signal, 
          ACCLAT => acclat_signal, 
          ACC_OUT => D_OUT); 

rom_1: rom port map ( 
          RDN => romrdn_signal, 
          CSN => romcsn_signal, 
          ADDR => romaddr_signal, 
          DOUT => romdout_signal); 

sram_1: sram port map ( 
          WRN => sramwrn_signal, 
          RDN => sramrdn_signal, 
          CSN => sramcsn_signal, 
          ADDR => sramaddr_signal, 
          DIN => D_IN, 
          DOUT => sramdout_signal); 

memctrl_1: memctrl port map ( 
          RST => RST, 
          MCLK => MCLK, 
          FSCLK => FSCLK, 
          FSCLK_EDGE => fsclk_edge_signal, 
          ACCENB => accenb_signal, 
          ACCLAT => acclat_signal, 
          ROMRDN => romrdn_signal, 
          ROMCSN => romcsn_signal, 
          ROMADDR => romaddr_signal, 
          SRAMWRN => sramwrn_signal, 
          SRAMRDN => sramrdn_signal, 
          SRAMCSN => sramcsn_signal, 
          SRAMADDR => sramaddr_signal); 

end; -- architecture fir_top

