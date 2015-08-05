! dt.pan
@f{_fg1}
@b{_bg1}
@panel

 Date/Time

Data/Time Axes                <% R n x{5}                       t{'" Short Axis Display of Date or Time | Full Axis Display of Date and Time "'} >~setvar("_tpsfmt", "<{_tpsfmt}>")~<Display Either Date or Time><Display Both Date and Time><>
Year Month Date Display Order <# R n x{-1} y{-1}                t{'" Month Day Year | Day Month Year | Year Month Day "'}                        >~setvar("_tplidt", "<{_tplidt}>")~<MDY><DMY><YMD>
<>
Date Format:                  <% e{_tpdauto==0}   n{1} w{30}    t{'" Format for Date Display "'}                                                 >~setvar("_tddfmt",  <{_tddfmt}>)~<{_gdtdfmt(2, _tplidt)}><{_gdtdfmt(3, _tplidt)}><{_gdtdfmt(1, _tplidt)}><{_gdtdfmt(4, _tplidt)}><{_gdtdfmt(7, _tplidt)}>
Automatic                     <# c x{-1} y{-1}                  t{'" Use Default Date Format "'}                        >~setvar("_tpdauto", <{_tpdauto}>);if(_tpdauto, setvar("_tddfmt", 0))~<0><1>
Time Format:                  <% e{_tptauto==0}   n{1} w{30}    t{'" Format for Time Display "'}                                                 >~setvar("_tdtfmt",  <{_tdtfmt}>)~<{_gdttfmt(8, _tprec)}><{_gdttfmt(9, _tprec)}><{_gdttfmt(10, _tprec)}><{_gdttfmt(13, _tprec)}><{_gdttfmt(23, _tprec)}><{_gdttfmt(24, _tprec)}><{_gdttfmt(25, _tprec)}>
Automatic                     <# c x{-1} y{-1}                  t{'" Use Default Time Format "'}                        >~setvar("_tptauto", <{_tptauto}>);if(_tptauto, setvar("_tdtfmt", 0))~<0><1>
Time Axes Precision:          <# e{_tpauto==0} u{10} d{0} w{30} t{'" Number of Decimal Places for Seconds "'}                                    >~setvar("_tprec", <{_gtprec(_tprec, _tpauto)}>)~input(2, Input Time Precision, 0, 10)
Automatic                     <# c x{-1} y{-1}                  t{'" Use Default Number of Decimal Places for Seconds "'}                        >~setvar("_tpauto", <{_tpauto}>);if(_tpauto, setvar("_tprec", 3))~<0><1>
<>
 Y2K Handling <L>
<>
 2 Digit Missing Century Processing <R n # x{5} t{sprintf('" Assume Current Century for 2 Digit Year | Check Forward and Backward %s Years from Current Date "', getconf("DT_Y2K_OFFSET"))}>~setconf("DT_Y2K_FORMAT", "<{getconf('DT_Y2K_FORMAT')}>")~<Use Current Century><Use N Year Window>
 <y{-1}>
 <>
 <>
 <x{-2}>
            N Year Window Width: <# x{-1} y{-1} w{20} u{99} d{1} e{getconf("DT_Y2K_FORMAT")=="1"} t{'" Number of Years to Check from Current Date "'}>~setconf("DT_Y2K_OFFSET", "<{getconf('DT_Y2K_OFFSET')}>")~input(2, "Input Year Window", 1, 99)
<>
{_defsetstr} <# b  >~~_defprec()

~_mc
~if(_tpauto, setconf("TIME_PRECISION", "-1"), setconf("TIME_PRECISION", strnum(_tprec)))
~if(_tpsfmt != getconf("DT_SCALES_FORMAT"), setconf("DT_SCALES_FORMAT", _tpsfmt);_rdraw=1)
~if(_tplidt != getconf("LOCALE_IDATE"), setconf("LOCALE_IDATE", _tplidt);_rdraw=1)
~if(caststring(_dtd2fmt(_tddfmt)) != getconf("DT_DATE_FORMAT"),setconf("DT_DATE_FORMAT", caststring(_dtd2fmt(_tddfmt)));_rdraw=1)
~if(caststring(_dtt2fmt(_tdtfmt)) != getconf("DT_TIME_FORMAT"),setconf("DT_TIME_FORMAT", caststring(_dtt2fmt(_tdtfmt)));_rdraw=1)

