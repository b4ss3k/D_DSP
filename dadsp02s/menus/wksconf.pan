! WksConf.pan
@f{_fg1}
@b{_bg1}
@h {cnfhlp("wksconf.hlp")}
@panel
    Worksheet
<>
Display Precision:   < u{32} d{0}  w{20} t{'" Number of Digits after the Decimal Point "'}            >~setvar("_ddpdef",'<{_ddpdef}>')~input(2,0,32)
Default Math Value:  <*            w{20} t{'" Result for 1/0, log(0) and Other Exceptions - Use Automatic for Natural Return Value "'} >~setvar("_dmvdef",'<{_dmvdef}>')~<{_automaticstr}><0.0><NaN><inf><-inf>
  Number of Windows: < u{100} d{0} w{20} t{'" Number of Windows for a New Worksheet "'}               >~setvar("_ndwdef",'<{_ndwdef}>')~input(2)
<>
Display Options <L>
        Toolbar      <C             t{'" Show Toolbar Buttons "'}    >~setvar("_tb",  '<{_tb}>')~<0><1>
        Status Line  <C x{-1} y{-1} t{'" Show Bottom Status Line "'} >~setvar("_spm", '<{_spm}>')~<0><1>
        Clock        <C x{-1} y{-1} t{'" Show Real Time Clock "'}    >~setvar("_clk", '<{_clk}>')~<0><1>
        Command Line <C x{-1} y{-1} t{'" Show Line Editor "'}        >~setvar("_ledt",'<{_ledt}>')~<0><1>
<>
Save With Worksheet <L>
Macros         <C             t{'" Save All Macros with Worksheet "'}                 >~setvar("_savm", '<{_savm}>')~<0><1>
Variables      <C x{-1} y{-1} t{'" Save All Variables with Worksheet "'}              >~setvar("_savv", '<{_savv}>')~<0><1>
SPL Functions  <C x{-1} y{-1} t{'" Save All Invoked SPL Functions with Worksheet "'}  >~setvar("_savf", '<{_savf}>')~<0><1>
<>
{_defsetstr} <# b    >~~_defwkcf()

~_mc
~if(getconf("TOOLBAR_ENABLED") != _tb, setvar("_rdraw", 2))
~if(getconf("STATUS_PROCESSING") != _spm, setvar("_rdraw", 1))
~if(getconf("CLOCK_ENABLED") != _clk, setvar("_rdraw", 1))
~if(getconf("INPUT_ENABLED") != _ledt, setvar("_rdraw", 2))
~setconf("TOOLBAR_ENABLED",_tb);setconf("CLOCK_ENABLED",_clk);setconf("STATUS_PROCESSING",_spm);
~setconf("INPUT_ENABLED", _ledt);
~setconf("SAVE_MACROS", _savm);setconf("SAVE_VARIABLES", _savv);setconf("SAVE_FUNCTIONS", _savf);
~setconf("DISPLAY_PRECISION", _ddpdef);setconf("NUM_DEFAULT_WINDOWS", _ndwdef);
~if(strcmp(_dmvdef, _automaticstr)==0, setconf("USE_DEFAULT_MATH_VALUE", "0"), setconf("USE_DEFAULT_MATH_VALUE", "1");setconf("DEFAULT_MATH_VALUE", _dmvdef))
