;===============================================================================
;==== CREATED BY: JUSTIN DROUIN ================================================
;====== October 24th, 2019 =====================================================
;======== MIDTERM ==============================================================
;===============================================================================

global maxx:

extern printf

section   .data
; -----
;  Define constants
EXIT_SUCCESS    equ     0
SYS_exit        equ     60
; successful operation
; call code for terminate


;===============================================================================
;===== APP CODE BEGINS HERE ====================================================
;===============================================================================
section    .text
  maxx:
;====== MOVE ARRAY AND SIZE INTO REGISTERS =====================================
mov r12 , rdi ; array
mov r13, rsi  ; size

;====== START A COUNTER, CURR POS, LARGEST NUM REGISTER ========================
mov r11, 0 ; current largest position
mov r14, 0 ; current largest number
mov r15, 0 ; counter

;===== LOOP ====================================================================

 looprun:
 ;if r14 is < array[r15]
  cmp r14, [r12 + r15 * 8]
    jl newlarge
    jmp continue

      newlarge:
        ;THEN set r11 to current counter pos AND set current number to r14
        mov r11, r15
        mov r14, [r12 + r15 * 8]

  continue:
    ;increment and continue running loop untill r15 is greater than r13
     inc r15
     cmp r15, r13
    jl looprun

  mov rax, r11
  ;returns position

    ret
;===============================================================================
;====== RETURNS THE SUM ========================================================
;===============================================================================
