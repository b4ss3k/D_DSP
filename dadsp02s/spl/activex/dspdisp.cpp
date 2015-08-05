/*****************************************************************************
*                                                                            *
*   DSPDISP.CPP  Copyright (C) 2001-2004 DSP Development Corporation         *
*                               All Rights Reserved                          *
*                                                                            *
*   Author:      Randy Race                                                  *
*                                                                            *
*   Synopsis:    Example of calling DADiSP from C++ using IDispatch          *
*                (standard Automation)                                       *
*                                                                            *
*   Revisions:   18 Jan 2001  RRR  Creation                                  *
*                 4 Nov 2004  RRR  V_VT macros for variants                  *
*                                                                            *
*****************************************************************************/

#include <windows.h>
#include <iostream.h>
#include <objbase.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <strstrea.h>
#include <time.h>


/* forward declarations */
int       CstrToBstr(char *str, BSTR *pbstr);
char      *BstrToCstr(BSTR bstr);
int       strncpyfar(char *l, LPCOLESTR f, int n);
BOOL      ANSIToUnicode(PCSTR szStrA, PWSTR *pszStrW);
SAFEARRAY *DarrayToSafeArray(double *s, int nrow, int ncol);
void      ShowException(LPOLESTR szMember, HRESULT hr, EXCEPINFO *pexcep, unsigned int uiArgErr);
void      trace(char *msg);
void      DisplayVariant(VARIANT *pvar);
void      DisplayArray(SAFEARRAY *psa, int vtype);
void      CreateRandomArray(double *darray, int size);


/* defines */
#define STRSIZE    255
#define ARRAY_SIZE   4
#define MAX_PCOLS    8

double darray[ARRAY_SIZE];


/*
** DADiSP provides a COM dual interface to support Automation. This
** example demonstrates invoking DADiSP as an Automation Server 
** via the ActiveX standard IDispatch interface. 
**
** Using IDispatch/Invoke is standard for interpreted languages such
** as Visual Basic and even SPL. However IDispatch is very clumsy for
** the C++ programmer. See DSPATX1.CPP and DSPATX2.CPP for examples of 
** using the direct Vtbl IDadisp interface - much more straightforward 
** for C++ users.
*/


