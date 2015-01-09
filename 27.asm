.model tiny
.stack 
.code
sumproc proc near
	push bp
	mov bp, sp
	
	mov ax, [bp+4]
	mov dx, [bp+6]
	add ax, dx
	
	mov sp, bp
	pop bp
	
	ret
sumproc endp

start:
	push 5
	push 3
	
	call sumproc

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