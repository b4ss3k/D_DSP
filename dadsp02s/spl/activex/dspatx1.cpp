/*****************************************************************************
*                                                                            *
*   DSPATX1.CPP  Copyright (C) 2002-2004 DSP Development Corporation         *
*                               All Rights Reserved                          *
*                                                                            *
*   Author:      Randy Race                                                  *
*                                                                            *
*   Synopsis:    Example of calling DADiSP from C++ via direct vtbl calls    *
*                using the PutData and GetComplexData Variant methods        *
*                                                                            *
*   Revisions:   30 Jan 2002  RRR  Creation                                  *
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

#include "actx.h" // DADiSP specific header


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
void      CreateLinearArray(double *darray, int size);


/* defines */
#define ARRAY_SIZE   4


/*
** DADiSP provides a COM dual interface to support Automation. This
** example demonstrates invoking DADiSP as an Automation Server 
** using the direct Vtbl IDadisp interface, a method that is easier 
** (and faster) for the C/C++ programmer but requires the ACTX.H 
** and ACTX_I.C files from DSP Development Corporation.
**
** DSPATX1 demonstrates the PutData and GetComplexData methods 
** that use VARIANTS to pass a SafeArray of data. See DSPATX2.CPP
** for a more efficient example that uses SafeArrays directly.
**
** When compiled and linked, this source file produces a stand-alone
** console based executable. Link with ACTX_I.C which provides the 
** symbols CLSID_DADiSPApp and IID_IDadisp.
*/


// array to transfer
double darray[ARRAY_SIZE*ARRAY_SIZE];


/* this is a console application */
int main ()
{
	SAFEARRAY *psa;
	VARIANT varResult, varRe, varIm, varType;
	VARIANTARG varg;
	BSTR bstrIn;
	IDadisp *pIDadisp = NULL;
	int iResult, status = 0;
	HRESULT hr;

	trace("dspatx1 DADiSP IDadisp Test, Initializing...\n");

	hr = OleInitialize(NULL);
	if (FAILED(hr)) 
	{
		trace("Failed to OleInitialize");
		return(1);
	}

	// start DADiSP as a direct vtbl automation server
	hr = ::CoCreateInstance(CLSID_DADiSPApp,   // DADiSP CLSID identifier
	                        NULL,
	                        CLSCTX_LOCAL_SERVER,
	                        IID_IDadisp,        // DADiSP Automation interface
	                        (void**)&pIDadisp);
	if (FAILED(hr))
	{
		trace("CoCreateInstance Failed");
		status = 1;
		goto exitpt;
	}
	trace("CoCreateInstance Succeeded.");


	if (pIDadisp == NULL) 
	{
		trace("QueryInterface Failed.");
		goto exitpt;
	}


	// ---------------------------
	//  dadisp.GetData("version")
	// ---------------------------

	trace("\ndadisp.getdata(\"version\")");

	// Convert the wide-character string to a BSTR.
	CstrToBstr("version", &bstrIn);

	// Allocate a variant for the returned parameter.
	::VariantInit(&varResult);

	// Invoke the function.
	hr = pIDadisp->GetData(bstrIn, &varResult);

	if (FAILED(hr))
	{
		trace("Invoke Failed - GetData");
		status = 1;
		goto exitpt;
	}

	// Display the returned value
	DisplayVariant(&varResult);

	// ------------------------------------
	//  dadisp.GetData("max(gnorm(100,1))")
	// ------------------------------------

	::SysFreeString(bstrIn);
	CstrToBstr("max(gnorm(100,1))", &bstrIn);

	// Allocate a variant for the returned parameter.
	::VariantInit(&varResult);

	trace("\ndadisp.getdata(\"max(gnorm(100,1))\")");

	// Invoke the function.
	hr = pIDadisp->GetData(bstrIn, &varResult);

	if (FAILED(hr))
	{
		trace("Invoke Failed - GetData");
		status = 1;
		goto exitpt;
	}

	// Display the returned value
	DisplayVariant(&varResult);

	// -------------------------------------
	//  dadisp.PutData("MyVar", LinearArray)
	// -------------------------------------

	::SysFreeString(bstrIn);
	CstrToBstr("MyVar", &bstrIn);

	// create a Linear array
	CreateLinearArray(darray, ARRAY_SIZE*ARRAY_SIZE);

	// convert to automation SafeArray
	psa = DarrayToSafeArray(darray, ARRAY_SIZE, ARRAY_SIZE);

	// Allocate and initialize a VARIANT argument.
	::VariantInit(&varg);             // Initialize the VARIANT 
	V_VT(&varg)     = VT_ARRAY|VT_R8; // Array of doubles    
	V_ARRAY(&varg)  = psa;            // Data for the VARIANT

	// Invoke the function.
	hr = pIDadisp->PutData(bstrIn, &varg, &iResult);

	if (FAILED(hr))
	{
		trace("Invoke Failed - PutData");
		status = 1;
		goto exitpt;
	}

	// Display the input array
	trace("\nLinear Input Array:");
	DisplayVariant(&varg);

	// ------------------------------------
	//  dadisp.GetComplexData("FFT(MyVar)")
	// ------------------------------------

	::SysFreeString(bstrIn);
	CstrToBstr("FFT(MyVar)", &bstrIn);

	::VariantInit(&varResult);
	::VariantInit(&varRe);
	::VariantInit(&varIm);

	::VariantInit(&varType);  // Initialize the VARIANT 
	V_VT(&varType)  = VT_I4;  // Integer    
	V_I4(&varType)  = 1;      // Complex Type, 1 == Real/Imag

	// Invoke the function.
	hr = pIDadisp->GetComplexData(bstrIn, &varRe, &varIm, &varType, &iResult);

	if (FAILED(hr))
	{
		trace("Invoke Failed - GetComplexData");
		status = 1;
		goto exitpt;
	}

	// Display the returned arrays
	trace("\nFFT of each Column, Real Part:");
	DisplayVariant(&varRe);

	trace("\nFFT of each Column, Imag Part:");
	DisplayVariant(&varIm);


exitpt:

	// Release the interface.
	if (pIDadisp) pIDadisp->Release();

	// Uninitialize the OLE library.
	OleUninitialize();
	return(status);
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

	dim = (ncol > 1) ? 2 : 1;

	if (dim > 1) 
	{
		sa[0].lLbound = 0;
		sa[0].cElements = nrow;

		sa[1].lLbound = 0;
		sa[1].cElements = ncol;
	}
	else 
	{
		sa[0].lLbound = 0;
		sa[0].cElements = nrow;
	}

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
	double *dval;
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
		dval = (double *) pvdata;

		for (i = 0; i < nrow; i++) 
		{
			for (j = 0; j < ncol; j++)
			{
				printf("%9g ", *(dval + j * nrow));
			}
			printf("\n");
			dval++;
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

