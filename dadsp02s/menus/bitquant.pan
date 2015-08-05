! bitquant.pan - inputs a series and two integers              
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}

{defvar("_bqbit", 8);defvar("_qrchk", 0)}

 <L>
 {_serprompt } <* #           >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 {_int1prompt} <d{1}          >~setvar("_bqbit", <{_bqbit}>)~_ININT("Integer Number")
 <L>
 {_chk1prompt} <c #          >~setvar("_qrchk", <{_qrchk}>)~<0><1>
<L>
 {_r1prompt} <e{_qrchk}     >~setvar("_qxl", <{min(eval(_ser1))}>)~_INREAL("Low")
 {_r2prompt} <e{_qrchk}     >~setvar("_qxh", <{max(eval(_ser1))}>)~_INREAL("Hi")
 <L>
 {_dwinstr}
 <L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"))
~_verifydwin(eval('_ser1'))

~if(_checkdwin, if(_qrchk, eval(sprintf("setwf(%s, 'Bitquant(%s, %d, %g, %g)')", eval('_dwin'), eval('_ser1'), _bqbit, _qxl, _qxh)), eval(sprintf("setwf(%s, 'Bitquant(%s, %d)')", eval('_dwin'), eval('_ser1'), _bqbit))))
