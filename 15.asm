.model small
.stack
.data
	num1 db 11h
	num2 db 74h
	sum db 2 dup(0)
.code
start:	
	mov ax,@data
	mov ds,ax
	xor dx,dx
	xor ax,ax
	mov bl,10h
	mov al,num1
	adc al,num2
	daa
	div bl
	add ax,3030h
	mov dl,al
	mov dh,ah
	mov ah,2
	int 21h
	mov dl,dh
	int 21h
	mov ah,0
	int 16h
	mov ah,4Ch
	int 21h
end start