.model small
.stack 100h
.data
    prompt1 db 'Enter first number (0-9): $'
    prompt2 db 'Enter second number (0-9): $'
    resultMsg db 'Sum is: $'
    newline db 0Dh, 0Ah, '$'  ; For newline
    sum db ?

.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Display prompt for first number
    mov ah, 9
    lea dx, prompt1
    int 21h

    ; Input first number
    mov ah, 1
    int 21h
    sub al, '0'       ; Convert ASCII to number
    mov bl, al        ; Store first number in bl

    ; Newline
    mov ah, 9
    lea dx, newline
    int 21h

    ; Display prompt for second number
    mov ah, 9
    lea dx, prompt2
    int 21h

    ; Input second number
    mov ah, 1
    int 21h
    sub al, '0'       ; Convert ASCII to number
    mov bh, al        ; Store second number in bh

    ; Newline
    mov ah, 9
    lea dx, newline
    int 21h

    ; Add the two numbers
    mov al, bl
    add al, bh
    mov sum, al

    ; Display result message
    mov ah, 9
    lea dx, resultMsg
    int 21h

    ; Convert result to ASCII and display it
    mov al, sum
    add al, '0'       ; Convert to ASCII
    mov dl, al
    mov ah, 2
    int 21h

    ; Newline
    mov ah, 9
    lea dx, newline
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp
end main
