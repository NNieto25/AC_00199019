        org     100h

        section .text

; Escribir iniciales de nombre comenzando en direccion = 200

        mov     byte [200h], "N"
        mov     byte [201h], "E"
        mov     byte [202h], "N"
        mov     byte [203h], "A"

; Mover datos de memoria a registros

; Direccionamiento directo
        mov     AX, [200h]
        
; Direccionamiento indirecto por registro
        mov     BX, 201h
        mov     CX, [BX]
        
;Direccionamiento indirecto base mas indice
        mov     SI, 1
        mov     DX, [BX+SI]

;Direccionamiento relativo por registro
        mov     DI, [BX+2h]

        int     20h
