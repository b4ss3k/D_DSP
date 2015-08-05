//filtering of signals
//make signal and filter
xbasc(); //clear graphics windows
xselect(); //select new graphics windows
mode(1)    // select a mode in exec file (1) silent mode
[h,hm,fr]=wfir('lp',33,[.2 0],'hm',[0 0]);
t=1:200;
x1=sin(2*%pi*t/20);
x2=sin(2*%pi*t/3);
x=x1+x2;
z=poly(0,'z');
hz=syslin('d',poly(h,'z','c')./z**33);
yhz=flts(x,hz);
plot(yhz)
halt(),xbasc();


////////////////////////
//MINIMAX FIR FILTERS///
////////////////////////
// Copyright INRIA
xbasc(); //clear graphics windows
xselect(); //select new graphics windows
mode(1)    // select a mode in exec file (1) silent mode
//Low pass filter (length 33, cut-off in [.23,.27], weight 1/.1)
hn=eqfir(33,[0 .23;.27 .5],[1 0],[1 .1]);
[hm,fr]=frmag(hn,256);
plot2d(fr',hm'),
title_c=['Minimax FIR filter'; 	  'low pass  cut-off in [.23,.27]';  'length 33'];
xtitle(title_c);
halt(),xbasc();
 

