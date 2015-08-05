! Crosscor.pan -- Input windows to crosscor macro and execute
@f{_helpfg}
@b{_helpbg}
@panel

Window 1: <    >~_DEFWIN(strcat("'","<{_WIN}>","'"))~_INSTR("Window to be Evaluated")
Window 2: <    >~_DEFWIN2(strcat("'","<{_WIN2}>","'"))~_INSTR("Window to be Evaluated")

~_MC | SETWF("CROSSCOR(EVAL(_WIN),EVAL(_WIN2))")
