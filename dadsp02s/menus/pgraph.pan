! pgraph.pan - Inputs two series
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}
 <L>
 {_ser1prompt} <*                   >~_DEFSER1(strcat("'","<{_frmcurr(_SER1)}>","'"))~_pickser(_ser1)
 {_ser2prompt} <*                   >~_DEFSER2(strcat("'","<{_frmcurr(_SER2)}>","'"))~_pickser(_ser2)
 Extract X Values  <c x{-1} y{-1}      >~_DEFPGXV('<{_PGXV}>')~<0><1>
 <L>
 Output as XY Plot  <c                  >~_DEFPGXY('<{_PGXY}>')~<0><1>
 <L>
 {_dwinstr}
 <L>
~if(strcmp(_ser1,_dwin)==0,_DEFSER1("'curr'"));if(strcmp(_ser2,_dwin)==0,_DEFSER2("'curr'"))
~_verifydwin2(eval('_ser1'), eval('_ser2'))
~_formstr = if(_chkwinok,_pgraph("Polygraph", eval('_ser1'), eval('_ser2'), eval('_pgxv'), eval('_pgxy'), eval('_dwin')), "")
~if(strlen(_formstr) > 0, eval(_formstr);eval(sprintf("setplotstyle(%s, 0)", _dwin)))
