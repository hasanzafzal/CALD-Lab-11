INCLUDE Irvine32.inc  
    .data 
    numbers DWORD 10, 15, 20, 25, 30  ; Array of integers 
    arraySize DWORD 5                 
    sum DWORD 0                       
    average DWORD 0                   
    sumMessage BYTE "Sum: ", 0 
    avgMessage BYTE "Average: ", 0 
 
    .code 
    main PROC 
    ; Initialize variables 
    mov ecx, arraySize    ; Load the array size into ECX (loop counter) 
    mov esi, OFFSET numbers ; Load the address of the array into ESI 
    mov eax, 0            ; Clear EAX (will be used to calculate sum) 
    sumLoop:              ; Calculate the sum 
    add eax, [esi]        ; Add the current array element to EAX 
    add esi, 4            ; Move to the next array element (DWORD = 4 bytes) 
    loop sumLoop          ; Decrement ECX and repeat until ECX = 0 
    ; Store the sum in the sum variable 
    mov sum, eax 
    ; Calculate the average 
    mov ebx, arraySize    ; Load the array size into EBX 
    xor edx, edx          ; Clear EDX (required for division) 
    div ebx               ; Divide EAX (sum) by EBX (array size), result in EAX 
    mov average, eax      ; Store the average 
 
    ; Print the sum 
    mov edx, OFFSET sumMessage ; Load address of sum message 
    call WriteString          ; Print the message 
    mov eax, sum              ; Load the sum value 
    call WriteDec             ; Print the sum value 
    call CrLf                 ; Move to the next line 
 
    ; Print the average 
    mov edx, OFFSET avgMessage ; Load address of average message 
    call WriteString           ; Print the message 
    mov eax, average           ; Load the average value 
    call WriteDec              ; Print the average value 
    call CrLf                  ; Move to the next line 
    call ExitProcess 
    main ENDP 
    END main