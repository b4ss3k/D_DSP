! Ham.pan -- Input window to hamming macro and execute
@f{_helpfg}
@b{_helpbg}
@panel

Input Window: <    >~DEFWIN(strcat("'","<{_WIN}>","'"))~_INSTR("Window to be Evaluated")

~_MC | SETWF("HAMMING(EVAL(_WIN))")