/* this is a console application */
int main ()
{
	EXCEPINFO excepinfo;
	unsigned int argerr;
	SAFEARRAY *psa;
	DISPID dispid;	
	OLECHAR *name;
	VARIANT varResult;
	VARIANTARG varg, varga[2];
	BSTR bstrIn;
	IDispatch *pIDispatch = NULL;
	int status = 0;
	HRESULT hr;

	printf("dspdisp - DADiSP IDispatch Test, Initializing...\n");

	hr = OleInitialize(NULL);
	if (FAILED(hr)) 
	{
		trace("Failed to OleInitialize");
		return(1);
	}

	// Get the CLSID for the application.
	wchar_t progid[] = L"DADiSP.Application";
	CLSID clsid;
 	hr = ::CLSIDFromProgID(progid, &clsid);
	if(FAILED(hr))
	{
		trace("Failed to CLSIDFromProgID");
		status = 1;
		goto exitpt;
	}

	// start DADiSP as an automation server
	hr = ::CoCreateInstance(clsid,
	                        NULL,
	                        CLSCTX_LOCAL_SERVER,
	                        IID_IDispatch,
	                        (void**)&pIDispatch);
	if (FAILED(hr))
	{
		trace("CoCreateInstance Failed");
		status = 1;
		goto exitpt;
	}
	trace("CoCreateInstance Succeeded.");


	// ---------------------------
	//  dadisp.getdata("version")
	// ---------------------------

	// First we need to get the ID for the function name
	ANSIToUnicode("GetData", &name);

	hr = pIDispatch->GetIDsOfNames(IID_NULL,
	                               &name,
	                               1,
	                               GetUserDefaultLCID(),
	                               &dispid);
	if (FAILED(hr))
	{
		trace("Query GetIDsOfNames Failed");
		status = 1;
		goto exitpt;
	}
	
	trace("\ndadisp.getdata(\"version\")");

	// Convert the wide-character string to a BSTR.
	CstrToBstr("version", &bstrIn);

	// Build up the parameters for the invoke call.

	// Allocate and initialize a VARIANT argument.
	::VariantInit(&varg);      // Initialize the VARIANT.
	V_VT(&varg)   = VT_BSTR;   // Type of VARIANT data
	V_BSTR(&varg) = bstrIn;    // Data for the VARIANT

	// Fill in the DISPPARAMS structure.
	DISPPARAMS param;
	param.cArgs = 1;                 // Number of arguments
	param.rgvarg = &varg;            // Arguments
	param.cNamedArgs = 0;            // Number of named args
	param.rgdispidNamedArgs = NULL;  // Named arguments

	// Allocate a variant for the returned parameter.
	::VariantInit(&varResult);

	// Invoke the function.
	hr = pIDispatch->Invoke(dispid,
	                        IID_NULL,
	                        GetUserDefaultLCID(),
	                        DISPATCH_METHOD,
	                        &param,
	                        &varResult,
	                        &excepinfo,
	                        &argerr);
	if (FAILED(hr))
	{
		trace("Invoke Failed");
		ShowException(name, hr, &excepinfo, argerr);
		status = 1;
		goto exitpt;
	}

	// Display the returned value
	DisplayVariant(&varResult);


	// ------------------------------------
	//  dadisp.getdata("max(gnorm(100,1))")
	// ------------------------------------

	::SysFreeString(bstrIn);
	CstrToBstr("max(gnorm(100,1))", &bstrIn);

	// Build up the parameters for the invoke call.

	// Allocate and initialize a VARIANT argument.
	::VariantInit(&varg);      // Initialize the VARIANT.
	V_VT(&varg)   = VT_BSTR;   // Type of VARIANT data
	V_BSTR(&varg) = bstrIn;    // Data for the VARIANT

	// Fill in the DISPPARAMS structure.
	param.cArgs = 1;                 // Number of arguments
	param.rgvarg = &varg;            // Arguments
	param.cNamedArgs = 0;            // Number of named args
	param.rgdispidNamedArgs = NULL;  // Named arguments

	// Allocate a variant for the returned parameter.
	::VariantInit(&varResult);

	trace("\ndadisp.getdata(\"max(gnorm(100,1))\")");

	// Invoke the function.
	hr = pIDispatch->Invoke(dispid,
	                        IID_NULL,
	                        GetUserDefaultLCID(),
	                        DISPATCH_METHOD,
	                        &param,
	                        &varResult,
	                        &excepinfo,
	                        &argerr);
	if (FAILED(hr))
	{
		trace("Invoke Failed");
		ShowException(name, hr, &excepinfo, argerr);
		status = 1;
		goto exitpt;
	}

	// Display the returned value
	DisplayVariant(&varResult);



	// -------------------------------------
	//  dadisp.putdata("MyVar", RandomArray)
	// -------------------------------------

	free(name);
	ANSIToUnicode("Putdata", &name);

	hr = pIDispatch->GetIDsOfNames(IID_NULL,
	                               &name,
	                               1,
	                               GetUserDefaultLCID(),
	                               &dispid);
	if (FAILED(hr))
	{
		trace("Query GetIDsOfNames Failed");
		status = 1;
		goto exitpt;
	}

	// create a random array
	CreateRandomArray(darray, ARRAY_SIZE);

	// convert to automation SafeArray
	psa = DarrayToSafeArray(darray, ARRAY_SIZE, 1);

	::SysFreeString(bstrIn);
	CstrToBstr("MyVar", &bstrIn);

	// Allocate and initialize a VARIANT argument.
	// This routine has two arguments, must add in *reverse* order

	::VariantInit(&varga[1]);        // Initialize the VARIANT.
	V_VT(&(varga[1]))   = VT_BSTR;   // DADiSP variable name
	V_BSTR(&(varga[1])) = bstrIn;    // Data for the VARIANT

	::VariantInit(&varga[0]);              // Initialize the VARIANT.
	V_VT(&(varga[0]))    = VT_ARRAY|VT_R8; // Array of doubles
	V_ARRAY(&(varga[0])) = psa;            // Data for the VARIANT


	// Fill in the DISPPARAMS structure.
	param.cArgs = 2;                 // Number of arguments
	param.rgvarg = varga;            // Arguments
	param.cNamedArgs = 0;            // Number of named args
	param.rgdispidNamedArgs = NULL;  // Named arguments

	// Allocate a variant for the returned parameter.
	::VariantInit(&varResult);

	// Invoke the function.
	hr = pIDispatch->Invoke(dispid,
	                        IID_NULL,
	                        GetUserDefaultLCID(),
	                        DISPATCH_METHOD,
	                        &param,
	                        &varResult,
	                        &excepinfo,
	                        &argerr);
	if (FAILED(hr))
	{
		trace("Invoke Failed");
		ShowException(name, hr, &excepinfo, argerr);
		status = 1;
		goto exitpt;
	}

	// Display the input array
	trace("\nRandom Input Array:");

	DisplayVariant(&varga[0]);


	// ---------------------------------
	//  dadisp.getdata("fft(MyVar)")
	// ---------------------------------

	free(name);
	ANSIToUnicode("Getdata", &name);

	hr = pIDispatch->GetIDsOfNames(IID_NULL,
	                               &name,
	                               1,
	                               GetUserDefaultLCID(),
	                               &dispid);
	if (FAILED(hr))
	{
		trace("Query GetIDsOfNames Failed");
		status = 1;
		goto exitpt;
	}

	::SysFreeString(bstrIn);
	CstrToBstr("fft(MyVar)", &bstrIn);

	// Allocate and initialize a VARIANT argument.
	::VariantInit(&varg);      // Initialize the VARIANT.
	V_VT(&varg)   = VT_BSTR;   // Type of VARIANT data
	V_BSTR(&varg) = bstrIn;    // Data for the VARIANT


	// Fill in the DISPPARAMS structure.
	param.cArgs = 1;                 // Number of arguments
	param.rgvarg = &varg;            // Arguments
	param.cNamedArgs = 0;            // Number of named args
	param.rgdispidNamedArgs = NULL;  // Named arguments

	// Allocate a variant for the returned parameter.
	::VariantInit(&varResult);

	// Invoke the function.
	hr = pIDispatch->Invoke(dispid,
	                        IID_NULL,
	                        GetUserDefaultLCID(),
	                        DISPATCH_METHOD,
	                        &param,
	                        &varResult,
	                        &excepinfo,
	                        &argerr);
	if (FAILED(hr))
	{
		trace("Invoke Failed");
		ShowException(name, hr, &excepinfo, argerr);
		status = 1;
		goto exitpt;
	}

	// Display the returned array
	trace("\nFFT Output Array:");
	DisplayVariant(&varResult);

exitpt:

	// Release the dispatch interface.
	if (pIDispatch) pIDispatch->Release();

	// Uninitialize the OLE library.
	OleUninitialize();
	return(0);
}






