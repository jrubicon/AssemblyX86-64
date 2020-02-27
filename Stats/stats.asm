;===============================================================================
;==== CREATED BY: JUSTIN DROUIN ================================================
;====== SEPTEMBER 17, 2019 =====================================================
;======== Assignment 3 =========================================================
;===============================================================================

global arithm:

extern printf
extern scanf
extern getchar
extern stdin
extern clearerr

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

intro db "We will compute the mean for you using only integers.", 10, 0

;repeated responses
prompt1 db "Enter a sequence of long integers separated by white space. After the last input press ENTER then CONTROL+D.",10, 0
numbercount db "The number of numbers entered was %d.", 10, 0
integermean db "The integer mean was %d.", 10, 0
prompt2 db "Do you have more sets of integers to process (y or n)? ", 0

computemess db "We will computer the mean for you using only integers.", 10, 0
thankyou db "Justin Drouin hopes you liked your means. Please come again.", 10, 0
goodbye db "This software will return the last mean to the driver program. Bye", 10, 0

newLine db 10, 0    ;new line
intform db "%ld", 0 ;Our integer format

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
;Display intro message

      mov   rax, 0
      mov   rdi, intro
      call  printf

;====== REQUEST INPUT  =========================================================
;Display initial prompt for sequence of long integers

      mov   rax, 0
      mov   rdi, prompt1
      call  printf

;===============================================================================
;===== LOOP SEGMENT ============================================================
;===============================================================================
;loop JUMP for second or more sequence of integers, if chosen
loop_back:
      mov   rax, 0
      mov   r15, 0 ;Initialize a counter to 0, used to count total # of integers
      mov   r13, 0

;initial loop jump for sequence of integers
begin_loop:
      push  qword 0
      push  qword 0
      mov   qword rax, 0
      mov   rdi, intform
      mov   rsi, rsp
      call  scanf

      cdqe  ;Sign extend the integer in eax to all of rax

      ;if ctrl+D is entered cdqe will extend -1 to rax and then compare
      ;to check if the user has finished entering their number sequence
      cmp   rax, -1
      ;if -1 in rax, jump to loop_finished
      je    loop_finished

      ;else pop our values
      pop   r14
      pop   rax

      ;add each value together in r13 every loop
      add   r13, r14
      inc   r15  ;Add 1 to the loop counter/our number counter
      jmp   begin_loop  ;jump back to receive the next number in sequence


loop_finished:
      ;finishing pops from sequence loops
      pop   rax
      pop   rax
      ;clear error
      mov rax,0
      mov rdi,[stdin]
      call clearerr
;===============================================================================
;====== END OF LOOP SEGMENT ====================================================
;===============================================================================

;===== Output the count of numbers entered from r15 ============================

      mov   rax, 0
      mov   rdi, numbercount
      mov   rsi, r15
      call  printf

;===== FIND THE INTEGER MEAN FROM SEQUENCE ENTERED =============================
;use total sum or integers entered / number of integers entered

      mov   r11, r15
      mov   rax, r13
      cqo
      idiv  r11

;===== DISPLAY INTEGER MEAN ====================================================

      mov   r15, rax
      mov   rdi, integermean
      mov   rsi, rax
      call  printf

;===== PROMPT 2 ================================================================
;Prompt if the user wishes to enter more sets of integers

      mov   rax, 0
      mov   rdi, prompt2
      call  printf

;get y or n char
      mov   rax, 0
      call  getchar

;===== COMPARE CHAR ============================================================
;If char entered is y; jump to loop_back for another loop of integers

      cmp   rax, 121
      je    loop_back

;===== THANK YOU MESSAGE =======================================================

      mov   rax, 0
      mov   rdi, thankyou
      call  printf

;===== GOODBYE MESSAGE =========================================================

      mov   rax, 0
      mov   rdi, goodbye
      call  printf

;===== MOVE INTEGER MEAN INTO RAX FOR RETURN ===================================

      mov   rax, 0
      mov   rsi, 0
      mov   rax, r15

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
