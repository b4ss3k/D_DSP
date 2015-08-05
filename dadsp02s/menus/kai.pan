! Kai.pan -- Input window to kaiser macro and execute
@f{_helpfg}
@b{_helpbg}
@panel

Input Window: <    >~_DEFWIN(strcat("'","<{_WIN}>","'"))~_INSTR("Window to be Evaluated")

~_MC | SETWF("KAISER(EVAL(_WIN))")
