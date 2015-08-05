! setwmarg.pan
@panel
@h
  SETALLWMARGIN Set Plot Margins for ALL Displayed Windows

{defvar("_lmgpval", "15")}
{defvar("_rmgpval", "15")}
{defvar("_tmgpval", "15")}
{defvar("_bmgpval", "15")}

{if(_lmgauto, setvar("_lmgpc", "-1"), if(_lmgpc=="-1",setvar("_lmgpc", _lmgpval)))}
{if(_rmgauto, setvar("_rmgpc", "-1"), if(_rmgpc=="-1",setvar("_rmgpc", _rmgpval)))}
{if(_tmgauto, setvar("_tmgpc", "-1"), if(_tmgpc=="-1",setvar("_tmgpc", _tmgpval)))}
{if(_bmgauto, setvar("_bmgpc", "-1"), if(_bmgpc=="-1",setvar("_bmgpc", _bmgpval)))}

           Set Margins from 0 to 100% of Plotting Area
<l>
   Top Margin % :    <% e{_tmgauto==0} d{0} u{100} w{20} >~setvar("_tmgpc", _fromauto('<{_toauto(_tmgpc)}>'));if(_tmgpc!="-1",setvar("_tmgpval",_tmgpc))~input(1, 0.0, 100.0)
   {_automaticstr}   <# c  x{-1} y{-1}                       >~setvar("_tmgauto", <{_tmgauto}>)~<0><1>

   Bottom Margin % : <% e{_bmgauto==0} d{0} u{100} w{20} >~setvar("_bmgpc", _fromauto('<{_toauto(_bmgpc)}>'));if(_bmgpc!="-1",setvar("_bmgpval",_bmgpc))~input(1, 0.0, 100.0)
   {_automaticstr}   <# c  x{-1} y{-1}                       >~setvar("_bmgauto", <{_bmgauto}>)~<0><1>
<>
   Left Margin % :   <%  e{_lmgauto==0} d{0} u{100} w{20} >~setvar("_lmgpc", _fromauto('<{_toauto(_lmgpc)}>'));if(_lmgpc!="-1",setvar("_lmgpval",_lmgpc))~input(1, 0.0, 100.0)
   {_automaticstr}   <# c  x{-1} y{-1}                       >~setvar("_lmgauto", <{_lmgauto}>)~<0><1>

   Right Margin % :  <% e{_rmgauto==0} d{0} u{100} w{20} >~setvar("_rmgpc", _fromauto('<{_toauto(_rmgpc)}>'));if(_rmgpc!="-1",setvar("_rmgpval",_rmgpc))~input(1, 0.0, 100.0)
   {_automaticstr}   <# c  x{-1} y{-1}                       >~setvar("_rmgauto", <{_rmgauto}>)~<0><1>

<L>

~_mc
~setallwmargin(1,castreal(_lmgpc),0);setallwmargin(2,castreal(_rmgpc),0);
~setallwmargin(3,castreal(_tmgpc),0);setallwmargin(4,castreal(_bmgpc),0);
~redrawall(1)



