; calculadora de exponentes
%include            '../../utils/stdio32.asm'
%include            '../../utils/string.asm'

SECTION .bss
    base:   resb    10

SECTION .text
    global      _start

_start:
    pop     ecx     ; no. parameters
    cmp     ecx, 3  ; ./rpn base pow
    jne      .exit

    pop     ecx         ; pop ./exp command
    ; base
    pop     eax         ; eax = base string
    call    str_to_int
    mov     [base], eax

    ; pow
    pop     eax         ; eax = pow string
    call    str_to_int  ; eax = pow
    mov     ecx, eax    ; ecx = pow

    ; loop throug pow
    .pow_loop:
        cmp     ecx, 1
        je      .pow_end

        ; multiply
        mov     eax, ecx
        call    iPrintLn

        ; loop
        dec     ecx
        jmp     .pow_loop
    .pow_end:

    .exit:
        call        sys_exit

