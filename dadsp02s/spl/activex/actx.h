/* this ALWAYS GENERATED file contains the definitions for the interfaces */


/* File created by MIDL compiler version 5.01.0164 */
/* at Tue Sep 04 13:14:22 2007
 */
/* Compiler settings for actx.idl:
    Os (OptLev=s), W1, Zp8, env=Win32, ms_ext, c_ext
    error checks: allocation ref bounds_check enum stub_data 
*/
//@@MIDL_FILE_HEADING(  )


/* verify that the <rpcndr.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCNDR_H_VERSION__
#define __REQUIRED_RPCNDR_H_VERSION__ 440
#endif

#include "rpc.h"
#include "rpcndr.h"

#ifndef __RPCNDR_H_VERSION__
#error this stub requires an updated version of <rpcndr.h>
#endif // __RPCNDR_H_VERSION__

#ifndef COM_NO_WINDOWS_H
#include "windows.h"
#include "ole2.h"
#endif /*COM_NO_WINDOWS_H*/

#ifndef __actx_h__
#define __actx_h__

#ifdef __cplusplus
extern "C"{
#endif 

/* Forward Declarations */ 

#ifndef __IDadisp_FWD_DEFINED__
#define __IDadisp_FWD_DEFINED__
typedef interface IDadisp IDadisp;
#endif 	/* __IDadisp_FWD_DEFINED__ */


#ifndef __IDadispEvents_FWD_DEFINED__
#define __IDadispEvents_FWD_DEFINED__
typedef interface IDadispEvents IDadispEvents;
#endif 	/* __IDadispEvents_FWD_DEFINED__ */


#ifndef __DADiSPApp_FWD_DEFINED__
#define __DADiSPApp_FWD_DEFINED__

#ifdef __cplusplus
typedef class DADiSPApp DADiSPApp;
#else
typedef struct DADiSPApp DADiSPApp;
#endif /* __cplusplus */

#endif 	/* __DADiSPApp_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"

void __RPC_FAR * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void __RPC_FAR * ); 

#ifndef __IDadisp_INTERFACE_DEFINED__
#define __IDadisp_INTERFACE_DEFINED__

