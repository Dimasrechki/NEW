.model tiny
.stack
.data
	a dw 5 
	b dw 3 
	result dw ?
.code
mulproc proc near
	push bp
	mov bp, sp
	
	mov ax, [bp+4]
	mov dx, [bp+8]
	mov bx, [bp+12]
	mul dx
	
	mov [bx], ax
	
	mov sp, bp
	pop bp
	
	ret
mulproc endp

start:
	mov ax, @data
	mov ds, ax
	
	push offset result
	push dword ptr[a]
	push dword ptr[b]

	call mulproc

	mov ax, [result]

	aam 
	add ax, 3030h 
	mov dl, ah 
	mov dh, al 
	mov ah, 2 
	int 21h 
	mov dl, dh 
	int 21h
	
	mov ah, 4ch
	int 21h
end start