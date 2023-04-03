; Operaciones aritmeticas entre dos valores enteros
; creador: Josue Maldonado
; fecha: 24/03/2023

%include '../../utils/stdio32.asm'

SECTIOn .data
	suma	db	'Suma: 90 + 9: ',0h
	resta	db	'Resta: 99 - 81: ',0h
	multi	db	'Multiplicacion 18 * 4: ',0h
	divi	db	'Division 72 / 5: ', 0h
	resi	db	' residuo: ',0h


SECTION .text
	global	_start

_start:
;-------------Suma-----------------------
	mov	eax, suma
	call	print

	mov	eax, 90
	mov	ebx, 9
	add	eax, ebx
	call	iPrintLn

;-----------Resta-----------------------
	push 	eax

	mov	eax, resta
	call	print

	pop 	eax
	mov 	ebx, 81
	sub	eax, ebx
	call	iPrintLn

;------------Multiplicacion---------------
	push	eax

	mov	eax, multi
	call	print

	pop	eax
	mov	ebx, 4
	mul	ebx
	call	iPrintLn


;-------------Division-------------------
	push	eax
	
	mov	eax, divi
	call	print
	
	pop	eax
	push	edx
	mov	edx, 0
	mov	ebx, 5
	div	ebx
	call iPrintLn

	push	edx		;Guarda edx en pila, edx = residuo
	mov	eax, resi
	call	print
	pop	eax
	call	iPrintLn
	
	pop	edx

	call	sys_exit

