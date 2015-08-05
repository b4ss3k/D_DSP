! label.pan
@b{_bg2}
@f{_fg2}
@panel
@justifylabels 3
@h~help("label")
@form

{if(_intabbed, "Labels", strcat("Window Labels for W", strnum(getwnum)))}

{if(not(menuinrefresh()), init_label_pan())}

{if(_intabbed, "<>")}
         Window Label : < w{80} e{not(_cwlab)} skip{1} >  ~noop(<{_wlabel}>)~ _wlab=1;_wlabel = input(5);_wlabel
                  Clear <# c x{-1} y{-1} e{getlabel != getwform} t{"' Clear Window Label and Set to Formula '"}>~setvar("_cwlab", <{_cwlab}>)~<0><1>
<L>
   Vertical Label (Y) : < w{80} e{not(_cylab)} skip{1} >  ~noop(<{_vlabel}>)~ _vlab=1; _tmp = input(5); _vlabel = if(valuetype(_tmp)==4, _tmp, getvunits); _vlabel
                  Clear <# c x{-1} y{-1} e{getylabel != getvunits} t{"' Clear Y Label and Set to Y Units '"}>~setvar("_cylab", <{_cylab}>)~<0><1>
<L>
 Horizontal Label (X) : < w{80} e{not(_cxlab)} skip{1} >  ~noop(<{_hlabel}>)~ _hlab=1; _tmp = input(5); _hlabel = if(valuetype(_tmp)==4, _tmp, gethunits); _hlabel
                  Clear <# c x{-1} y{-1} e{getxlabel != gethunits} t{"' Clear X Label and Set to X Units '"}>~setvar("_cxlab", <{_cxlab}>)~<0><1>
<L>
  Preserve Vertical Label (Y) <c x{50}       t{"' Preserve Y Label During Window Recalculation '"} >     ~setylabelmode(1, <{getylabelmode(1)}>)~<0><1>
Preserve Horizontal Label (X) <c x{-1} y{-1} t{"' Preserve X Label During Window Recalculation '"}>~setxlabelmode(1, <{getxlabelmode(1)}>)~<0><1>
<>
" Label Colors " < b t{'" Window Label Colors "'}>~~_mf("labcolor.pan")
<>

{if(not(_intabbed), "<L>")}

~_MC
~if(_cwlab, label(), if(_wlab, if(getlabel != _wlabel, setwlab(_wlabel))))
~if(_cxlab, clearxlabel(), if(_hlab, if(getxlabel != _hlabel, poff; sethlab(_hlabel); _replot = 1)))
~if(_cylab, clearylabel(), if(_vlab, if(getylabel != _vlabel, poff; setvlab(_vlabel); _replot = 1)))

! if not in property sheet plot it now
~if(not(_intabbed) && _replot, plotmode(1, 2))

@endform


init_label_pan()
{
	setvar("_replot", 0);
	setvar("_wlab", 0);
	setvar("_hlab", 0);
	setvar("_vlab", 0);
	setvar("_cwlab", 0);
	setvar("_cxlab", 0);
	setvar("_cylab", 0);

	setvar("_wlabel", getlabel);
	setvar("_hlabel", getxlabel);
	setvar("_vlabel", getylabel);
}

