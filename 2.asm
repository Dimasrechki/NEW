.model small
.stack
.data
.code
start:
    mov ax,@data
    mov ds,ax
    mov cx,255
a1: mov bx,255
	sub bx,cx
	mov dx,bx
	mov ah,2
	int 21h
	mov dl,'-'
	int 21h
	push cx
	call print
	pop cx
    loop a1
	mov dl,255
	mov ah,2
	int 21h
	mov dl,'-'
	int 21h
	mov bx,255
	call print
    mov ah,0
    int 16h  
    mov ah,4Ch
    int 21h
	
print proc
	mov ax,bx
	xor cx,cx
	mov bx,10
cicl1:
	xor dx,dx
	div bx
	push dx
	inc cx
	test ax,ax
	jnz cicl1
	mov ah,2
cicl2:
	pop dx
	add dl,'0'
	int 21h
	loop cicl2
	mov dl,' '
	int 21h
	ret
	end proc
	
end start