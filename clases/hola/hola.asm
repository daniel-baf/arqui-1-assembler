; este es el hola mundo version 1
; creador: Mario y Daniel
; fecha: 1 de marzo del 2023
; Ejemplo no. 1 del ensamblador

SECTION .data
    ; db = data byte, pedazo de memoria de tamaño byte
    ; dw = dword...
    ; ddw = double word`
    ; usar ',' para concatenar caracteres`
    ; 0AH -> H de hexadecimal, caracter 10 (A)
    msg db  'Hola Arquitectura I', 0AH ; msg = Hola arqu...

SECTION .text
global _start ; gloobal = ambito y _start el atributo

_start: ; declaramos el "metodo"
    ; agregamos 'e' porque es 32 bits
    mov edx, 20     ; dx = longitud de cadena
    mov ecx, msg    ; cx = msg
    mov ebx, 1      ; STDOUT file
    mov eax, 4      ; funcion de sistema SYS_WRITE
    int 80h         ; llamada de sistema del kernel

; compilamos nasm -f <TIPO_FORMATO> (32 bits, 64...) <ARCHIVO>
;       elf = i386 (32 bits)
;       clf64 = arquitectura 64 bits
; compilamos con nasm -f elf nombre.asm

; linkear objetos con "ld"
; ld -m <FORMATO> <ARCHIVO> -o <NOMBRE EXE>
; ld -m elf_i386 hola.o -o hola

; ejecuta con ./<NOMBRE>
; esto genera un error