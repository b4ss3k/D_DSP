/////////////////////////////////////////////
// WFIR 
///////////////////////////////////////////
xbasc(); //clear graphics windows
xselect(); //select new graphics windows
mode(1)    // select a mode in exec file (1) silent mode
//[h,hm,fr]=wfir('lp',33,[.2 0],'hm',[0 0]);
 h =wfir('lp',33,[.2 0],'hm',[0 0]);
[hmag,fr]=frmag(h,256);
hmag = 20*log10(hmag);
plot2d(fr',hmag')
halt(),xbasc();
// 55 taps
h =wfir('lp',55,[.2 0],'hm',[0 0]);
[hmag,fr]=frmag(h,256);
hmag = 20*log10(hmag);
plot2d(fr',hmag')
halt(),xbasc();
// 111 taps
h =wfir('lp',111,[.2 0],'hm',[0 0]);
[hmag,fr]=frmag(h,256);
hmag = 20*log10(hmag);
plot2d(fr',hmag')
halt(),xbasc();
// the 3 together
[h,hmag,fr]=wfir('lp',33,[.2 0],'hm',[0 0]);
[m,mmag,fr]=wfir('lp',55,[.2 0],'hm',[0 0]);
[p,pmag,fr]=wfir('lp',111,[.2 0],'hm',[0 0]);
plot2d(fr,20*log10(hmag),1)
plot2d(fr,20*log10(mmag),2)
plot2d(fr,20*log10(pmag),3)
halt()
// lfinal result ; do not clear screen
[r,rmag,fr]=wfir('lp',999,[.2 0],'hm',[0 0]);
plot2d(fr,20*log10(rmag),5)