/* --------------------- Support Routines -------------------------*/


// convert a string to a BSTR
int CstrToBstr (char *str, BSTR *pbstr)
{
	wchar_t *wsz = NULL;
	int status = TRUE;

	ANSIToUnicode(str, &wsz);
	*pbstr = ::SysAllocString(wsz);

	if (*pbstr == NULL) 
	{
		status = FALSE;
	}
	free(wsz);

	return(status);
}


// convert a BSTR to a string
char *BstrToCstr (BSTR bstr)
{
	int len;
	char *str = NULL;

	if ((len = ::SysStringByteLen(bstr)) > 0) 
	{
		if ((str = new char[len+1]) != NULL) 
		{
			strncpyfar(str, bstr, len);
		}
	}
	return(str);
}


// strcpy at most n chars from FAR memory
int strncpyfar (char *l, LPCOLESTR f, int n)
{
	while (n > 0) 
	{
		if ((*l = (char) *f) == '\0') break;
		l++;
		f++;
		n--;
	}
	return(TRUE);
}


// convert C string to Unicode
BOOL ANSIToUnicode (PCSTR szStrA, PWSTR *pszStrW) 
{
	int nLenOfWideCharStr;
	BOOL fOK = FALSE;              // Assume failure

	*pszStrW = NULL;               // Assume failure
	if (szStrA == NULL) 
	{
		// It is OK to have a NULL string.
		return(TRUE);
	}

	// Get the number of bytes needed for the wide version of the string.
	nLenOfWideCharStr = ::MultiByteToWideChar(CP_ACP, 0, szStrA, -1, NULL, 0);

	// Allocate memory to accomodate the size of the wide character string.
	*pszStrW = new WCHAR[nLenOfWideCharStr];

	if (*pszStrW != NULL) 
	{
		// Convert the multi-byte string to a wide-character string.
		::MultiByteToWideChar(CP_ACP, 0, szStrA, -1, *pszStrW, nLenOfWideCharStr);
		fOK = TRUE;
	}
	return(fOK);
}