/* interface IDadisp */
/* [oleautomation][dual][unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_IDadisp;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("877a3920-570a-11d3-9971-00c0150197bf")
    IDadisp : public IDispatch
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetData( 
            /* [in] */ BSTR bstrIn,
            /* [retval][out] */ VARIANT __RPC_FAR *pvOut) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE PutData( 
            /* [in] */ BSTR bstrIn,
            /* [in] */ VARIANT __RPC_FAR *pvIn,
            /* [retval][out] */ int __RPC_FAR *pintOut) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Execute( 
            /* [in] */ BSTR bstrIn,
            /* [retval][out] */ int __RPC_FAR *pintOut) = 0;
        
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_Visible( 
            /* [retval][out] */ int __RPC_FAR *Visible) = 0;
        
        virtual /* [helpstring][propput][id] */ HRESULT STDMETHODCALLTYPE put_Visible( 
            /* [in] */ int Visible) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Quit( 
            /* [optional][in] */ VARIANT __RPC_FAR *Confirm,
            /* [retval][out] */ int __RPC_FAR *pintOut) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetComplexData( 
            /* [in] */ BSTR bstrIn,
            /* [out] */ VARIANT __RPC_FAR *pvRe,
            /* [out] */ VARIANT __RPC_FAR *pvIm,
            /* [optional][in] */ VARIANT __RPC_FAR *pComplexType,
            /* [retval][out] */ int __RPC_FAR *pintOut) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE PutComplexData( 
            /* [in] */ BSTR bstrIn,
            /* [in] */ VARIANT __RPC_FAR *pvRe,
            /* [in] */ VARIANT __RPC_FAR *pvIm,
            /* [optional][in] */ VARIANT __RPC_FAR *pvComplexType,
            /* [retval][out] */ int __RPC_FAR *pintOut) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetVariantData( 
            /* [in] */ BSTR bstrIn,
            /* [optional][in] */ VARIANT __RPC_FAR *pvOutType,
            /* [optional][in] */ VARIANT __RPC_FAR *pvArrType,
            /* [retval][out] */ VARIANT __RPC_FAR *pvOut) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetComplexVariantData( 
            /* [in] */ BSTR bstrIn,
            /* [out] */ VARIANT __RPC_FAR *pvRe,
            /* [out] */ VARIANT __RPC_FAR *pvIm,
            /* [optional][in] */ VARIANT __RPC_FAR *pvComplexType,
            /* [optional][in] */ VARIANT __RPC_FAR *pvOutType,
            /* [retval][out] */ int __RPC_FAR *pintOut) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetSeries( 
            /* [in] */ BSTR bstrIn,
            /* [out][in] */ SAFEARRAY __RPC_FAR * __RPC_FAR *psaOut,
            /* [retval][out] */ int __RPC_FAR *pintOut) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE PutSeries( 
            /* [in] */ BSTR bstrIn,
            /* [in] */ SAFEARRAY __RPC_FAR * psaIn,
            /* [retval][out] */ int __RPC_FAR *pintOut) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetComplexSeries( 
            /* [in] */ BSTR bstrIn,
            /* [out][in] */ SAFEARRAY __RPC_FAR * __RPC_FAR *psaRe,
            /* [out][in] */ SAFEARRAY __RPC_FAR * __RPC_FAR *psaIm,
            /* [in] */ int intComplexType,
            /* [retval][out] */ int __RPC_FAR *pintOut) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE PutComplexSeries( 
            /* [in] */ BSTR bstrIn,
            /* [in] */ SAFEARRAY __RPC_FAR * psaRe,
            /* [in] */ SAFEARRAY __RPC_FAR * psaIm,
            /* [in] */ int intComplexType,
            /* [retval][out] */ int __RPC_FAR *pintOut) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetFullMatrix( 
            /* [in] */ BSTR Name,
            /* [in] */ BSTR Workspace,
            /* [out][in] */ SAFEARRAY __RPC_FAR * __RPC_FAR *psaRe,
            /* [out][in] */ SAFEARRAY __RPC_FAR * __RPC_FAR *psaIm) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE PutFullMatrix( 
            /* [in] */ BSTR Name,
            /* [in] */ BSTR Workspace,
            /* [in] */ SAFEARRAY __RPC_FAR * psaRe,
            /* [in] */ SAFEARRAY __RPC_FAR * psaIm) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetCharArray( 
            /* [in] */ BSTR Name,
            /* [in] */ BSTR Workspace,
            /* [retval][out] */ BSTR __RPC_FAR *Str) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE PutCharArray( 
            /* [in] */ BSTR Name,
            /* [in] */ BSTR Workspace,
            /* [in] */ BSTR Str) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Evaluate( 
            /* [in] */ BSTR bstrIn,
            /* [retval][out] */ BSTR __RPC_FAR *bstrOut) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE FnInit( 
            /* [in] */ BSTR bstrIn) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE FnAddArg( 
            /* [in] */ VARIANT __RPC_FAR *pvar) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE FnEval( 
            /* [retval][out] */ VARIANT __RPC_FAR *pvOut) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE QueueInit( 
            /* [in] */ BSTR bstrIn) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE QueueAddArg( 
            /* [in] */ VARIANT __RPC_FAR *pvar) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE QueueAddCmd( 
            /* [in] */ BSTR bstrIn) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE QueueEnd( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE QueueEval( 
            /* [retval][out] */ VARIANT __RPC_FAR *pvOut) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE QueueClear( void) = 0;
        
        virtual /* [vararg][helpstring][id] */ HRESULT STDMETHODCALLTYPE Calculate( 
            /* [in] */ BSTR bstrIn,
            /* [in] */ SAFEARRAY __RPC_FAR * psa,
            /* [retval][out] */ VARIANT __RPC_FAR *pvOut) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IDadispVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueryInterface )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void __RPC_FAR *__RPC_FAR *ppvObject);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *AddRef )( 
            IDadisp __RPC_FAR * This);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *Release )( 
            IDadisp __RPC_FAR * This);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfoCount )( 
            IDadisp __RPC_FAR * This,
            /* [out] */ UINT __RPC_FAR *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfo )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo __RPC_FAR *__RPC_FAR *ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetIDsOfNames )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR __RPC_FAR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID __RPC_FAR *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Invoke )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS __RPC_FAR *pDispParams,
            /* [out] */ VARIANT __RPC_FAR *pVarResult,
            /* [out] */ EXCEPINFO __RPC_FAR *pExcepInfo,
            /* [out] */ UINT __RPC_FAR *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetData )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ BSTR bstrIn,
            /* [retval][out] */ VARIANT __RPC_FAR *pvOut);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *PutData )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ BSTR bstrIn,
            /* [in] */ VARIANT __RPC_FAR *pvIn,
            /* [retval][out] */ int __RPC_FAR *pintOut);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Execute )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ BSTR bstrIn,
            /* [retval][out] */ int __RPC_FAR *pintOut);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_Visible )( 
            IDadisp __RPC_FAR * This,
            /* [retval][out] */ int __RPC_FAR *Visible);
        
        /* [helpstring][propput][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_Visible )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ int Visible);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Quit )( 
            IDadisp __RPC_FAR * This,
            /* [optional][in] */ VARIANT __RPC_FAR *Confirm,
            /* [retval][out] */ int __RPC_FAR *pintOut);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetComplexData )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ BSTR bstrIn,
            /* [out] */ VARIANT __RPC_FAR *pvRe,
            /* [out] */ VARIANT __RPC_FAR *pvIm,
            /* [optional][in] */ VARIANT __RPC_FAR *pComplexType,
            /* [retval][out] */ int __RPC_FAR *pintOut);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *PutComplexData )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ BSTR bstrIn,
            /* [in] */ VARIANT __RPC_FAR *pvRe,
            /* [in] */ VARIANT __RPC_FAR *pvIm,
            /* [optional][in] */ VARIANT __RPC_FAR *pvComplexType,
            /* [retval][out] */ int __RPC_FAR *pintOut);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetVariantData )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ BSTR bstrIn,
            /* [optional][in] */ VARIANT __RPC_FAR *pvOutType,
            /* [optional][in] */ VARIANT __RPC_FAR *pvArrType,
            /* [retval][out] */ VARIANT __RPC_FAR *pvOut);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetComplexVariantData )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ BSTR bstrIn,
            /* [out] */ VARIANT __RPC_FAR *pvRe,
            /* [out] */ VARIANT __RPC_FAR *pvIm,
            /* [optional][in] */ VARIANT __RPC_FAR *pvComplexType,
            /* [optional][in] */ VARIANT __RPC_FAR *pvOutType,
            /* [retval][out] */ int __RPC_FAR *pintOut);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetSeries )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ BSTR bstrIn,
            /* [out][in] */ SAFEARRAY __RPC_FAR * __RPC_FAR *psaOut,
            /* [retval][out] */ int __RPC_FAR *pintOut);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *PutSeries )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ BSTR bstrIn,
            /* [in] */ SAFEARRAY __RPC_FAR * psaIn,
            /* [retval][out] */ int __RPC_FAR *pintOut);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetComplexSeries )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ BSTR bstrIn,
            /* [out][in] */ SAFEARRAY __RPC_FAR * __RPC_FAR *psaRe,
            /* [out][in] */ SAFEARRAY __RPC_FAR * __RPC_FAR *psaIm,
            /* [in] */ int intComplexType,
            /* [retval][out] */ int __RPC_FAR *pintOut);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *PutComplexSeries )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ BSTR bstrIn,
            /* [in] */ SAFEARRAY __RPC_FAR * psaRe,
            /* [in] */ SAFEARRAY __RPC_FAR * psaIm,
            /* [in] */ int intComplexType,
            /* [retval][out] */ int __RPC_FAR *pintOut);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetFullMatrix )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ BSTR Name,
            /* [in] */ BSTR Workspace,
            /* [out][in] */ SAFEARRAY __RPC_FAR * __RPC_FAR *psaRe,
            /* [out][in] */ SAFEARRAY __RPC_FAR * __RPC_FAR *psaIm);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *PutFullMatrix )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ BSTR Name,
            /* [in] */ BSTR Workspace,
            /* [in] */ SAFEARRAY __RPC_FAR * psaRe,
            /* [in] */ SAFEARRAY __RPC_FAR * psaIm);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetCharArray )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ BSTR Name,
            /* [in] */ BSTR Workspace,
            /* [retval][out] */ BSTR __RPC_FAR *Str);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *PutCharArray )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ BSTR Name,
            /* [in] */ BSTR Workspace,
            /* [in] */ BSTR Str);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Evaluate )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ BSTR bstrIn,
            /* [retval][out] */ BSTR __RPC_FAR *bstrOut);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *FnInit )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ BSTR bstrIn);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *FnAddArg )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ VARIANT __RPC_FAR *pvar);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *FnEval )( 
            IDadisp __RPC_FAR * This,
            /* [retval][out] */ VARIANT __RPC_FAR *pvOut);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueueInit )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ BSTR bstrIn);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueueAddArg )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ VARIANT __RPC_FAR *pvar);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueueAddCmd )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ BSTR bstrIn);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueueEnd )( 
            IDadisp __RPC_FAR * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueueEval )( 
            IDadisp __RPC_FAR * This,
            /* [retval][out] */ VARIANT __RPC_FAR *pvOut);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueueClear )( 
            IDadisp __RPC_FAR * This);
        
        /* [vararg][helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Calculate )( 
            IDadisp __RPC_FAR * This,
            /* [in] */ BSTR bstrIn,
            /* [in] */ SAFEARRAY __RPC_FAR * psa,
            /* [retval][out] */ VARIANT __RPC_FAR *pvOut);
        
        END_INTERFACE
    } IDadispVtbl;

    interface IDadisp
    {
        CONST_VTBL struct IDadispVtbl __RPC_FAR *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IDadisp_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IDadisp_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IDadisp_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IDadisp_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define IDadisp_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define IDadisp_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define IDadisp_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define IDadisp_GetData(This,bstrIn,pvOut)	\
    (This)->lpVtbl -> GetData(This,bstrIn,pvOut)

#define IDadisp_PutData(This,bstrIn,pvIn,pintOut)	\
    (This)->lpVtbl -> PutData(This,bstrIn,pvIn,pintOut)

#define IDadisp_Execute(This,bstrIn,pintOut)	\
    (This)->lpVtbl -> Execute(This,bstrIn,pintOut)

#define IDadisp_get_Visible(This,Visible)	\
    (This)->lpVtbl -> get_Visible(This,Visible)

#define IDadisp_put_Visible(This,Visible)	\
    (This)->lpVtbl -> put_Visible(This,Visible)

#define IDadisp_Quit(This,Confirm,pintOut)	\
    (This)->lpVtbl -> Quit(This,Confirm,pintOut)

#define IDadisp_GetComplexData(This,bstrIn,pvRe,pvIm,pComplexType,pintOut)	\
    (This)->lpVtbl -> GetComplexData(This,bstrIn,pvRe,pvIm,pComplexType,pintOut)

#define IDadisp_PutComplexData(This,bstrIn,pvRe,pvIm,pvComplexType,pintOut)	\
    (This)->lpVtbl -> PutComplexData(This,bstrIn,pvRe,pvIm,pvComplexType,pintOut)

#define IDadisp_GetVariantData(This,bstrIn,pvOutType,pvArrType,pvOut)	\
    (This)->lpVtbl -> GetVariantData(This,bstrIn,pvOutType,pvArrType,pvOut)

#define IDadisp_GetComplexVariantData(This,bstrIn,pvRe,pvIm,pvComplexType,pvOutType,pintOut)	\
    (This)->lpVtbl -> GetComplexVariantData(This,bstrIn,pvRe,pvIm,pvComplexType,pvOutType,pintOut)

#define IDadisp_GetSeries(This,bstrIn,psaOut,pintOut)	\
    (This)->lpVtbl -> GetSeries(This,bstrIn,psaOut,pintOut)

#define IDadisp_PutSeries(This,bstrIn,psaIn,pintOut)	\
    (This)->lpVtbl -> PutSeries(This,bstrIn,psaIn,pintOut)

#define IDadisp_GetComplexSeries(This,bstrIn,psaRe,psaIm,intComplexType,pintOut)	\
    (This)->lpVtbl -> GetComplexSeries(This,bstrIn,psaRe,psaIm,intComplexType,pintOut)

#define IDadisp_PutComplexSeries(This,bstrIn,psaRe,psaIm,intComplexType,pintOut)	\
    (This)->lpVtbl -> PutComplexSeries(This,bstrIn,psaRe,psaIm,intComplexType,pintOut)

#define IDadisp_GetFullMatrix(This,Name,Workspace,psaRe,psaIm)	\
    (This)->lpVtbl -> GetFullMatrix(This,Name,Workspace,psaRe,psaIm)

#define IDadisp_PutFullMatrix(This,Name,Workspace,psaRe,psaIm)	\
    (This)->lpVtbl -> PutFullMatrix(This,Name,Workspace,psaRe,psaIm)

#define IDadisp_GetCharArray(This,Name,Workspace,Str)	\
    (This)->lpVtbl -> GetCharArray(This,Name,Workspace,Str)

#define IDadisp_PutCharArray(This,Name,Workspace,Str)	\
    (This)->lpVtbl -> PutCharArray(This,Name,Workspace,Str)

#define IDadisp_Evaluate(This,bstrIn,bstrOut)	\
    (This)->lpVtbl -> Evaluate(This,bstrIn,bstrOut)

#define IDadisp_FnInit(This,bstrIn)	\
    (This)->lpVtbl -> FnInit(This,bstrIn)

#define IDadisp_FnAddArg(This,pvar)	\
    (This)->lpVtbl -> FnAddArg(This,pvar)

#define IDadisp_FnEval(This,pvOut)	\
    (This)->lpVtbl -> FnEval(This,pvOut)

#define IDadisp_QueueInit(This,bstrIn)	\
    (This)->lpVtbl -> QueueInit(This,bstrIn)

#define IDadisp_QueueAddArg(This,pvar)	\
    (This)->lpVtbl -> QueueAddArg(This,pvar)

#define IDadisp_QueueAddCmd(This,bstrIn)	\
    (This)->lpVtbl -> QueueAddCmd(This,bstrIn)

#define IDadisp_QueueEnd(This)	\
    (This)->lpVtbl -> QueueEnd(This)

#define IDadisp_QueueEval(This,pvOut)	\
    (This)->lpVtbl -> QueueEval(This,pvOut)

#define IDadisp_QueueClear(This)	\
    (This)->lpVtbl -> QueueClear(This)

#define IDadisp_Calculate(This,bstrIn,psa,pvOut)	\
    (This)->lpVtbl -> Calculate(This,bstrIn,psa,pvOut)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_GetData_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [in] */ BSTR bstrIn,
    /* [retval][out] */ VARIANT __RPC_FAR *pvOut);


