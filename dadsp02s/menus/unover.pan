! unover.pan - inputs an overlay              
@f{_fg1}
@b{_bg1}
@panel
@fixed_editwidth 0
@h
{_funcstr}
{_formatstr}
{_examplestr}

{setvar("_unovr", if(numitems<2, _nonestr, "1"))}

<L>
 {_ovrfocprompt}: <= #           >~focus(<{getfocus}>)~_foclist()
 {_int1prompt}    <*             >~setvar("_unovr", "<{_unovr}>")~_ovrlist 
 <L>
 {_cwinstr}
 <L>

~_mc
~if(_unovr!=_nonestr, unoverlay(eval(_unovr)))
