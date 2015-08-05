! Readb.pan - input filename and datatype
@f{_fg1}
@b{_bg1}
@panel
@h
@fixed_editwidth 0
@justifylabels 3
{_funcstr}

{defvar("_rball", 1)}
{defvar("_rbnpts","1")}
{if(_rball, setvar("_rbnumpts", "-1"), if(_rbnumpts=="-1",setvar("_rbnumpts", _rbnpts)))}


 &File Name: <* # w{85} t"{_rbfname}" >~setvar("_rbfname", '<{getvar("_rbfname")}>')~pickflst(_rbfname, "_rwfnamelst")
 &Browse...  <b # x{-1} y{-1} t{'" Select New File "'}> ~~if(strlen(temp = Pickfile(_rbpickdir,"Select Binary Data File",strescape("Data Files(*.dat)\0*.dat\0All Files(*.*)\0*.*\0\0"),_rwflg)) > 0, setvar("_rbfname", temp);setvar("_rbpickdir", strrev(strfind(pathchar, strrev(_rbfname)))))
 <L>
 Binary &Data Type:    <% t{"' Binary Data Format '"}    w{30}>~setvar("_rbdtype",_s2dtype('<{_dtype2s(_rbdtype)}>'))~<{_SBYTESTR}><{_UBYTESTR}><{_SINTSTR}><{_UINTSTR}><{_LONGSTR}><{_ULONGSTR}><{_FLOATSTR}><{_DOUBLESTR}>
          &Swap Bytes  <% c x{-1} y{-1}  t{"' Flip Low and High Bytes '"}     w{30}>~setvar("_rbswap", <{_rbswap}>)~<0><1>
  &Number of Points:   <# e{_rball == 0} d{1} w{30}>~setvar("_rbnumpts", _fromall("<{_toall(_rbnumpts)}>"));if(_rbnumpts!="-1",setvar("_rbnpts",_rbnumpts))~input(2, 1)
  &All Points          <# c  x{-1} y{-1} t{"' Read All Values Beginning at File Offset '"}          >~setvar("_rball", <{_rball}>)~<0><1>
 File &Offset (Bytes): <% t{"' First Byte to Read '"} d{0} w{30}>~setvar("_rboffset", <{_rboffset}>)~input(2, "File Offset", 0)
<L>
 &Preview    <b t{'" Preview Result "'}> ~~if(strlen(_rbfname) > 0, _prerb(_rbfname, eval(_rbdtype), castint(_rboffset)))
<L>
{_dwinstrS("W30")}
<L>

~_verifydlen
~setvar("_pickfile_status", _chkwin)