void __RPC_STUB IDadisp_GetData_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_PutData_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [in] */ BSTR bstrIn,
    /* [in] */ VARIANT __RPC_FAR *pvIn,
    /* [retval][out] */ int __RPC_FAR *pintOut);


void __RPC_STUB IDadisp_PutData_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_Execute_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [in] */ BSTR bstrIn,
    /* [retval][out] */ int __RPC_FAR *pintOut);


void __RPC_STUB IDadisp_Execute_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE IDadisp_get_Visible_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [retval][out] */ int __RPC_FAR *Visible);


void __RPC_STUB IDadisp_get_Visible_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][propput][id] */ HRESULT STDMETHODCALLTYPE IDadisp_put_Visible_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [in] */ int Visible);


void __RPC_STUB IDadisp_put_Visible_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_Quit_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [optional][in] */ VARIANT __RPC_FAR *Confirm,
    /* [retval][out] */ int __RPC_FAR *pintOut);


void __RPC_STUB IDadisp_Quit_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_GetComplexData_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [in] */ BSTR bstrIn,
    /* [out] */ VARIANT __RPC_FAR *pvRe,
    /* [out] */ VARIANT __RPC_FAR *pvIm,
    /* [optional][in] */ VARIANT __RPC_FAR *pComplexType,
    /* [retval][out] */ int __RPC_FAR *pintOut);


