.model small
.stack
.data
x dw 1234
.code
start:
    mov ax,@data
    mov ds,ax
    mov bx,10
    mov ax,x
    mov cx,4
a1: xor dx,dx
    div bx
    add dl,'0'
    push ax
    mov ah,2
    int 21h
    pop ax
    loop a1
    mov ah,0
    int 16h    
    mov ah,4Ch
    int 21h
end start