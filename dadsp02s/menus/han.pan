! Han.pan -- Input window to hanning macro and execute
@f{_helpfg}
@b{_helpbg}
@panel

Input Window: <    >~DEFWIN(strcat("'","<{_WIN}>","'"))~_INSTR("Window to be Evaluated")

~_MC | SETWF("HANNING(EVAL(_WIN))")
