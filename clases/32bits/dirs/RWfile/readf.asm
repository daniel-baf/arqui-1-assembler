; creacion y escritura de un arvhivo
; creador: @daniel-baf
; fecha: 2023-04-12

%include        '../../../../utils/stdio32.asm'

SECTION .data
    filename        db      'readme.txt', 0H
    content         db      'hola mundo!', 0H
    prnt_result     db      '-- contenido en el archivo', 0H

SECTION .bss
    line:           resb       255

SECTION .text
    global      _start

_start:
    ; creamos archivo
    mov         ecx, 0754o      ; permisos del archivo
    mov         ebx, filename   ; nombre del archivo
    mov         eax, 8          ; funcion sys_create
    int         80h             ; llamada a kernel

    push        eax             ; guardamos el descriptor regresado por la creacion

    ; escribir contenido
    mov         eax, content    ; eax = contenido
    call        strLen          ; eax = eax.len

    mov         edx, eax        ; longitud de lo que vamos a escribir
    mov         ecx, content    ; lo que vamos a escribir
    pop         eax             ; recuperamos el descriptor
    mov         ebx, eax        ; agregamos el descriptor
    mov         eax, 4          ; sys_write
    int         80h             ; llamada a kernel

    ; leer el archivo

    mov         eax, prnt_result ; mensaje temporal
    call        print       ; imprime el mensaje

    ; abrir archivo en modo lectura
    mov         ecx, 0           ; bandera O_READONLY
    mov         ebx, filename    ; nombre dela archivo
    mov         eax, 5           ; SYS_OPEN
    int         80h              ; kernel

    mov         edx, 10          ; 
    mov         ecx, line        ; donde guardar
    mov         ebx, eax
    mov         eax, 3
    int         80h

    mov         eax, line
    call        print

    mov         ebx, ebx         ; si hubieramos hecho algo
    mov         eax, 0
    int         80h


    call        sys_exit
