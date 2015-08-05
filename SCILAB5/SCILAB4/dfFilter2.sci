//Triangular filter created using remezb
   nc=21;
   ngrid=nc*16;
   fg=.5*(0:(ngrid-1))/(ngrid-1);
   ds(1:ngrid/2)=(0:-1+ngrid/2)*2/(ngrid-2);
   ds(ngrid/2+1:ngrid)=ds(ngrid/2:-1:1);
   wt=ones(fg);
   [an]=remezb(nc,fg,ds,wt);
   hn(1:nc-1)=an(nc:-1:2)/2;
   hn(nc)=an(1);
   hn(nc+1:2*nc-1)=an(2:nc)/2;
   [hm,fr]=frmag(hn,maxi(size(ds)));
   plot2d(fr',hm'),
   xtitle('Remez Triangular filter','frequency','magnitude');
   halt();xbasc(); 
   plot2d(fr',(hm-ds)'),
   xtitle(' ','frequency','magnitude error');
   halt(),xbasc();



