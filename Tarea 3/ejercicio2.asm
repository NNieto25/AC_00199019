org 100h

section .text
    MOV WORD AX, 1b 
    MOV CX, [factorial]
    CALL multiplicar
    MOV WORD [020Bh], AX
    int 20h

multiplicar:
    MUL CX
    LOOP multiplicar
    ret

section .data
factorial db 5d