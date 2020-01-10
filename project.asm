; Restaurant Billing System

; Restaurant Billing system is a program that allows people to choose 
; from a list of menu items until they
; have everything they've wanted to order and then calculate the total
; bill when they are finished selecting from a list.

; Include Irvine32.inc
Include proc.asm

ExitProcess proto,dwExitCode:dword



.code
main proc

;SaveBill by File Handling




;============================================================;
    call Crlf
    call Crlf
    mov edx,OFFSET string
    call WriteString
     L1:                         
       mov edx,OFFSET string1
       call WriteString
       call Crlf
       mov edx,OFFSET spaces
       call WriteString
       call Readint
       call Crlf
       call Checkerror    ; check whether user enter the number in given range

       cmp eax,1      ; comparison b/w what user enter with each item of list
       je L2
       cmp eax,2
       je L3
       cmp eax,3
       je L4
       cmp eax,4
       je L5
       cmp eax,5
       je L6
       cmp eax,6
       je L8
       jmp last

     L2: call Chicken       ; calling procedures depends on what user enters
         jmp L7
     L3: call Chinese
     	 jmp L7     
     L4: call FastFood
         jmp L7
     L5: call Drinks
         jmp L7
     L6: call Dessert
         jmp L7
     L8: call NaanRoti
     L7: mov edx,OFFSET string2
         call WriteString
         mov edx,OFFSET spaces
         call WriteString
         call Readint
         call Checkerror1
         cmp eax,1           ; if user want to continue then jump to L1
         je L1
     last:                    
         call Crlf
         call Crlf
         mov edx,OFFSET billing
         call WriteString
         mov eax,bill        
         call Writeint       ; prints the bill
         call Crlf           ; next line
         call Crlf
         call WaitMsg    
    invoke ExitProcess,0

main endp
end main