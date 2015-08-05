!clipbrd.pan - clipboard parameters
@f{_fg1}
@b{_bg1}
@panel
@apply

Clipboard

Clipboard Formats <L>
    Text <% c                  t{'" ASCII Text "'}                      >~setvar("_cbf1", <{_cbf1}>)~<0><1>
  Bitmap <% c x{-1} y{-1}      t{'" Device Independent Bitmap "'}       >~setvar("_cbf2", <{_cbf2}>)~<0><1>
! XlTable <% c x{-1} y{-1}      t{'" Excel Style Binary Table "'}        >~setvar("_cbf8", <{_cbf8}>)~<0><1>
Enhanced Metafile <% c         t{'" Enhanced Metafile Picture (EMF) "'} >~setvar("_cbf4", <{_cbf4}>)~<0><1>
WMF Metafile <% c x{-1} y{-1}  t{'" Windows Metafile Picture (WMF) "'}  >~setvar("_cbf16", <{_cbf16}>)~<0><1>
 XlTable <% c                  t{'" Excel Style Binary Table "'}        >~setvar("_cbf8", <{_cbf8}>)~<0><1>
<>
Column Delimiters for Copy <L>

 &Tab         <c % w{15}       t{"' ASCII Code 9 '"}    >~setvar('_cbctab',   '<{_cbctab}>')~<0><1>
 &Comma       <c % x{-1} y{-1} t{"' ASCII Code 44 '"}   >~setvar('_cbccomma', '<{_cbccomma}>')~<0><1>
 &Space       <c % w{15}       t{"' ASCII Code 32 '"}   >~setvar('_cbcspace', '<{_cbcspace}>')~<0><1>
 S&emicolon   <c % x{-1} y{-1} t{"' ASCII Code 59 '"}   >~setvar('_cbcsemi',  '<{_cbcsemi}>')~<0><1>
              <  % w{15}       e{_cbcother}   >~setvar('_cbcotherstr', '<{_cbcotherstr}>')~_INLIT("Input Delimiter")
 &Other       <c # w{15} x{-1} y{-1} t{"' Custom Delimiters '"}    >~setvar('_cbcother', '<{_cbcother}>')~<0><1>
 Add Header on Copy <c % x{-3} y{-1} t{"' Include Column Header on Series Copy '"} >~setvar("_cbchead", '<{_cbchead}>')~<0><1>
 <>
Column Delimiters for Paste <L>

 &Tab         <c % w{15}       t{"' ASCII Code 9 '"}    >~setvar('_cbtab',   '<{_cbtab}>')~<0><1>
 &Comma       <c % x{-1} y{-1} t{"' ASCII Code 44 '"}   >~setvar('_cbcomma', '<{_cbcomma}>')~<0><1>
 &Space       <c % w{15}       t{"' ASCII Code 32 '"}   >~setvar('_cbspace', '<{_cbspace}>')~<0><1>
 S&emicolon   <c % x{-1} y{-1} t{"' ASCII Code 59 '"}   >~setvar('_cbsemi',  '<{_cbsemi}>')~<0><1>
              <  % w{15}       e{_cbother}   >~setvar('_cbotherstr', '<{_cbotherstr}>')~_INLIT("Input Delimiter")
 &Other       <c # w{15} x{-1} y{-1} t{"' Custom Delimiters '"}    >~setvar('_cbother', '<{_cbother}>')~<0><1>
 T&reat Consecutive Delimiters as One <c % x{-3} y{-1} t{"' Skip Multiple Delimiters Between Values '"} >~setvar("_clipboard_skip_delimiters", '<{_clipboard_skip_delimiters}>')~<0><1>
 <L>
 Pre-scan Table for Columns           <c %             t{"' Scan Clipboard Data to Determine Number of Columns '"} >~setvar("_cbautocl", '<{_cbautocl}>')~<0><1>
{_defsetstr} <# b x{-1} y{-1} >~~_defcbrd()
 <>



~_mc

~_setcbf(1, _cbf1);_setcbf(2, _cbf2);_setcbf(4, _cbf4);_setcbf(8, _cbf8);_setcbf(16, _cbf16)
~_setcbdl(_cbtab, _cbspace, _cbcomma, _cbsemi, _cbother, _cbotherstr)
~_setcbdl(_cbctab, _cbcspace, _cbccomma, _cbcsemi, _cbcother, _cbcotherstr, 1)
~setconf("clipboard_skip_delimiters", _clipboard_skip_delimiters)
~setconf("clipboard_autocol", _cbautocl)
~setconf("clipboard_header", _cbchead)
