; Jonathan Rodriguez
; Lab FizzBuzzGame
; 4/11/23

include Irvine32.inc

.data
Introduction BYTE "Enter the range you want me to count using the Fizz Game rules.",0
prompt1 BYTE "What number should I start at: ",0
prompt2 BYTE "What number do I stop at: ",0
i word ?
Fizz BYTE "Fizz",0
Buzz BYTE "Buzz",0
FizzBuzz BYTE "FizzBuzz",0
max word ?

.code
main proc
    ; Introducing the game
    mov edx, OFFSET Introduction
    call WriteString
    call Crlf
    
    ; Getting the range from the user
    mov edx, OFFSET prompt1
    call WriteString
    call ReadInt
    mov i, ax
    mov edx, OFFSET prompt2
    call WriteString
    call ReadInt
    mov max, ax
    mov cx, i
    mov eax, 0
    
L1: ; Main loop
    mov ax, cx ; Divisible by 15?
    mov bl, 15
    div bl
    cmp ah, 0
    je Fifteen
    
    mov ax, cx ; Divisible by 5?
    mov bl, 5
    div bl
    cmp ah, 0
    je Fifth
    
    mov ax, cx ; Divisible by 3?
    mov bl, 3
    div bl
    cmp ah, 0
    je Third
    
    mov ax, cx ; Divisible by none
    call WriteDec
    call Crlf
    cmp max, cx
    je over
    inc cx
    jne L1
    
Third: ; Printing out Fizz
    mov edx, OFFSET Fizz
    call WriteString ; Print
    call Crlf
    cmp max, cx ; Check if it's last
    je over ; Out of loop if it is
    inc cx ; Increment counter
    jmp L1 ; Go back to loop
    
Fifth: ; Printing out Buzz
    mov edx, OFFSET Buzz
    call WriteString ; Print
    call Crlf
    cmp max, cx ; Check if it's last
    je over ; Out of loop if it is
    inc cx ; Increment counter
    jmp L1 ; Go back to loop
    
Fifteen: ; Printing out FizzBuzz
    mov edx, OFFSET FizzBuzz
    call WriteString ; Print
    call Crlf
    cmp max, cx ; Check if it's last
    je over ; Out of loop if it is
    inc cx ; Increment counter
    jmp L1 ; Go back to loop
    
over:
    invoke ExitProcess, 0
    
main endp
end main
