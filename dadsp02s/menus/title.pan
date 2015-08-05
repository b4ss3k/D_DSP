!Title.pan - Title the window
!            basically, add a center justified textann in WP_MARGIN, with top margin justified
@f{_fg1}
@b{_bg1}
@panel

Title Window

{defvar("_titxt", "My Title")}
{defvar("_ticlr", getwcolor(1))}
{defvar("_tiform", 0)}
{_tmp = setwfmode(not(_tiform))}

<>
 Title:  < w{60} %                  >~setvar("_titxt","<{_titxt}>")~input(5,"Title")
 Color:  <= p n  %                  >~setvar("_ticlr",<{(_ticlr)}>)~_choosecolor
 <L>
{_addformstr} <c #                >~setvar("_tiform", <{_tiform}>);setwfmode(not(_tiform))~<0><1>
<L>
{_dwinstr}
<L>

~_mc 
~_ticmd = sprintf("Title(%d, '%s')", _ticlr, _titxt)
~if(_tiform, eval(sprintf('addwf(%s, "%s")', _dwin, _ticmd)), eval(_ticmd))
