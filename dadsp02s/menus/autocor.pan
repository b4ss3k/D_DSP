! Autocor.pan -- Input window to autocor macro and execute
@f{_helpfg}
@b{_helpbg}
@panel
Input Window: <    >~DEFWIN(strcat("'","<{_WIN}>","'"))~INSTR("Window to be Evaluated")
~_MC | SETWF("AUTOCOR(EVAL(WIN))")