void __RPC_STUB IDadisp_GetComplexData_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_PutComplexData_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [in] */ BSTR bstrIn,
    /* [in] */ VARIANT __RPC_FAR *pvRe,
    /* [in] */ VARIANT __RPC_FAR *pvIm,
    /* [optional][in] */ VARIANT __RPC_FAR *pvComplexType,
    /* [retval][out] */ int __RPC_FAR *pintOut);


void __RPC_STUB IDadisp_PutComplexData_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_GetVariantData_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [in] */ BSTR bstrIn,
    /* [optional][in] */ VARIANT __RPC_FAR *pvOutType,
    /* [optional][in] */ VARIANT __RPC_FAR *pvArrType,
    /* [retval][out] */ VARIANT __RPC_FAR *pvOut);


void __RPC_STUB IDadisp_GetVariantData_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_GetComplexVariantData_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [in] */ BSTR bstrIn,
    /* [out] */ VARIANT __RPC_FAR *pvRe,
    /* [out] */ VARIANT __RPC_FAR *pvIm,
    /* [optional][in] */ VARIANT __RPC_FAR *pvComplexType,
    /* [optional][in] */ VARIANT __RPC_FAR *pvOutType,
    /* [retval][out] */ int __RPC_FAR *pintOut);


void __RPC_STUB IDadisp_GetComplexVariantData_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_GetSeries_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [in] */ BSTR bstrIn,
    /* [out][in] */ SAFEARRAY __RPC_FAR * __RPC_FAR *psaOut,
    /* [retval][out] */ int __RPC_FAR *pintOut);


