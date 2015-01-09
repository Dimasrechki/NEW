.model small
.stack
.data
x dw 5879
y db 'None',13,10,'$'
z db '',13,10,'$'
.code
start:
    mov ax,@data
    mov ds,ax
    mov bp,10
    mov bh,0
    mov ah,01h
    int 21h
    sub al,30h
    mov bl,al
    lea dx,z
    mov ah,9
    int 21h
    mov ax,x
    mov cx,4
a1: mov dx,0
    div bp
    cmp bl,dl
    jne l1
    mov bh,cl
l1: loop a1
    cmp bh,0
    je met1
    mov dl,bh
    add dl,'0'
    mov ah,2
    int 21h
    jmp end1
met1:
    lea dx,y
    mov ah,9
    int 21h
end1:
    mov ah,0
    int 16h    
    mov ah,4Ch
    int 21h
end start
