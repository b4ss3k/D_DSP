@panel

{if(isvar("_inmisc"), "Mortgage Calculator", "Mortgage Parameters")}
{defvar("_rateval", 8.0);defvar("_yterm", 30);defvar("_amount", 100000);}


{setvar("_mort", 0)}
<>
Annual Interest Rate: <#                   >~setvar("_rateval", <{getvar("_rateval")}>)~input(1)
<L>
       Term in Years: <#                   >~setvar("_yterm", <{getvar("_yterm")}>)~input(1)
<L>
         Loan Amount: <#                   >~setvar("_amount", <{getvar("_amount")}>)~input(1)
<L>
     Monthly Payment: <                    >~<{mpay(getvar("_rateval"), getvar("_yterm"), getvar("_amount"))}>~
<L>


~setvar("_mort", 1)
~setvar("_misctool_page", getmenupage)
~if(isvar("_inmisc"), setvar("_miscreturn", 1), menureturn())
