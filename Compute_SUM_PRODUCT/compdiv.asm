;===============================================================================
;===== CREATED BY: JUSTIN DROUIN ===============================================
;===== SEPTEMBER 8, 2019 =======================================================
;===============================================================================

global arithm:

extern printf
extern scanf


section   .data
; -----
;  Define constants
EXIT_SUCCESS    equ     0
SYS_exit        equ     60
; successful operation
; call code for terminate

;===============================================================================
;===== MESSAGES HERE ===========================================================
;===============================================================================

intro db "The X86 program has begun", 10, 0
prompt1 db "Please enter the first integer and press enter: ", 0
prompt2 db "Please enter the second integer and press enter:  ", 0
thankyou db "Thank you.", 10, 0
quotientm db "The quotient of %ld ", 0
dividedm db "divided by %ld ", 0
totalm db "is %ld with ", 0
remainderm db "remainder %ld.", 10, 0
posscheck db "The remainder is clearly positive.", 10, 0
negcheck db "The remainder is clearly negative.", 10, 0
remzero db "The remainder is neither positive nor negative.", 10, 0


testerm db "The quotient of %ld divided by %ld is %ld with remainder %ld.", 10, 0

zerofound db "Sorry: we do not handle zero here at Ubuntu dot com.", 10, 0

returnstatement db "The remainder will be returned to the caller program. Have a nice day.", 10, 0

newLine db 10, 0
intform db "%ld", 0

;===============================================================================
;===== Begin the application code here =========================================
;===============================================================================

section    .text
  arithm:

;====== INITIAL PUSHES =========================================================

      push rbp
      mov rbp, rsp
      push rbx
      push rcx
      push rdx
      push rdi
      push rsi
      push r8
      push r9
      push r10
      push r11
      push r12
      push r13
      push r14
      push r15
      pushf     ;push rflags
      ;do not push rax, rip, rsp

;====== INTRO MESSAGE ==========================================================

      mov rax, 0
      mov rdi, intro
      call printf

;====== REQUEST INPUT - QUOTIENT ===============================================

      mov rax, 0
      mov rdi, prompt1
      call printf

;====== GET INPUT - QUOTIENT ===================================================

      mov rax, 0
      push qword 0
      push qword 0
      mov rdi, intform
      mov rsi, rsp
      call scanf
      pop r15
      pop rax
      jmp divjump

;====== REQUEST - DIVISOR ======================================================

divjump:
      mov rax, 0
      mov rdi, prompt2
      call printf

;====== GET INPUT - DIVISOR ====================================================

      mov rax, 0
      push qword 0
      push qword 0
      mov rdi, intform
      mov rsi, rsp
      call scanf
      pop r14
      pop rax

;======= CHECK FOR 0 ============================================================
; CHECKS IF THE DIVISOR IS 0

      cmp r14, 0
      je zerotrue
      jmp divisgood

; DIVISOR IS ZERO
      zerotrue:
        mov rax, 0
        mov rdi, zerofound
        call printf
        jmp divjump

;======= THANK YOU MESSAGE =====================================================
; DIVISOR IS GOOD

divisgood:
      mov rax, 0
      mov rdi, thankyou
      call printf

;======= DIVISION ==============================================================

      mov rax, r15
      cqo
      idiv r14
      mov r13, rax
      mov r12, rdx

;======= QUOTIENT MESSAGE ======================================================

      mov rax, 0
      mov rdi, quotientm
      mov rsi, r15
      call printf

;======= DIVISOR MESSAGE =======================================================

      mov rax, 0
      mov rdi, dividedm
      mov rsi, r14
      call printf

;======= TOTAL MESSAGE =========================================================

      mov rax, 0
      mov rdi, totalm
      mov rsi, r13
      call printf

;======= REMAINDER MESSAGE =====================================================

      mov rax, 0
      mov rdi, remainderm
      mov rsi, r12
      call printf

;======= TEST SEGMENT MESSAGE LONG =============================================

mov rax, 0
;push qword[rax, 4]
mov rdi, testerm
mov rsi, r15
mov rdx, r14
mov rcx, r13
mov r8, r12
call printf
 ; limit of 6

;======= COMPARISON ============================================================
; IS THE REMAINDER = 0?

      cmp r12, 0
      je remainderZero
      jmp remainderNotZero

; PRINT NEITHER POSITIVE NOR NEGATIVE AND JUMP TO RETURN STATEMENT

      remainderZero:
        mov rax, 0
        mov rdi, remzero
        call printf
        jmp rtnstate

; IF NOT ZERO COMPARE IF IT IS LESS THAN ZERO AND JUMP APPROPRIATELY

      remainderNotZero:
        cmp r12, 0
        jl istrue
        jmp isfalse

; IF TRUE, PRINT NEGATIVE STATEMENT AND JUMP TO RTNSTATE

      istrue:
        mov rax, 0
        mov rdi, negcheck
        call printf
        jmp rtnstate

; IF FALSE, PRINT POSITIVE STATEMENT AND JUMP TO RTNSTATE

      isfalse:
        mov rax, 0
        mov rdi, posscheck
        call printf
        jmp rtnstate

;======= RETURN STATEMENT ======================================================

rtnstate:
      mov rax, 0
      mov rdi, returnstatement
      mov rsi, 0
      call printf
      mov rax, r12

;====== FINAL POPS =============================================================

      popf
      pop r15
      pop r14
      pop r13
      pop r12
      pop r11
      pop r10
      pop r9
      pop r8
      pop rsi
      pop rdi
      pop rdx
      pop rcx
      pop rbx
      pop rbp

        ret

;===============================================================================
;====== RETURNS THE REMAINDER ==================================================
;===============================================================================
