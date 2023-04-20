%include        '../../utils/stdio64.asm'

SECTION .data
    msg         db      'Hola mundo!', 10, 0H

SECTION .text
    global      _start

_start:
    mov     rax, msg
    call    print
    ; mov     rdx, 13     ; msg.len
    ; mov     rsi, msg    ; rsi -> *msg | source index
    ; mov     rdi, 1      ; rdi -> STOUT, standar out | destiny index
    ; mov     rax, 1      ; SYS_WRITE
    ; syscall             ; syscall or int 80H
; 
    ; mov     rax, 60     ; SYS_EXIT
    ; xor     rdi, rdi    ; clear rdi
    ; syscall
    call        sys_exit