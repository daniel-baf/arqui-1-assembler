%include    '../utils/stdio32.asm'
%include    ''

SECTION .data
    msg_as_num      db          "El numero como numero es: ", 0H
    msg_as_str      db          "El numero como string es: ", 0H
    str_num         db          "541", 0H
SECTION .bss
SECTION .text
    global      _start

_start:
    mov         eax, msg_as_str
    call        print
    mov         eax, str_num
    call        println

    mov         eax, msg_as_num
    call        print
    mov         eax, str_num
    call        atoi
;    call        iPrintLn
    call        sys_exit

; num abcd -> a + 0 * 10 = a
;          -> b + 1 * 10 = b + 10
;          -> c + (b + 10) * 10 = c + 10b + 100 ...
; inspirado en el funcionamiento de atoi() en C https://cplusplus.com/reference/cstdlib/atoi/
;"abc"
; |||     val = 0
; |||______ val = val + ('c' - 48) * 10power0       [val now is c]
; ||_______ val = c   + ('b' - 48) * 10power1       [val now is bc] 
; |________ val = b  + ('a' - 48) * 10power2        [val now is abc]
;
atoi:
    push        ebx                     ; backup
    push        eax

    mov         ebx, eax                ; copy
    
    call        strLen                  ; calculamos la potencia
    dec         eax                     ; le restamos 1
    mov         edx, eax                ; guardamos en d
    pop         eax

    .atoi_loop:
        cmp         byte[ebx], 0            ; is null?
        jz          .atoi_loop_end
    
        ; SECCION de codigo que verifica que este en los parametros [0,9]
        cmp         byte[ebx], 48           ; es menor que ASCII(0)?
        jl          .atoi_loop_continue
        cmp         byte[ebx], 57          ; es mayor que ASCII(9)?
        jg          .atoi_loop_continue
    
        ; esta en el rango [0,9]
        mov         al, [ebx]               ; obtenemos el valor en ese byte
        sub         al, 48                  ; le restamos el codigo de su ascii
        mov         cl, al

        .atoi_loop_cast:
            push        eax
            mov         eax, ecx
            call        iPrintLn
            pop         eax
    
        .atoi_loop_continue:
        inc         ebx                     ; ebx ++
        jmp         .atoi_loop

    .atoi_loop_end:
        mov         eax, ecx
        pop         ebx
    ret