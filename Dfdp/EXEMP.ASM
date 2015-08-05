	IDT	'EXEMP'		*Unique Identifier
*************************************************
*    ASPI TMS32010 DIGITAL FILTER REALIZATION   *
*************************************************
*
*           3-STAGE RECURSIVE FILTER
*            SECOND ORDER SECTIONS
*          FILTER GENERATED FROM FILE
*                   exemp.FLT
*           Tue Aug 29 16:22:21 1989
*
*        Filter type: BANDSTOP
* Approximation type: ELLIPTIC
*      Sampling freq: 100000 HZ
*************************************************
	PSEG
	B	START
	BSS	6
************************************************
*         ASPI CARD INITIALIZATION CODE        *
************************************************
START
	LDPK	IOPAGE		*SET PAGE POINTER
	SOVM			*SATURATION ARITHMETIC
	CALL	INIT		*INITIALIZE
************************************************
*                MAIN I/O LOOP                 *
************************************************
DOUT	EQU	6		*D/A OUTPUT
DIN	EQU	6		*A/D INPUT
*
* The following three instructions are used in conjunction
* with the PATCH program to indicate an idle state where no
* machine cycles are being used to preform filter operation
* (i.e. The time that location 4 is 1 could be used to do
* other useful things).  PATCH monitors location 4 to determine
* percetage utilization of the processor by the filter.
*
LPTS	LACK	1
	SACL	FILTT
	OUT	FILTT,4		*SIGNAL IDLE STATE
*
LPTSA	BIOZ	GET		*WAIT FOR CLOCK
	B	LPTSA		*BRANCH IF NO CLOCK
*
GET	OUT	VSAMPL,DOUT	*OUTPUT LAST OUTPUT
	IN	VSAMPL,DIN	*INPUT SAMPLE
*
* The following three instructions are used in conjuction
* with the PATCH program to indicate a busy state or that the
* filter is in operation.
*
	LACK	0		*GET CONSTANT FOR IDLE
	SACL	FILTT		*SAVE FOR OUTPUT
	OUT	FILTT,4		*SIGNAL BUSY STATE
*
* The following three instructions are used to determine whether
* or not the filter should be active.  In the non-active state the
* input data is simply passed to the output.  In the active state
* the input data is filtered, then passed to the output.
*
	IN	FILTT,5		*CHECK FOR ACTIVE STATE
	LAC	FILTT
	BNZ	LPTS		*NOT ACTIVE, PASS DATA THROUGH
*
	CALL	FILTER		*ACTIVE EXECUTE FILTER
	B	LPTS		*LOOP
*************************************************
*           DATA MEMORY DEFINITION              *
*************************************************
*     CONTAINS:
*          STORAGE FOR FILTER INPUT AND OUTPUT
*          STORAGE FOR COEFFICIENTS
*          STORAGE FOR DELAY ELEMENTS
*************************************************
*
* FILTER INPUT and OUTPUT STORAGE
*
FILTT	EQU	0		*FILTER TEMPORY DATA
VSAMPL	EQU	1		*FILTER INPUT/OUTPUT DATA
IOPAGE	EQU	0
*
COEF
* COEFFICIENT INITIALIZATION STORAGE AREA
*
*
*  SECOND-ORDER SECTION # 01
*
	DATA	19992		*B0
	DATA	5935		*B1
	DATA	12775		*A2
	DATA	19992		*B2
*
*  SECOND-ORDER SECTION # 02
*
	DATA	25463		*B0
	DATA	-18877		*B1
	DATA	21010		*A1
	DATA	-25614		*A2
	DATA	25463		*B2
*
*  SECOND-ORDER SECTION # 03
*
	DATA	18427		*B0
	DATA	21997		*B1
	DATA	-24959		*A1
	DATA	-26974		*A2
	DATA	18427		*B2
*
	PEND
*
	CSEG	'XEXEMP'
* DELAY STORAGE DATA STORAGE AREA
*
DELAY	EQU	$
Z011	BSS	1
Z012	BSS	1
Z021	BSS	1
Z022	BSS	1
Z031	BSS	1
Z032	BSS	1
*
*
* COEFFICIENT DATA STORAGE AREA
*
FDATA	EQU	$
*
B010	BSS	1	*B0
B011	BSS	1	*B1
A012	BSS	1	*A2
B012	BSS	1	*B2
*
B020	BSS	1	*B0
B021	BSS	1	*B1
A021	BSS	1	*A1
A022	BSS	1	*A2
B022	BSS	1	*B2
*
B030	BSS	1	*B0
B031	BSS	1	*B1
A031	BSS	1	*A1
A032	BSS	1	*A2
B032	BSS	1	*B2
*
*
	CEND
*
	PSEG
*************************************************
*       FILTER INITIALIZATION SUBROUTINE        *
*************************************************
INIT	LACK	1		*GET A 1
	SACL	FILTT		*TEMPORARY SAVE
	LT	FILTT		*LOAD 1 IN T
	MPYK	COEF
	PAC			*AC POINTS TO COEF DATA
	MPYK	1		*1 INTO P
	LARK	0,FDATA		*POINTER TO DATA MEMORY
	LARK	1,13		*COUNT FOR NUMBER OF POINTS
