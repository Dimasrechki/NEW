.model	small
.stack
.data
new	db	13,10,'Novaya stroka: $'
req1	db	'Vvedite 1 stroku: $',13,10
req2	db	13,10,'Vvedite 2 stroku: $',13,10
buf1	db	5,5 dup(0)
buf2	db	5,5 dup(0)
new_str	db	14 dup(0)
len	db	14
.code
assume	ds:@data,es:@data
start:
	mov	ax,@data
	mov	ds,ax 
	mov	es,ax
	mov	ah,9
	lea	dx,req1
	int	21h
	mov 	ah,0ah
	lea	dx,buf1-1
	int	21h
	mov	cl,buf1
	mov	bl,cl
	mov	ah,9
	lea	dx,req2
	int	21h
	mov 	ah,0ah
	lea	dx,buf2-1
	int	21h
	mov	cl,buf2
	mov	bh,cl
	cld
	lea	si,buf1+1
	lea	di,new_str
	mov	cl,bl
rep	movs	new_str,buf1
	mov	cl,bh
	lea	si,buf2+1
rep	movs	new_str,buf2
	mov	ah,9
	lea	dx,new
	int	21h
	mov	cl,len
	lea	si,new_str
m1:
	lods	new_str
	mov	ah,2
	mov	dl,al
	int	21h
	loop	m1
	mov	ah,0
	int	16h
	mov	ax,4ch
	int	21h
end start