void __RPC_STUB IDadisp_GetSeries_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_PutSeries_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [in] */ BSTR bstrIn,
    /* [in] */ SAFEARRAY __RPC_FAR * psaIn,
    /* [retval][out] */ int __RPC_FAR *pintOut);


void __RPC_STUB IDadisp_PutSeries_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_GetComplexSeries_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [in] */ BSTR bstrIn,
    /* [out][in] */ SAFEARRAY __RPC_FAR * __RPC_FAR *psaRe,
    /* [out][in] */ SAFEARRAY __RPC_FAR * __RPC_FAR *psaIm,
    /* [in] */ int intComplexType,
    /* [retval][out] */ int __RPC_FAR *pintOut);


void __RPC_STUB IDadisp_GetComplexSeries_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_PutComplexSeries_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [in] */ BSTR bstrIn,
    /* [in] */ SAFEARRAY __RPC_FAR * psaRe,
    /* [in] */ SAFEARRAY __RPC_FAR * psaIm,
    /* [in] */ int intComplexType,
    /* [retval][out] */ int __RPC_FAR *pintOut);


void __RPC_STUB IDadisp_PutComplexSeries_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_GetFullMatrix_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [in] */ BSTR Name,
    /* [in] */ BSTR Workspace,
    /* [out][in] */ SAFEARRAY __RPC_FAR * __RPC_FAR *psaRe,
    /* [out][in] */ SAFEARRAY __RPC_FAR * __RPC_FAR *psaIm);


