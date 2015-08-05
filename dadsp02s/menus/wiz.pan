! wiz.pan - function wizard
@panel
@form
@justifylabels 3
@h~help(if(strlen(_funwizhlp)==0, _funwiz2, if(strlen(strfind("!", _funwizhlp))==0,_funwizhlp, _funwiz2)))

Analysis Functions

{defvar("_funwiz1",    0)}
{defvar("_funwizlist", "wiz00.txt")}
{defvar("_funwiz2",    strget(1, strfile(_mh(_funwizlist))))}
{setvar("_funwizhlp",  strget(3, strfind(_funwiz2, strfile(_mh(_funwizlist), 0, 1)), strescape("$\n")))} 
{setvar("_wizhlp",     strget(2, strfind(_funwiz2, strfile(_mh(_funwizlist), 0, 1)), strescape("$\n")))} 
{defvar("_wizmode",    0)}


Analysis Category:  <* # l m{15} w{35} n           >~setvar("_funwiz1", <{_funwiz1}>);setvar("_funwizlist", _gwizfn(_funwiz1));setvar("_funwiz2", strget(1, strfile(_mh(_funwizlist))))~strfile(_mh("wizcat.txt"))
Function Name:      <* % l m{15} w{35} x{-1} y{-1} >~setvar("_funwiz2", "<{_funwiz2}>");_setwizhlp()~strfile(_mh(_funwizlist))
<y{-2}>
<W{72} id{1}>~noop("<{sprintf(" %-72s", _wizhlp)}>")~
Result              <r # n h x{5} t{'" Evaluate Function Immediately | Paste Function to Line Editor "'}  >~setvar("_wizmode", <{_wizmode}>)~<Evaluate in Window><Paste to Editor>
<y{-1}>
<>
<>
{_donestr}          <b x{-1} y{-1} e{_wizmode==1} t{'" Return to Line Editor "'} >~~_mc
"+"                 < y{-2}      b e{_wizmode==1} t{'" + Add "'}            >~~pastedata(4, "+")
"-"                 <x{-1} y{-1} b e{_wizmode==1} t{'" - Subtract "'}       >~~pastedata(4, "-")
"/"                 <x{-1} y{-1} b e{_wizmode==1} t{'" / Divide "'}         >~~pastedata(4, "/")
"*"                 <x{-1} y{-1} b e{_wizmode==1} t{'" * Multiply "'}       >~~pastedata(4, "*")
"^"                 <x{-1} y{-1} b e{_wizmode==1} t{'" ^ Raise to Power "'} >~~pastedata(4, "^")
";"                 <x{-1} y{-1} b e{_wizmode==1} t{'" ; Semicolon "'}      >~~pastedata(4, ";")
","                 <x{-1} y{-1} b e{_wizmode==1} t{'" , Comma "'}          >~~pastedata(4, ",")
<>
"("                 <            b e{_wizmode==1} t{'" ( Left Parenthesis "'}  >~~pastedata(4, "(")
")"                 <x{-1} y{-1} b e{_wizmode==1} t{'" ) Right Parenthesis "'} >~~pastedata(4, ")")
{"{"}               <x{-1} y{-1} b e{_wizmode==1} t{'" { Left Brace "'}        >~~pastedata(4, _lbrace)
{"}"}               <x{-1} y{-1} b e{_wizmode==1} t{sprintf('" %s %s "', _rbrace, "Right Brace")} >~~pastedata(4, _rbrace)
'"'                 <x{-1} y{-1} b e{_wizmode==1} t{sprintf("'%s'", ' " Double Quote ')}          >~~pastedata(4, '"')
"'"                 <x{-1} y{-1} b e{_wizmode==1} t{sprintf('"%s"', " ' Single Quote ")}          >~~pastedata(4, "'")
"Del"               <x{-1} y{-1} b e{_wizmode==1} t{'" Backspace Delete "'}                       >~~pastedata(4)
<L>

! used to check if popup was cancelled
~setvar("_menucleared", 0)

! set so menuclear preserves the wizard
~if(_wizmode==1, menusetclear(-1))

! allow setwf to paste into editor
~_wfmode = setwfmode(_wizmode==1)

! parse statement to execute from the wizard file
~_pdcwiz = strget(2, strfind(_funwiz2, strfile(_mh(_funwizlist), 0, 1)), "!$")

! execute statement
~eval(_pdcwiz)

! add to history
~pdchistory(_pdcwiz)

! restore setwf to normal processing
~setwfmode(_wfmode)

! if pasting stay alive, else clear
~if(_wizmode==1, menureturn, if(_menucleared, menuclear, menureturn))

@endform


_setwizhlp()
{
	setvar("_funwizhlp",  strget(3, strfind(_funwiz2, strfile(_mh(_funwizlist), 0, 1)), strescape("$\n")));
	setvar("_wizhlp",     strget(2, strfind(_funwiz2, strfile(_mh(_funwizlist), 0, 1)), strescape("$\n")));
	setcontrolvalue(1, _wizhlp);
}
 
