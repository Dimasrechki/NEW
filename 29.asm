.386 
.model flat
includelib import32.lib

    extrn ExitProcess:PROC 
    extrn MessageBoxA:PROC 
 
.data 
 
    Text db "First ASSEMBLER program",0h 
    Caption db 'Hello, World!!!!',0h
 
.code 
 
    start: 
        push 14h ;nabor knopok
        push offset Caption ;zagolovok okna
        push offset Text ;Text v okne
        push 0h ;Vladelets okna
        call MessageBoxA 
        
        push 0h 
        call ExitProcess 
    end start