void __RPC_STUB IDadisp_GetFullMatrix_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_PutFullMatrix_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [in] */ BSTR Name,
    /* [in] */ BSTR Workspace,
    /* [in] */ SAFEARRAY __RPC_FAR * psaRe,
    /* [in] */ SAFEARRAY __RPC_FAR * psaIm);


void __RPC_STUB IDadisp_PutFullMatrix_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_GetCharArray_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [in] */ BSTR Name,
    /* [in] */ BSTR Workspace,
    /* [retval][out] */ BSTR __RPC_FAR *Str);


void __RPC_STUB IDadisp_GetCharArray_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_PutCharArray_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [in] */ BSTR Name,
    /* [in] */ BSTR Workspace,
    /* [in] */ BSTR Str);


void __RPC_STUB IDadisp_PutCharArray_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_Evaluate_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [in] */ BSTR bstrIn,
    /* [retval][out] */ BSTR __RPC_FAR *bstrOut);


void __RPC_STUB IDadisp_Evaluate_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_FnInit_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [in] */ BSTR bstrIn);


void __RPC_STUB IDadisp_FnInit_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_FnAddArg_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [in] */ VARIANT __RPC_FAR *pvar);


void __RPC_STUB IDadisp_FnAddArg_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_FnEval_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [retval][out] */ VARIANT __RPC_FAR *pvOut);


