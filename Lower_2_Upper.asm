.model small
.stack 100h
.data
 str db 'Testing Work:$' 
 a db ?
 b db ?
 c db ?
 
 .code
 
 main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,str
    int 21h
    
    mov ah,2
    mov dl,10
    int 21h 
    
    mov ah,1
    int 21h
    mov a,al
    
    sub a,32 
    
    mov ah,2
    mov dl,a
    int 21h
    
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp 
    