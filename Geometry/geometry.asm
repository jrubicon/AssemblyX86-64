;===============================================================================
;==== CREATED BY: JUSTIN DROUIN ================================================
;====== NOVEMBER 21st, 2019 ======================================================
;======== Assignment 5 =========================================================
;===============================================================================

global geo:

extern printf
extern scanf
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

intro db "Welcome to Right Triangle Analyzer.", 10, 0
prompt1 db "Enter the lengths of the two legs of a right triangle separated by ws and press enter.", 10, 0
prompt2 db "The length of the sides of the triangle are %lf and %lf.", 10, 0
prompt3 db "The area of the triangle is %lf units squared", 10, 0
prompt4 db "The hypotenuse has length %lf units.", 10, 0
exitf db "This module will now return the hypotenuse to the caller.", 10, 0

form db "%lf%lf",0

;===============================================================================
;=====  BSS SEGMENT | ARRAY ====================================================
;===============================================================================
section    .bss


;===============================================================================
;===== APP CODE BEGINS HERE ====================================================
;===============================================================================
section    .text
  geo:

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
;REQUEST INPUT OF 2 NUMBERS
      mov   rax, 0
      mov   rdi, prompt1
      call  printf

;CREATE SPACE FOR 2 FLOATS AND GET
      push qword 0
      push qword 0
      mov rax, 2
      mov rdi, form     ;"%lf%lf"
      mov rsi, rsp                   ;rsi points to first quadword on the stack
      mov rdx, rsp
      add rdx, 8                     ;rdx points to second quadword on the stack
      call scanf

      movsd xmm12, [rsp]
      movsd xmm13, [rsp+8]
      pop rax                        ;Reverse the previous "push qword -2"
      pop rax                        ;Reverse the previous "push qword -1"

;====== DISPLAY INPUT  =========================================================
;DISPLAY 2 FLOAT NUMBERS
      mov rax, 2                     ;
      mov rdi, prompt2
      movsd xmm0, xmm12
      movsd xmm1, xmm13
      call printf

;====== CALCULATE AREA  ========================================================
;PRODUCT RESULT = (A*B)/2
      movsd xmm11, xmm12
      mov r14, 2
      mulsd xmm11, xmm13
      cvtsi2sd xmm10, r14
      divsd xmm11, xmm10

;DISPLAY
      mov rax, 1
      mov rdi, prompt3
      movsd xmm0, xmm11
      call printf

;====== CALCULATE HYPOTENUSE  ==================================================
;CALCUATE HYPOTENUSE a^2 + b^2 = c^2
      mulsd xmm12, xmm12
      mulsd xmm13, xmm13
      addsd xmm12, xmm13
      sqrtsd xmm12, xmm12

;DISPLAY HYPOTENUSE
      mov rax, 1
      mov rdi, prompt4
      movsd xmm0, xmm12
      call printf

;RETURN HYPOTENUSE
      mov rax, 0
      mov rdi, exitf
      movsd xmm0, xmm12
      call printf

      movsd xmm0, xmm12
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
