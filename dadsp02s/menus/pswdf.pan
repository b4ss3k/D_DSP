! pswdf.pan - password panel 
@panel
@suppress 2   ! suppress cancel button
@focus 1      ! set focus to OK

DADiSP 2002 Network Authorization

{defvar("_authmode", 0)}

<i{2} x{5}> ! alert icon
Your Floating License Version of DADiSP Requires a Password for Operation. <x{35} y{-1}>

<>
Authorization <r n h x{45} t{"' Request a Network Password | Enter a Network Password '"}   >~setvar(_authmode, <{_authmode}>)~<I Need a Password><I Have a Password>

~menuclear()
~setvar("_sys_authmode", getvar("_authmode"))