void __RPC_STUB IDadisp_FnEval_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_QueueInit_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [in] */ BSTR bstrIn);


void __RPC_STUB IDadisp_QueueInit_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_QueueAddArg_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [in] */ VARIANT __RPC_FAR *pvar);


void __RPC_STUB IDadisp_QueueAddArg_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_QueueAddCmd_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [in] */ BSTR bstrIn);


void __RPC_STUB IDadisp_QueueAddCmd_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_QueueEnd_Proxy( 
    IDadisp __RPC_FAR * This);


void __RPC_STUB IDadisp_QueueEnd_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_QueueEval_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [retval][out] */ VARIANT __RPC_FAR *pvOut);


void __RPC_STUB IDadisp_QueueEval_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_QueueClear_Proxy( 
    IDadisp __RPC_FAR * This);


void __RPC_STUB IDadisp_QueueClear_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [vararg][helpstring][id] */ HRESULT STDMETHODCALLTYPE IDadisp_Calculate_Proxy( 
    IDadisp __RPC_FAR * This,
    /* [in] */ BSTR bstrIn,
    /* [in] */ SAFEARRAY __RPC_FAR * psa,
    /* [retval][out] */ VARIANT __RPC_FAR *pvOut);


void __RPC_STUB IDadisp_Calculate_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IDadisp_INTERFACE_DEFINED__ */



#ifndef __DADiSP_LIBRARY_DEFINED__
#define __DADiSP_LIBRARY_DEFINED__

/* library DADiSP */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_DADiSP;

#ifndef __IDadispEvents_DISPINTERFACE_DEFINED__
#define __IDadispEvents_DISPINTERFACE_DEFINED__

/* dispinterface IDadispEvents */
/* [helpstring][uuid] */ 


EXTERN_C const IID DIID_IDadispEvents;

#if defined(__cplusplus) && !defined(CINTERFACE)

    MIDL_INTERFACE("35C93163-445F-11d9-9984-006008EB9591")
    IDadispEvents : public IDispatch
    {
    };
    
