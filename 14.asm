.model small
.stack
.data
	num1 db 2,5,0
	num2 db 7
.code
start:	
	mov ax,@data
	mov ds,ax
	xor dx,dx
	mov al,num1
	aad
	div num2
	add ax,3030h
	mov dh,ah
	mov dl,al
	mov ah,2
	int 21h
	mov dl,'.'
	int 21h
	mov dl,dh
	int 21h
	mov ah,0
	int 16h
	mov ah,4Ch
	int 21h
end start