ILP	LARP	0		*RESET AR TO 0
	TBLR	*+,1		*TRANSFER DATA VALUE
	APAC			*INCREMENT POINTER
	BANZ	ILP		*LOOP
	LARK	1,5		*NUMBER OF DELAY POINTS
	ZAC			*CLEAR ACCUMULATOR
	LARK	0,Z011		*POINT TO DELAY MEMORY
ILPA	LARP	0		*RESET AR TO 0
	SACL	*+,0,1		*CLEAR DATA VALUE
	BANZ	ILPA		*LOOP
	RET			*INIT RETURN
*************************************************
*              FILTER SUBROUTINE                *
*************************************************
*   ASSUMPTIONS:
*      SATURATION ARITHMETIC MODE IS ON
*      PAGE REGISTER IS SET TO COEF. PAGE
*
*   INPUT:    VSAMPL
*   OUTPUT:   VSAMPL
*
*************************************************
FILTER
*
* SECOND-ORDER FILTER SECTION # 01
*
	LAC	VSAMPL,15		*GET & SCALE INPUT
	SACH	FILTT		*SAVE SCALED INPUT
	LT	FILTT		*GET SCALED INPUT
	MPY	B010		*P = (B0 * INPUT)/2
	ZALH	Z011
	ADDH	Z011		*AC = Z-1
	APAC
	APAC				*AC = Z-1 + (B0 * INPUT)
	MPY	B011			*P = (B1 * INPUT)/2
	SACH	VSAMPL		*Save in OUTPUT
	PAC
	LT	VSAMPL		*AC = (B1 * INPUT)/2
	ADDH	Z012		*AC = (Z-2 + (B1 * INPUT))/2
	MPYK	-2968		*P = (A1 * OUTPUT)/2
	APAC			*AC = (Z-2 + (B1 * INPUT) + (A1 * OUTPUT))/2
	MPY	A012		*P = (A2 * OUTPUT)/2
	SACH	Z011		*Save in Z-1
	PAC			*AC = A2 * OUTPUT
	LT	FILTT
	MPY	B012		*P = (B2 * INPUT)/2
	APAC			*AC = ((B2 * INPUT) + (A2 * OUTPUT))/2
 	SACH	Z012	*Save in Z-2
*
* SECOND-ORDER FILTER SECTION # 02
*
	LAC	VSAMPL,15		*GET & SCALE INPUT
	SACH	FILTT		*SAVE SCALED INPUT
	LT	FILTT		*GET SCALED INPUT
	MPY	B020		*P = (B0 * INPUT)/2
	ZALH	Z021
	ADDH	Z021		*AC = Z-1
	APAC
	APAC				*AC = Z-1 + (B0 * INPUT)
	MPY	B021			*P = (B1 * INPUT)/2
	SACH	VSAMPL		*Save in OUTPUT
	PAC
	LT	VSAMPL		*AC = (B1 * INPUT)/2
	ADDH	Z022		*AC = (Z-2 + (B1 * INPUT))/2
	MPY	A021		*P = (A1 * OUTPUT)/2
	APAC
	APAC			*AC = (Z-2 + (B1 * INPUT) + (A1 * OUTPUT))/2
	MPY	A022		*P = (A2 * OUTPUT)/2
	SACH	Z021		*Save in Z-1
	PAC			*AC = A2 * OUTPUT
	LT	FILTT
	MPY	B022		*P = (B2 * INPUT)/2
	APAC			*AC = ((B2 * INPUT) + (A2 * OUTPUT))/2
 	SACH	Z022	*Save in Z-2
*
* SECOND-ORDER FILTER SECTION # 03
*
	ZALH	VSAMPL		*GET INPUT
	ADDH	VSAMPL		*SCALE INPUT
	SACH	FILTT		*SAVE SCALED INPUT
	LT	FILTT		*GET SCALED INPUT
	MPY	B030		*P = (B0 * INPUT)/2
	ZALH	Z031
	ADDH	Z031		*AC = Z-1
	APAC
	APAC				*AC = Z-1 + (B0 * INPUT)
	MPY	B031			*P = (B1 * INPUT)/2
	SACH	VSAMPL		*Save in OUTPUT
	PAC
	LT	VSAMPL		*AC = (B1 * INPUT)/2
	ADDH	Z032		*AC = (Z-2 + (B1 * INPUT))/2
	MPY	A031		*P = (A1 * OUTPUT)/2
	APAC
	APAC			*AC = (Z-2 + (B1 * INPUT) + (A1 * OUTPUT))/2
	MPY	A032		*P = (A2 * OUTPUT)/2
	SACH	Z031		*Save in Z-1
	PAC			*AC = A2 * OUTPUT
	LT	FILTT
	MPY	B032		*P = (B2 * INPUT)/2
	APAC			*AC = ((B2 * INPUT) + (A2 * OUTPUT))/2
 	SACH	Z032	*Save in Z-2
*
	RET			*RETURN
	PEND
	END
