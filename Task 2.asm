INCLUDE Irvine32.inc

.data
    Array1 DWORD 10, 15, 20, 25, 30    ; Array1 with 5 integers
    Array2 DWORD 5 DUP(?)              ; Array2 to hold the copied values
    ArraySize DWORD 5                  ; Size of the arrays (number of elements)

.code
main:
    ; Initialize registers
    MOV ECX, 0                 ; Index counter for the loop
    LEA EBX, Array1            ; EBX points to Array1
    LEA EDI, Array2            ; EDI points to Array2

copyLoop:
    ; Check if we've reached the end of the arrays
    CMP ECX, ArraySize         ; Compare ECX with the size of the array
    JE done                    ; Jump to 'done' if the loop is complete

    ; Load the integer from Array1
    MOV EAX, [EBX + ECX*4]     ; Load value from Array1[ECX] into EAX

    ; Store the integer in Array2
    MOV [EDI + ECX*4], EAX     ; Store value from EAX into Array2[ECX]

    ; Increment counter
    INC ECX

    ; Repeat the loop
    JMP copyLoop

done:
    ; Print "Array1 Contents: "
    MOV EDX, OFFSET Array1Label
    CALL WriteString

    ; Display Array1 contents on the same line
    MOV ECX, 0                 ; Reset ECX to 0 for Array1
    LEA EBX, Array1            ; EBX points to Array1 again
    PRINT_ARRAY1:

    CMP ECX, ArraySize         ; Check if we've printed all elements
    JE doneArray1
    MOV EAX, [EBX + ECX*4]     ; Load value from Array1[ECX] into EAX
    CALL WriteDec              ; Use WriteDec to print the integer
    MOV AL, ' '                ; Store a space character in AL
    CALL WriteChar             ; Print the space character
    INC ECX
    JMP PRINT_ARRAY1

doneArray1:
    ; Print "Array2 Contents: "
    MOV EDX, OFFSET Array2Label
    CALL WriteString

    ; Display Array2 contents on the same line
    MOV ECX, 0                 ; Reset ECX to 0 for Array2
    LEA EDI, Array2            ; EDI points to Array2 again
    PRINT_ARRAY2:

    CMP ECX, ArraySize         ; Check if we've printed all elements
    JE doneArray2
    MOV EAX, [EDI + ECX*4]     ; Load value from Array2[ECX] into EAX
    CALL WriteDec              ; Use WriteDec to print the integer
    MOV AL, ' '                ; Store a space character in AL
    CALL WriteChar             ; Print the space character
    INC ECX
    JMP PRINT_ARRAY2

doneArray2:
    ; Print a newline after displaying both arrays
    CALL Crlf

    ; Exit the program
    EXIT

.data
    Array1Label BYTE "Array1 Contents: ", 0
    Array2Label BYTE "Array2 Contents: ", 0

END main