! Rtdelim.pan - readtable field delimiters
@f{_fg1}
@b{_bg1}
@panel

{defvar("_rtbufs", 1)}
{defvar("_rtnan", 1);defvar("_rtnanstr", getconf("READT_NA"))}
{defvar("_rtinf", 1);defvar("_rtinfstr", getconf("READT_INF"))}
Column Delimiters
{_setrtdl(_rttab, _rtspace, _rtcomma, _rtsemi, _rtother, _rtotherstr);}
 <>
 &Tab         <c # w{15}       t{"' ASCII Code 9 '"}    >~_DEFRTTAB('<{_getrtdl(strescape("\t"))}>')~<0><1>
 &Comma       <c # x{-1} y{-1} t{"' ASCII Code 44 '"}   >~_DEFRTCOMMA('<{_getrtdl(",")}>')~<0><1>
 &Space       <c # w{15}       t{"' ASCII Code 32 '"}    >~_DEFRTSPACE('<{_getrtdl(" ")}>')~<0><1>
 S&emicolon   <c # x{-1} y{-1} t{"' ASCII Code 59 '"}    >~_DEFRTSEMI('<{_getrtdl(";")}>')~<0><1>
             <  # w{30}       e{_rtother}   >~_DEFRTOTHERSTR('<{_getrtos()}>')~_INLIT("Input Delimiter")
 &Other       <c # x{-1} y{-1} t{"' Custom Delimiters '"}    >~_DEFRTOTHER('<{_rtother}>')~<0><1>
 <L>
 T&reat Consecutive Delimiters as One <c # t{"' Skip Multiple Delimiters Between Values '"} >~setvar("_readt_skip_delimiters", '<{getvar("_readt_skip_delimiters")}>')~<0><1>
<L>
 Text for &NAN Values <% j{3} w{30} e{not(_rtnan)} t{"' Text Template for Not a Number Values '"}>~setvar("_rtnanstr", "<{_rtnanstr}>")~input(5)
 &Default           <# c x{-1} y{-1} w{10} t{"' Use the Default NAN Text Template '"}>~setvar("_rtnan", <{_rtnan}>);if(_rtnan,setvar("_rtnanstr", getconf("READT_NA")))~<0><1>
 Text for &INF Values <% j{3} w{30} x{-1} y{-1} e{not(_rtinf)} t{"' Text Template for Infinity Values '"}>~setvar("_rtinfstr", "<{_rtinfstr}>")~input(5)
 &Default           <# c x{-1} y{-1} t{"' Use the Default INF Text Template '"}>~setvar("_rtinf", <{_rtinf}>);if(_rtinf,setvar("_rtinfstr", getconf("READT_INF")))~<0><1>
<L>
 &View       <b   t{'" View File Contents "'}> ~~if(strlen(_rtfname) > 0, menureturn();viewfile(caststring(_rtfname), 1, 100, 1, 1))
 &Preview    <b   x{-1} y{-1} t{'" Preview Result "'}    > ~~if(strlen(_rtfname) > 0, _prert(_rtfname, eval(_rtoffset), eval(_rtstartcol), eval(_rthex), (_rtcollist), _readt_delimiters, eval(_readt_skip_delimiters)))
<L>
 &Maximum Line Length   <% j{3} w{30} e{not(_rtbufs)} t{"' Maximum Number of Characters per Line '"}>~setconf("READT_BUFSIZE", '<{getconf("READT_BUFSIZE")}>')~input(2, 1024)
 &Default               <# c x{-1} y{-1} w{10} t{"' Use the Default Maximum Number of Characters per Line '"}>~setvar("_rtbufs", <{_rtbufs}>);if(_rtbufs,setconf("READT_BUFSIZE", getconfdefault("READT_BUFSIZE")))~<0><1>
 Default &Numeric Value <% j{3} w{30}  x{-1} y{-1} t{'" Default Numeric Value for Unrecognized Values "'}>~setvar("_rtdefval", <{_rtdefval}>)~input(1)

<L>

~setconf("readt_default_value", caststring(_rtdefval))
