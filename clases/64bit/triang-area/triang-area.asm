; Manejo de valores de coma flotante
; creador: abemen
; fecha: 21/04/2023
; compilar: nasm -f elf64 flotante.asm -l flotante.lst
; link:	gcc -m64 flotante.o -o flotante -no-pie

extern	printf

SECTION	.data
	base:		dq		5.6
	height:		dq		2.4
	base2:		dq		2.0
	format:		db	"AREA: (%f * %f) / 2 = %f", 10, 0

SECTION	.bss
	result:		resq	1

SECTION	.text

	global	main

main:
	; mult
	push	rbp
	fld		qword [base]			;carga el radio al registro ST0
	fmul	qword [height]			;radio * pi
	fstp	qword [result]			;guarda el resultado en el registro ST0

	; div
	fld		qword [result]			;carga el radio al registro ST0
	fdiv	qword [base2]			;radio * pi
	fstp	qword [result]			;guarda el resultado en el registro ST0

	mov		rdi,format				;cadena con formato de impresion
	movq	xmm0, qword [base]		;1er. parametro de coma flotante pi
	movq	xmm1, qword [height]	;2o. parametro de coma flotante radio
	movq	xmm2, qword [result]	;3er. parametro de coma flotante C
	mov		rax, 3					;numero de parametros de coma flotante

	call	printf

	pop		rbp


	mov	rax, 1
	xor	rbx, rbx
	int	80h