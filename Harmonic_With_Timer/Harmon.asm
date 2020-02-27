;===============================================================================
;==== CREATED BY: JUSTIN DROUIN ================================================
;====== December 19th, 2019 ====================================================
;======== FINAL ================================================================
;===============================================================================

global harmonic:

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

intro db "This machine is running an %s ", 0
confirmspeed db "Please reenter your CPU GHz speed to confirm: ", 0
pleaseplan db "Please plan for the number of terms to be included in the Harmonic sum.",10,0
begindelay db "There will be a 7 second delay before proceeding.", 10, 0

prompt1 db "Please enter the number of terms to be included in the harmonic sum: ", 0
prompt2 db "The clock is now %ld tics and the computation will begin immediately.", 10, 0
crunch db "With %ld terms the sum is %lf.",10, 0
finalsum db "Final sum is %lf", 10, 0
compcomplete db "The clock is now %ld and the computation is complete.", 10, 0
elapsedtime db "The elapsed time was %ld tics.  At %lfGHZ that is %lf seconds.", 10, 0
exitf db "This assembly program will now return the harmonic sum to the driver program.", 10, 0


formld db "%ld", 0
formlf db "%lf", 0
formlfn db "%lf",10, 0
formS db "%s", 0
formSN db "%s", 10,0


;===============================================================================
;=====  BSS SEGMENT | ARRAY ====================================================
;===============================================================================
section    .bss


;===============================================================================
;===== APP CODE BEGINS HERE ====================================================
;===============================================================================
section    .text
  harmonic:

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
;DISPLAY INTRO MESSAGE WITH CPU SPEED

      mov        rax, 0x0000000080000002
      cpuid

      push      rdx
      push      rcx
      push      rbx
      push      rax

      mov qword rax, 0                                  ;A zero in rax means printf accepts no data from xmm registers
      mov       rdi, intro
      mov       rsi, rsp
      call      printf
      pop       rax

      mov qword rax, 0                                  ;A zero in rax means printf accepts no data from xmm registers
      mov       rdi, formS
      mov       rsi, rsp
      call      printf
      pop       rbx

      mov qword rax, 0                                  ;A zero in rax means printf accepts no data from xmm registers
      mov       rdi, formS
      mov       rsi, rsp
      call      printf
      pop       rcx

      mov qword rax, 0                                  ;A zero in rax means printf accepts no data from xmm registers
      mov       rdi, formS
      mov       rsi, rsp
      call      printf
      pop       rdx

      mov       rax, 0x0000000080000003
      cpuid

      push      rdx
      push      rcx
      push      rbx
      push      rax

      mov qword rax, 0                                  ;A zero in rax means printf accepts no data from xmm registers
      mov       rdi, formS
      mov       rsi, rsp
      call      printf
      pop       rax

      mov qword rax, 0                                  ;A zero in rax means printf accepts no data from xmm registers
      mov       rdi, formS
      mov       rsi, rsp
      call      printf
      pop       rbx

      mov qword rax, 0                                  ;A zero in rax means printf accepts no data from xmm registers
      mov       rdi, formS
      mov       rsi, rsp
      call      printf
      pop       rcx

      mov qword rax, 0                                  ;A zero in rax means printf accepts no data from xmm registers
      mov       rdi, formS
      mov       rsi, rsp
      call      printf
      pop       rdx

      mov       rax, 0x0000000080000004
      cpuid

      push      rdx
      push      rcx
      push      rbx
      push      rax

      mov qword rax, 0                                  ;A zero in rax means printf accepts no data from xmm registers
      mov       rdi, formS
      mov       rsi, rsp
      call      printf
      pop       rax

      mov qword rax, 0                                  ;A zero in rax means printf accepts no data from xmm registers
      mov       rdi, formS
      mov       rsi, rsp
      call      printf
      pop       rbx

      mov qword rax, 0                                  ;A zero in rax means printf accepts no data from xmm registers
      mov       rdi, formS
      mov       rsi, rsp
      call      printf
      pop       rcx

      mov qword rax, 0                                  ;A zero in rax means printf accepts no data from xmm registers
      mov       rdi, formSN
      mov       rsi, rsp
      call      printf
      pop       rdx

;====== CONFIRM SPEED ==========================================================
;CONFIRM CPU SPEED
;prompt
      mov       rax, 0
      mov       rdi, confirmspeed
      call      printf

      push      qword 0
      push      qword 0
