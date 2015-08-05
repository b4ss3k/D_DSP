! depclr.pan
@f{_fg1}
@b{_bg1}
@panel
@justifylabel 3
{if(not(menuinrefresh),_setgcol)}

 Window Dependencies Colors
<>
        Child Caption Text: <% = p n               t{'" Caption Text Color for Dependent Windows "'}          >~setvar("_GCV43",eval("<{(_GCV43)}>"))~_choosesyscolor
       Parent Caption Text: <% = p n  x{-1} y{-1}  t{'" Caption Text Color for Windows Dependent On "'}       >~setvar("_GCV45",eval("<{(_GCV45)}>"))~_choosesyscolor
  Child Caption Background: <% = p n               t{'" Caption Background Color for Dependent Windows "'}    >~setvar("_GCV42",eval("<{(_GCV42)}>"))~_choosesyscolor
 Parent Caption Background: <% = p n  x{-1} y{-1}  t{'" Caption Background Color for Windows Dependent On "'} >~setvar("_GCV44",eval("<{(_GCV44)}>"))~_choosesyscolor
 <>
 <>
{_defsetstr} <# b >~~_defdclr
<>
<L>
~menuclear(1)
~if(_chkgcol, setvar("_replot", 1));
~setgcolor(42, _GCV42);setgcolor(43, _GCV43);setgcolor(44, _GCV44);setgcolor(45, _GCV45);


