xbasc(); //clear graphics windows
xselect(); //select new graphics windows
mode(1)    // select a mode in exec file (1) silent mode
[h,hmag,fr]=wfir('lp',33,[.05 0],'hm',[0 0]);
plot2d(fr,20*log10(hmag),4)

[fil,fimag,fr] =wfir('lp',169,[.05 0],'hm',[0 0]);
plot2d(fr,20*log(fimag),2)

[ff,ffmag,fr] =wfir('lp',999,[.05 0],'hm',[0 0]);
plot2d(fr,20*log10(ffmag),1)


