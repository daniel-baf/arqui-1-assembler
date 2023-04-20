; recopilacion de funciones para el programa usando la entrada y salida
; estandar de la computadora
; creador: @daniel-baf
; fecha: 10 de marzo del 2023
; ultima actualización: 24 de marzo del 2023

SECTION .data

SECTION .bss

SECTION .text
; ------------------------------------------ ;
;           TERMINA EL PROGRAMA              ;
; ------------------------------------------ ;
sys_exit:
    mov         rax, 60     ; SYS_EXIT
    xor         rdi, rdi    ; clear rdi
    syscall


; STRLEN = rax=<CADENA> rax.length -> <LONGITUD>
strLen:
    push        rbx                         ; guardamos su valor en pila
    mov         rbx, rax                    ; rax = rbx | rbx = dir en memoria de rax

    .next_char:
        cmp         byte[rax], 0            ; msg[rax] == 0 ?
        jz          .next_char_end          ; GOTO .next_char_end cuando no hayan mas chars
        inc         rax                     ; rax++ para loop
        jmp         .next_char              ; continua el loop

    .next_char_end:
    sub         rax, rbx                    ; longitud de la cadena = rax - rbx
    pop         rbx                         ; recupera el valor de rbx
    ret                                     ; fin de funcion

; ------------------------------------------ ;
;           IMPRESION EN PANTALLA            ;
; ------------------------------------------ ;

; imprime un string sin salto de linea
print:
    ; backup de los valores de los registros
    .backup:
        push        rax             ; recuperamos el valor al final
        push        rdx
        push        rcx
        push        rbx
        push        rax             ; strLen modifica eax

    push        rax
    call        strLen          ; calculamos la longitud de la cadena
    mov         rdx, rax        ; rdx = rax, rax actualmente es la longitud
    pop         rax             ; recuperamos el valor a imprimir

    mov     rdx, rdx     ; msg.len
    mov     rsi, rax    ; rsi -> *msg | source index
    mov     rdi, 1      ; rdi -> STOUT, standar out | destiny index
    mov     rax, 1      ; SYS_WRITE
    syscall             ; syscall or int 80H

    .restore:
        pop        rax             ; strLen modifica eax
        pop        rbx
        pop        rcx
        pop        rdx
        pop        rax             ; recuperamos el valor al final

    ret