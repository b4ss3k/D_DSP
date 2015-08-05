! Siggen.pan -- Generate Signals
@f{_helpfg}
@b{_helpbg}
@panel
 Sin & Sinh Funcs.
___________________

Signal Type: <    >~_DEFSIG(strcat("'","<{SIG}>","'"))~<SIN><COS><TAN><SEC><CSC><COT><SINH><COSH><TANH><SECH><CSCH><COTH>
Num. Points: <    >~_DEFPTS(strcat("'","<{PTS}>","'"))~INSTR("Window to be Evaluated")
Frequency:   <    >~_DEFFRQ(strcat("'","<{FRQ}>","'"))~INSTR("Window to be Evaluated")
Phase:       <    >~_DEFPHA(strcat("'","<{PHA}>","'"))~INSTR("Window to be Evaluated")
Factor:      <    >~_DEFFAC(strcat("'","<{FAC}>","'"))~INSTR("Window to be Evaluated")
Offset:      <    >~_DEFOFF(strcat("'","<{OFF}>","'"))~INSTR("Window to be Evaluated")

~DEFWIN(strcat("'","<{WIN}>","'"))~INSTR("Window to be Evaluated")
~MC(4) | SPECTRUM(EVAL(WIN))