;get speed
      mov       rax, 1
      mov       rdi, formlf                ; "%lf"
      mov       rsi, rsp                   ;rsi points to first quadword on the stack
      mov       rdx, rsp
      add       rdx, 8                     ;rdx points to second quadword on the stack
      call      scanf
;mov into register
      movsd     xmm11, [rsp]
      pop       rax                        ;Reverse the previous "push qword -2"
      pop       rax                        ;Reverse the previous "push qword -2"

;DISPLAY FINAL TICK COUNT
      mov       rax, 0
      mov       rdi, pleaseplan
      call      printf


;====== TIME DELAY =============================================================
;PROMPT DELAY NOTICE
      mov       rax, 0
      mov       rdi, begindelay
      call      printf

;GET THE NUMBER OF TICKS FOR DELAY
      cpuid
      mov       rdx, 0
      mov       rax, 0
      rdtsc
      shl       rdx, 32
      or        rdx, rax
      mov       r12, rdx

      mov       rax, 7000000000
      cvtsi2sd  xmm12, rax
      movsd     xmm13, xmm11
      mulsd     xmm13, xmm12
      cvtsd2si  r14, xmm13

      MOV       r13, r12
      ADD       r13, r14
;7 second delay loop
loopDELAY:
      cpuid
      mov       rdx, 0
      mov       rax, 0
      rdtsc
      shl       rdx, 32
      or        rdx, rax
      mov       r12, rdx

      cmp       r12, r13
      jl       loopDELAY


;====== GET NUMBER OF TERMS ====================================================
;GET THE NUMBER OF TERMS FOR CALCULATION

      mov       rax, 0
      mov       rdi, prompt1
      call      printf

; GET INPUT
      mov       rax, 0
      push      qword 0
      push      qword 0
      mov       rdi, formld
      mov       rsi, rsp
      call      scanf
      pop       r14
      pop       rax

;====== CLOCK ==========================================================
;GET TICKS

      cpuid
      mov       rdx, 0
      mov       rax, 0
      rdtsc
      shl       rdx, 32
      or        rdx, rax
      mov       r12, rdx

;MOVE TICKS INTO REEGISTER AND DISPLAY BEGIN MESSAGE
      mov       rax, 0
      mov       rdi, prompt2
      mov       rsi, r12
      call      printf

;SET UP FOR LOOP
      mov       r15, 0  ; increment register
      mov       rax, 1
      cvtsi2sd  xmm13, rax
      cvtsi2sd  xmm14, r15
      mov       r13, 10

;REGISTER r13 IS USED FOR SEPERATING PRINT MESSAGES BASED ON HOW HIGH THE TERM
;IS SET AT. INCREMENTS BY 10, 1000, 10000, 100000, 1000000 etc etc
      cmp       r14, 1000
      jg        setr1000
      jmp       loop

setr1000:

      cmp       r14, 10000
      jg        setr10000

      mov       r13, 1000
      jmp       loop

setr10000:

      cmp       r14, 100000
      jg        setr100000

      mov       r13, 10000
      jmp       loop

setr100000:

      cmp       r14, 1000000
      jg        setr1000000

      mov       r13, 100000
      jmp       loop

setr1000000:

      cmp       r14, 10000000
      jg        setr10000000

      mov       r13, 1000000
      jmp       loop

setr10000000:

      cmp       r14, 100000000
      jg        setr100000000

      mov       r13, 10000000
      jmp       loop

setr100000000:

      cmp       r14, 1000000000
      jg        setr1000000000

      mov       r13, 100000000
      jmp       loop

setr1000000000:

      mov       r13, 1000000000
      jmp       loop

;====== HARMONIC LOOP ==========================================================

loop:
      mov       rax, 1
      inc       r15                 ; start increment
      cvtsi2sd  xmm12, r15          ; set denominator
      cvtsi2sd  xmm13, rax          ; set numerator
      divsd     xmm13, xmm12        ; 1/n
      addsd     xmm14, xmm13        ; sum

      cmp       r14, 10
      jl        printall
      jmp       modprint10

;PRINTS ALL IF TERMS IF UNDER 10
printall:
      mov       rax, 1
      mov       rdi, crunch
      mov       rsi, r15
      movsd     xmm0, xmm14
      call      printf
      jmp       finishcmp

