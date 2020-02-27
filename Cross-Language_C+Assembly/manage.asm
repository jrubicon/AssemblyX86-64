;===============================================================================
;==== CREATED BY: JUSTIN DROUIN ================================================
;====== October 24th, 2019 =====================================================
;======== MIDTERM ==============================================================
;===============================================================================

global man:

extern fillarray
extern showarray
extern maxx

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

intro db "Welcome to 240 by Justin Drouin.", 10, 0
received db "The largest number in the array is at position: %d", 10, 0

;===============================================================================
;=====  BSS SEGMENT | ARRAY ====================================================
;===============================================================================
section    .bss

  array resq 20 ;array size 10

;===============================================================================
;===== APP CODE BEGINS HERE ====================================================
;===============================================================================
section    .text
  man:

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

;====== FILL ARRAY =============================================================
;pass array to fillarray to fill size 20
      mov rdi, array
      mov rsi, 20
      call fillarray

      mov r15, rax

;====== DISPLAY ARRAY ==========================================================
;pass array to fillarray to fill size 20

      mov rdi, array
      mov rsi, r15
      call showarray

;====== FIND MAXIMUM NUMBER IN ARRAY ===========================================
;pass array to maxx to find maximum number and return position/
      mov rdi, array
      mov rsi, r15
      call maxx

      ;maximum number position/index
      mov r14, rax

      ;display maximum number/index
      mov   rax, 0
      mov   rdi, received
      mov   rsi, r14
      call  printf

      ;move largest number at index into rax for return
      mov rax, [array + r14 * 8]

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
