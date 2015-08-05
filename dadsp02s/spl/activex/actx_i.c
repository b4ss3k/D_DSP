/* this file contains the actual definitions of */
/* the IIDs and CLSIDs */

/* link this file in with the server and any clients */


/* File created by MIDL compiler version 5.01.0164 */
/* at Tue Sep 04 13:14:22 2007
 */
/* Compiler settings for actx.idl:
    Os (OptLev=s), W1, Zp8, env=Win32, ms_ext, c_ext
    error checks: allocation ref bounds_check enum stub_data 
*/
//@@MIDL_FILE_HEADING(  )
#ifdef __cplusplus
extern "C"{
#endif 


#ifndef __IID_DEFINED__
#define __IID_DEFINED__

typedef struct _IID
{
    unsigned long x;
    unsigned short s1;
    unsigned short s2;
    unsigned char  c[8];
} IID;

#endif // __IID_DEFINED__

#ifndef CLSID_DEFINED
#define CLSID_DEFINED
typedef IID CLSID;
#endif // CLSID_DEFINED

const IID IID_IDadisp = {0x877a3920,0x570a,0x11d3,{0x99,0x71,0x00,0xc0,0x15,0x01,0x97,0xbf}};


const IID LIBID_DADiSP = {0xb80fa980,0x570a,0x11d3,{0x99,0x71,0x00,0xc0,0x15,0x01,0x97,0xbf}};


const IID DIID_IDadispEvents = {0x35C93163,0x445F,0x11d9,{0x99,0x84,0x00,0x60,0x08,0xEB,0x95,0x91}};


const CLSID CLSID_DADiSPApp = {0xd5215fa0,0x570a,0x11d3,{0x99,0x71,0x00,0xc0,0x15,0x01,0x97,0xbf}};


#ifdef __cplusplus
}
#endif