;PRINTS ALL IN ITERATIONS OF TEN
modprint10:
cmp r14, 1000
jg modprint1000

            cmp       r15, r13
            jne       finishcmp

            mov       rax, 1
            mov       rdi, crunch
            mov       rsi, r15
            movsd     xmm0, xmm14
            call      printf
            ADD       r13, 10
            jmp       finishcmp

;PRINTS ALL IN ITERATIONS OF THOUSAND
modprint1000:
cmp r14, 10000
jg modprint10000

            cmp       r15, r13
            jne       finishcmp

            mov       rax, 1
            mov       rdi, crunch
            mov       rsi, r15
            movsd     xmm0, xmm14
            call      printf
            ADD       r13, 1000
            jmp       finishcmp

;PRINTS ALL IN ITERATIONS OF TEN THOUSAND
modprint10000:
cmp r14, 100000
jg modprint100000

            cmp       r15, r13
            jne       finishcmp

            mov       rax, 1
            mov       rdi, crunch
            mov       rsi, r15
            movsd     xmm0, xmm14
            call      printf
            ADD       r13, 10000
            jmp       finishcmp

;PRINTS ALL IN ITERATIONS OF HUNDRED THOUSAND
modprint100000:
cmp r14, 1000000
jg modprint1000000

            cmp       r15, r13
            jne       finishcmp

            mov       rax, 1
            mov       rdi, crunch
            mov       rsi, r15
            movsd     xmm0, xmm14
            call      printf
            ADD       r13, 100000
            jmp       finishcmp

;PRINTS ALL IN ITERATIONS OF MILLION
modprint1000000:
cmp r14, 10000000
jg modprint10000000

            cmp       r15, r13
            jne       finishcmp

            mov       rax, 1
            mov       rdi, crunch
            mov       rsi, r15
            movsd     xmm0, xmm14
            call      printf
            ADD       r13, 1000000
            jmp       finishcmp

;PRINTS ALL IN ITERATIONS OF TEN MILLION
modprint10000000:
cmp r14, 100000000
jg modprint100000000

            cmp       r15, r13
            jne       finishcmp

            mov       rax, 1
            mov       rdi, crunch
            mov       rsi, r15
            movsd     xmm0, xmm14
            call      printf
            ADD       r13, 10000000
            jmp       finishcmp

;PRINTS ALL IN ITERATIONS OF HUNDRED MILLION
modprint100000000:
cmp r14, 1000000000
jg modprint1000000000

            cmp       r15, r13
            jne       finishcmp

            mov       rax, 1
            mov       rdi, crunch
            mov       rsi, r15
            movsd     xmm0, xmm14
            call      printf
            ADD       r13, 100000000
            jmp       finishcmp

;PRINTS ALL IN ITERATIONS OF TRILLION
modprint1000000000:

            cmp       r15, r13
            jne       finishcmp

            mov       rax, 1
            mov       rdi, crunch
            mov       rsi, r15
            movsd     xmm0, xmm14
            call      printf
            ADD       r13, 1000000000
            jmp       finishcmp

;COMPARE FOR END OF LOOP
finishcmp:
      cmp       r15, r14
      jl        loop

;====== END OF LOOP ============================================================

;====== HARMONIC SUM ===========================================================
;DISPLAY HARMONIC SUM
      mov       rax, 1
      mov       rdi, finalsum
      movsd     xmm0, xmm14
      call      printf

;GET FINAL TICK COUNT
      mov       r15, 0
      cpuid
      mov       rdx, 0
      mov       rax, 0
      rdtsc
      shl       rdx, 32
      or        rdx, rax
      mov       r15, rdx

;DISPLAY FINAL TICK COUNT
      mov       rax, 0
      mov       rdi, compcomplete
      mov       rsi, r15
      call      printf

;CALCULATE ELAPSED SPEED FROM TICKS AND CPU SPEED
      mov       r14, 1000000000
      cvtsi2sd  xmm12, r14

      movsd     xmm15, xmm11
      mulsd     xmm15, xmm12

      sub       r15, r12
      cvtsi2sd  xmm13, r15
      divsd     xmm13, xmm15

;DISPLAY ELAPSED TIME
      mov       rax, 2
      mov       rdi, elapsedtime
      mov       rsi, r15
      movsd     xmm0, xmm11
      movsd     xmm1, xmm13
      call      printf

      movsd     xmm0, xmm14


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
