	B	START
	.space	6*16
;************************************************
;*              INITIALIZATION CODE             *
;************************************************
START:
	CNFD			;SET BANK 0 TO DATA MEMORY
	LDPK	IOPAGE		;SET PAGE POINTER
	SOVM			;SATURATION ARITHMETIC
	SSXM			;SET SIGN EXTEND MODE ON
	SPM	1		;SET P REGISTER OUTPUT SHIFT TO 1
	CALL	INIT		;INITIALIZE
;************************************************
;*                MAIN I/O LOOP                 *
;************************************************
DOUT	EQU	6		;D/A OUTPUT
DIN	EQU	6		;A/D INPUT

LPTS	BIOZ	GET		;WAIT FOR CLOCK
	B	LPTS		;BRANCH IF NO CLOCK

GET	OUT	VSAMPL,DOUT	;OUTPUT LAST OUTPUT
	IN	VSAMPL,DIN	;INPUT SAMPLE

	CALL	FILTER		;EXECUTE FILTER
	B	LPTS		;LOOP
