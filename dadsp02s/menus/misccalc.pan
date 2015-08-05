! miscCalc
@panel
@justifylabels 3
@fixed_editwidth 0

Utilities

<>
<>
<L>
<>
  " Check Database Files " <b #                  >~~beginwait();chkfiles();endwait();
  " Write Configuration Values "  <b # x{-1} y{-1}      >~~beginwait();writecnf();viewfile("config.txt");endwait();
<>
<L>

~setvar("_misctool_page", getmenupage)
~if(isvar("_inmisc"), setvar("_miscreturn", 1), menureturn())