// convert double array to SAFEARRAY
SAFEARRAY *DarrayToSafeArray (double *darray, int nrow, int ncol)
{
	long iL, jL;
	int status = FALSE;
	double *pdval;
	SAFEARRAY *psa;
	SAFEARRAYBOUND sa[2];
	HRESULT hr;
	unsigned int dim;
	void *pvdata;

	if (darray == NULL) return(NULL);

	dim = 2;

	sa[0].lLbound = 0;
	sa[0].cElements = nrow;

	sa[1].lLbound = 0;
	sa[1].cElements = ncol;

	if ((psa = ::SafeArrayCreate(VT_R8, dim, sa)) != NULL) 
	{
		if ((hr = ::SafeArrayAccessData(psa, (LPVOID *) &pvdata)) != NOERROR) 
		{
			return(NULL);
		}

		pdval = (double *) pvdata;

		if (ncol == 1L)  /* series */
		{
			for (iL = 0L; iL < nrow; iL++) 
			{
				*pdval++ = *darray++;
			}
			status = TRUE;
		}

		else /* general case - array */
		{
			/* for each col ... */
			for (iL = 0L; iL < ncol; iL++) 
			{
				/* for each row ... */
				for (jL = 0; jL < nrow; jL++) 
				{
					*pdval++ = *darray++;
				}
			}
			status = TRUE;
		}
		::SafeArrayUnaccessData(psa);
	}

	return(psa);
}


// create an empty SafeArray
SAFEARRAY *CreateSafeArray ()
{
	SAFEARRAY *psa;
	SAFEARRAYBOUND sa[2];
	unsigned int dim;

	dim = 2;

	// no rows
	sa[0].lLbound = 0;
	sa[0].cElements = 0;

	// one column
	sa[1].lLbound = 0;
	sa[1].cElements = 1;

	psa = ::SafeArrayCreate(VT_R8, dim, sa);
	return(psa);
}



// output a message
void trace (char *msg)
{
	printf("%s\n", msg);
}


// display variant as a string
void DisplayVariant (VARIANT *pvar)
{
	VARIANT vtemp, *ptemp;
	int vtype;
	char *str;

	if (V_ISARRAY(pvar)) 
	{
		vtype = V_VT(pvar) & ~VT_ARRAY;
		DisplayArray(V_ARRAY(pvar), vtype);
	}
	else 
	{
		// Display result as a string
		if (V_VT(pvar) != VT_BSTR)
		{
			::VariantInit(&vtemp);
			::VariantChangeType(&vtemp, pvar, 0, VT_BSTR);
			ptemp = &vtemp;
		}
		else
		{
			ptemp = pvar;
		}

		if (V_VT(ptemp) == VT_BSTR) 
		{
			str = BstrToCstr(V_BSTR(ptemp));
			printf("DADiSP returned: %s\n", str);
			free(str);

			// Free the string.
			if (ptemp == &vtemp)
			{
				::SysFreeString(V_BSTR(ptemp));
			}
		}
		else 
		{
			printf("Could Not Display Type %d", V_VT(pvar));
		}
	}
}


