org     100h

section .text
        MOV word CX, 10d; 10 datos
        MOV word BX, arreglo
        SUB word BX, 1b
        CALL iterar
        INT  20h

iterar: 
        MOV byte [0200h], Cl
        SUB byte [0200h], 1b
        ADD BX, 1
        MOV AL, [BX]
        AND  byte [bx], 1b        
        JZ par
        JNZ impar
        JMP bucle

bucle:
        LOOP iterar
        RET

par:        
        MOV [300h + DI], AL
        INC DI
        JMP bucle
        
impar:
        MOV [320h + SI], AL
        INC SI
        JMP bucle

section .data
arreglo DB 1d, 2d, 3d, 4d, 5d, 6d, 7d, 8d, 9d, 10d