MEMORY
{
	PAGE 0: PDATA: origin = 0h length = 100000h
	PAGE 1: IDATA: origin = 0h length = 100000h
}
SECTIONS
{
	.bss: {} PAGE 1
	.text: {}
	XELLIP 2 (NOLOAD) : {} PAGE 1
}