// simple screen display of an array	
void DisplayArray (SAFEARRAY *psa, int vtype)
{
	int i, j, nrow, ncol, num;
	HRESULT hr;
	double *pdval;
	void *pvdata;

	if (psa == NULL) return;

	if (psa->fFeatures & FADF_VARIANT) 
	{
		vtype = VT_VARIANT;
	}

	nrow = ncol = num = 0;

	// get num rows & columns
	if (psa->cDims > 1) 
	{
		/* note : these are flipped from creation */
		ncol = psa->rgsabound[0].cElements;
		nrow = psa->rgsabound[1].cElements;
	}
	else 
	{
		nrow = psa->rgsabound[0].cElements;
		ncol = 1;
	}

	if ((hr = ::SafeArrayAccessData(psa, (LPVOID *) &pvdata)) != NOERROR) 
	{
		return;
	}

	// we only handle an array of doubles for now
	if (vtype == VT_R8) 
	{
		pdval = (double *) pvdata;

		for (i = 0; i < nrow; i++) 
		{
			for (j = 0; j < ncol; j++)
			{
				printf("%9g ", *(pdval + j * nrow));
			}
			printf("\n");
			pdval++;
		}
	}

	::SafeArrayUnaccessData(psa);
}


// set array to random data
void CreateRandomArray (double *darray, int size)
{
	int i;

	// randomly seed the generator 
	srand((int) clock());

	// create random array
	for (i = 0; i < size; i++) 
	{
		*darray++ = (double) rand();
	}
}

/* create 1..n arrays */
void CreateLinearArray (double *darray, int size)
{
	int i;

	// randomly seed the generator 
	srand((int) clock());

	// create random array
	for (i = 0; i < size; i++) 
	{
		*darray++ = (double) (i+1);
	}
}

// handy function to display Automation errors
void ShowException (LPOLESTR szMember, HRESULT hr, EXCEPINFO *pexcep, unsigned int uiArgErr)
{
	char *str;
	char memstr[STRSIZE+1], mes[STRSIZE+1];

	memstr[STRSIZE] = '\0';
	mes[STRSIZE]    = '\0';

	strncpyfar(memstr, szMember, STRSIZE);
	
	switch (GetScode(hr)) 
	{
		case DISP_E_UNKNOWNNAME:
			sprintf(mes, "%s: Unknown name or named argument.", memstr);
			break;
	
		case DISP_E_BADPARAMCOUNT:
			sprintf(mes, "%s: Incorrect number of arguments.", memstr);
			break;
			
		case DISP_E_EXCEPTION:
			sprintf(mes, "%s: Error %d: ", memstr, pexcep->wCode);
			if (pexcep->bstrDescription != NULL) 
			{
				str = BstrToCstr(pexcep->bstrDescription);
				strcat(mes, str);
				free(str);
			}
			else 
			{
				strcat(mes, "<<No Description>>");
			}
			break;
			
		case DISP_E_MEMBERNOTFOUND:
			sprintf(mes, "%s: method or property not found.", memstr);
			break;
		
		case DISP_E_OVERFLOW:
			sprintf(mes, "%s: Overflow while coercing argument values.", memstr);
			break;
		
		case DISP_E_NONAMEDARGS:
			sprintf(mes, "%s: Object implementation does not support named arguments.",
						memstr);
		    break;
		    
		case DISP_E_UNKNOWNLCID:
			sprintf(mes, "%s: The locale ID is unknown.", memstr);
			break;
		
		case DISP_E_PARAMNOTOPTIONAL:
			sprintf(mes, "%s: Missing a required parameter.", memstr);
			break;
		
		case DISP_E_PARAMNOTFOUND:
			sprintf(mes, "%s: Argument not found, argument %d.", memstr, uiArgErr);
			break;
			
		case DISP_E_TYPEMISMATCH:
			sprintf(mes, "%s: Type mismatch, argument %d.", memstr, uiArgErr);
			break;

		default:
			sprintf(mes, "%s: Unknown error occured.", memstr);
			break;
	}
	
	printf(mes);
}


