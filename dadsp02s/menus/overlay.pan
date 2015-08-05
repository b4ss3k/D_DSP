! Overlay.pan - inputs a series and an integer              
@f{_fg1}
@b{_bg1}
@panel
@h
Overlay Series
 <L>
 Series to Overlay:      <          >~_DEFSER1(strcat("'",_tocurr("<{_frmcurr(_SER1)}>"),"'"))~_INSER("Series or Window")
 Window to Overlay Into: <          >~_DEFWIN(strcat("'","<{_WIN}>","'")~_INWIN("Window to Overlay") 
 Sync Mode:              <          >~defmacro("_int1",<{_int1}>,1)~_MF("sync.men")
 <L>
 {_cwinstr}
 <L>

~setvar("_dwin", _getcwin)
~_verifydwin(eval('_ser1'))
~if(_chkwin > 0, overlay(eval(_ser1),eval(_WIN),_int1))
