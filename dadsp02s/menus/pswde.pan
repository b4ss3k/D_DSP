! pswd.pan - password panel 
@panel
@suppress 2   ! suppress cancel button
@focus 1      ! set focus to OK

DADiSP 2002 Authorization

{defvar("_authmode", 0)}

<i{2} x{5}> ! alert icon
Your Evaluation Version of DADiSP requires a Password for full operation. <x{35} y{-1}>
Obtaining your Password is very easy. <x{35}>
However, without a Password you can run DADiSP in Browser Mode: <x{35}>
<>

* 9 Windows per Worksheet             <x{80} y{-1}>
* 32K Data Points per Series          <x{80}>
* No Saving of Series or Worksheets   <x{80}>
<>


Authorization <r n h x{5} t{"' Request a 30 Day Password | Enter a 30 Day Password | Run in Evaluation Mode | View Self Running Demo/Tutorial '"}   >~setvar(_authmode, <{_authmode}>)~<I Need a Password><I Have a Password><Run in Browser Mode><View Tutorial >

~menuclear()
~setvar("_sys_authmode", getvar("_authmode"))