#else 	/* C style interface */

    typedef struct IDadispEventsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueryInterface )( 
            IDadispEvents __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void __RPC_FAR *__RPC_FAR *ppvObject);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *AddRef )( 
            IDadispEvents __RPC_FAR * This);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *Release )( 
            IDadispEvents __RPC_FAR * This);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfoCount )( 
            IDadispEvents __RPC_FAR * This,
            /* [out] */ UINT __RPC_FAR *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfo )( 
            IDadispEvents __RPC_FAR * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo __RPC_FAR *__RPC_FAR *ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetIDsOfNames )( 
            IDadispEvents __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR __RPC_FAR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID __RPC_FAR *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Invoke )( 
            IDadispEvents __RPC_FAR * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS __RPC_FAR *pDispParams,
            /* [out] */ VARIANT __RPC_FAR *pVarResult,
            /* [out] */ EXCEPINFO __RPC_FAR *pExcepInfo,
            /* [out] */ UINT __RPC_FAR *puArgErr);
        
        END_INTERFACE
    } IDadispEventsVtbl;

    interface IDadispEvents
    {
        CONST_VTBL struct IDadispEventsVtbl __RPC_FAR *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IDadispEvents_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IDadispEvents_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IDadispEvents_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IDadispEvents_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define IDadispEvents_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define IDadispEvents_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define IDadispEvents_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)

#endif /* COBJMACROS */


#endif 	/* C style interface */


#endif 	/* __IDadispEvents_DISPINTERFACE_DEFINED__ */


EXTERN_C const CLSID CLSID_DADiSPApp;

#ifdef __cplusplus

class DECLSPEC_UUID("d5215fa0-570a-11d3-9971-00c0150197bf")
DADiSPApp;
#endif
#endif /* __DADiSP_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

unsigned long             __RPC_USER  BSTR_UserSize(     unsigned long __RPC_FAR *, unsigned long            , BSTR __RPC_FAR * ); 
unsigned char __RPC_FAR * __RPC_USER  BSTR_UserMarshal(  unsigned long __RPC_FAR *, unsigned char __RPC_FAR *, BSTR __RPC_FAR * ); 
unsigned char __RPC_FAR * __RPC_USER  BSTR_UserUnmarshal(unsigned long __RPC_FAR *, unsigned char __RPC_FAR *, BSTR __RPC_FAR * ); 
void                      __RPC_USER  BSTR_UserFree(     unsigned long __RPC_FAR *, BSTR __RPC_FAR * ); 

unsigned long             __RPC_USER  LPSAFEARRAY_UserSize(     unsigned long __RPC_FAR *, unsigned long            , LPSAFEARRAY __RPC_FAR * ); 
unsigned char __RPC_FAR * __RPC_USER  LPSAFEARRAY_UserMarshal(  unsigned long __RPC_FAR *, unsigned char __RPC_FAR *, LPSAFEARRAY __RPC_FAR * ); 
unsigned char __RPC_FAR * __RPC_USER  LPSAFEARRAY_UserUnmarshal(unsigned long __RPC_FAR *, unsigned char __RPC_FAR *, LPSAFEARRAY __RPC_FAR * ); 
void                      __RPC_USER  LPSAFEARRAY_UserFree(     unsigned long __RPC_FAR *, LPSAFEARRAY __RPC_FAR * ); 

unsigned long             __RPC_USER  VARIANT_UserSize(     unsigned long __RPC_FAR *, unsigned long            , VARIANT __RPC_FAR * ); 
unsigned char __RPC_FAR * __RPC_USER  VARIANT_UserMarshal(  unsigned long __RPC_FAR *, unsigned char __RPC_FAR *, VARIANT __RPC_FAR * ); 
unsigned char __RPC_FAR * __RPC_USER  VARIANT_UserUnmarshal(unsigned long __RPC_FAR *, unsigned char __RPC_FAR *, VARIANT __RPC_FAR * ); 
void                      __RPC_USER  VARIANT_UserFree(     unsigned long __RPC_FAR *, VARIANT __RPC_FAR * ); 

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif
