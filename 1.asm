.model small
.stack
.data
x dw 989
.code
start:
    mov ax,@data
    mov ds,ax
    mov bp,10
    mov bh,0
    mov ax,x
    mov cx,3
a1: mov dx,0
    div bp
    add bh,dl
    loop a1
    mov al,bh
    aam
    add ax,3030h
    mov dl,ah
    mov dh,al
    mov ah,2
    cmp dl,'0'
    jne m2
    jmp m1
m2: int 21h
m1: mov dl,dh
    int 21h 
    mov ah,0
    int 16h    
    mov ah,4Ch
    int 21h
end start