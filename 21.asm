.model small
.stack 100h
.data
msg1 db 13,10,'Vvedite $'
msg2 db 13,10,'Result $'
buf db 20,21 dup('$')
.code
main:
    mov ax,@data
    mov ds,ax
    mov ah,9h
    lea dx,msg1
    int 21h
    lea dx,buf
    mov ah,0Ah
    int 21h
           
    xor cx,cx
    mov cl,buf[1]
    xor si,si
    xor di,di
    mov si,2 
    
    dec cx
    cycle1:
    mov di,si
    inc di
    mov al,buf[si]  
    mov bl,cl 
     cycle2:
        cmp al,buf[di]
        jl met
        mov dl,al
        mov al,buf[di]
        mov buf[di],dl
        mov buf[si],al        
        met:
            inc di
        loop cycle2 
    mm:
    mov cl,bl
    inc si
    loop cycle1  
    
    mov ah,9h
    lea dx,msg2
    int 21h
    lea dx,buf[2]
    int 21h
    
    mov ah,4ch
    int 21h
end main