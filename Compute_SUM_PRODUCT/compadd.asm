; Created by Justin Drouin
; September 3, 2019

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

; ************************************************************
; messages

intro db "This program was built by Justin Drouin.", 10, 0
prompt1 db "Please input the first integer: ", 0
promptback db "You entered %ld", 10, 0
prompt2 db "Please input the second integer: ", 0
sumprompt db "The sum of these two integers is %ld", 10, 0
prodprompt db "The product of these two integers is %ld", 10, 0
returnstatement db "The integer %ld will be returned to the calling program.", 10, 0

newLine db 10, 0
intform db "%ld", 0

; ************************************************************
; code section

section    .text
  arithm:

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

; INTROMESSAGE
      mov rax, 0
      mov rdi, intro
      call printf

; REQUEST INPUT
      mov rax, 0
      mov rdi, prompt1
      call printf

; GET INPUT
      mov rax, 0
      push qword 0
      push qword 0
      mov rdi, intform
      mov rsi, rsp
      call scanf
      pop r14
      pop rax

; INPUT REPEAT
      mov rax, 0
      mov rdi, promptback
      mov rsi, r14
      call printf

; REQUEST SECOND INPUT
      mov rax, 0
      mov rdi, prompt2
      call printf

; GET INPUT 2
      mov rax, 0
      push qword 0
      push qword 0
      mov rdi, intform
      mov rsi, rsp
      call scanf
      pop r15
      pop rax

; INPUT REPEAT
      mov rax, 0
      mov rdi, promptback
      mov rsi, r15
      call printf

; SUM RESULT
      mov rax, 0
      mov r13, r14
      add r13, r15
      mov rdi, sumprompt
      mov rsi, r13
      call printf

; PRODUCT RESULT
      imul r14, r15
      mov rax, 0
      mov rdi, prodprompt
      mov rsi, r14
      call printf

; RETURN STATEMENT
      mov rax, 0
      mov rdi, returnstatement
      mov rsi, 5
      call printf
      mov rax, 5

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
