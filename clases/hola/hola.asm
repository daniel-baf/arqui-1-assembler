; este es el hola mundo version 2
; creador: Mario y Daniel
; fecha: 3 de marzo del 2023
; Ejemplo no. 2 del ensamblador, calculo de longitud de cadena

SECTION .data
    ; db = data byte, pedazo de memoria de tamaño byte
    ; dw = dword...
    ; ddw = double word`
    ; usar ',' para concatenar caracteres`
    ; 0AH -> H de hexadecimal, caracter 10 (A)
    msg db  'Hola Arquitectura I', 0AH ; msg = Hola arqu...
    ; msg es la etiqueta que usaremos para acceder al espacio en memoria

SECTION .text
global _start ; gloobal = ambito y _start el atributo

_start: ; declaramos el "metodo"
    ; GUARDAMOS LAS DIRECCIONES DE INICIO
    mov ebx, msg    ; mueve la direccion de memoria de la cadena a ebx
    mov eax, ebx    ; eax = ebx | ebx = direccion de memroia de msg

    ; movemos a 'a' porque es el registro acumulador
    ; comparamos si ya ha finalizado la cadena
    ; la memoria de datos "rellenando" con 0s
    ; msg es direccion de memoria, necesitamos acceder al contendio de la informacion
sigChar: ; yo decidi ponerle el nombre sigChar, puede tener cualquier nombre
    cmp byte[eax], 0    ; seria como decir en C msg[eax] == 0?
    ; saltamos si no es 0
    jz final        ; GOTO final si se cumple la condicion de arriba
    inc eax         ; increamenta eax si no ha terminado la cadena
    jmp sigChar   ; salta a la etiqueta siguiente


final:
    ; obtenemos la longitud de la cadena
    sub eax, ebx
    ; DESPLIEGUE
    ; agregamos 'e' porque es 32 bits
    mov edx, eax     ; dx = longitud de cadena
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
mov     ebx, 0      ; return 0
mov     eax, 1      ; llama a SYS_EXIT (kernel.opcode 1)
int 80h             ;
