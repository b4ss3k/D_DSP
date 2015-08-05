/////////////////////////////////////////////
// SIGNAL PROCESSING Chapter 3 - FIR 
///////////////////////////////////////////
//examples 3.14
xbasc(); //clear graphics windows
xselect(); //select new graphics windows
mode(1)    // select a mode in exec file (1) silent mode

// LPF 33-tap  Kaiser
[h,hmag,fr]=wfir('lp',33,[.2 0],'kr',[5.6 0]);
plot2d(fr,20*log10(hmag)/10,1)
halt(),xbasc();
// SBF (StopBand Filter)  127-tap Hamming
[h,hmag,fr]=wfir('sb',127,[.2 .3],'hm',[.54 0]);
plot2d(fr,20*log10(hmag)/10,1)
halt(),xbasc();
// BPF 55-tap Chebyshev
// cannot do the second parameter df=0.0442266; it always give an error
// the interactive WFIR worked only once
[h,hmag,fr]=wfir('bp',55,[.15 .35],'ch',[.001 -1]);
plot2d(fr,20*log10(hmag)/10,1)
halt(),xbasc();
