;===============================================================================
;==== CREATED BY: JUSTIN DROUIN ================================================
;====== October 1st, 2019 ======================================================
;======== Assignment 4 =========================================================
;===============================================================================

global cntrl:

extern fillarray
extern summod
extern displayarray

extern printf
extern getchar
extern clearerr
extern stdin

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

intro db "Here we are doing some stuff with numbers.", 10, 0
prompt1 db "Are you ready? Press 'c' to continue or 'x' to exit.",10, 0
prompt2 db "Are these numbers correct (y or n)? ", 0
prompt3 db "The sum of these number in base10 is: %d", 10, 0

;===============================================================================
;=====  BSS SEGMENT | ARRAY ====================================================
;===============================================================================
section    .bss

  integers resq 10 ;array size 10

;===============================================================================
;===== APP CODE BEGINS HERE ====================================================
;===============================================================================
section    .text
  cntrl:

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
;Display intro message

      mov   rax, 0
      mov   rdi, intro
      call  printf

;====== REQUEST INPUT  =========================================================
;Display initial prompt if user is ready, 'c' to continue 'x' or anything to exit

      mov   rax, 0
      mov   rdi, prompt1
      call  printf

;get c or x char
      mov   rax, 0
      call  getchar

      ;If char entered is c, continue; else jump to exit

      cmp   rax, 99
      jne    exit

loop_start:
;===== LOOP ====================================================================

mov rax,0
mov rdi,[stdin]
call clearerr

      ;pass array to fillarray to fill size 10
      mov rdi, integers
      mov rsi, 10
      call fillarray

      mov r14, rax

      ;pass array to displayarray to display
      ;pass counter from fill to save on iterations
      mov rdi, integers
      mov rsi, r14
      call displayarray

      ;prompt if array sequence is correct
      mov   rax, 0
      mov   rdi, prompt2
      call  printf

      ;get char (y or n)
      mov   rax, 0
      call  getchar

;===== COMPARE CHAR ============================================================
    ;If char entered is y continue to sum module; else loop for re-entry

      cmp   rax, 121
      je    dosum
      jmp   loop_start

;===== END LOOP ================================================================

  dosum:

  mov rax,0
  mov rdi,[stdin]
  call clearerr

;===== RETURN SUM ==============================================================
;pass array and counter to sum module

      mov rdi, integers
      mov rsi, r14
      call summod


;===== DISPLAY SUM BASE 10 =====================================================
;display in base 10

      mov r15, rax
      mov rdi, prompt3
      mov rsi, r15
      call printf

mov rax, r15
;returns remainder from sum.asm
  exit:

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
