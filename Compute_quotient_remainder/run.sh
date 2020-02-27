#!/bin/bash

#Author: Justin Drouin
#Assignment 2
#Date: September 8th, 2019
#Program name: Assignment 2

rm *.o
rm *.out

echo "Assemble the X86 file compdiv.asm"
nasm -f elf64 compdiv.asm -o compdiv.o

echo "Compile the C file arithmetic2.c"
gcc -c -m64 -std=c11 arithmetic2.c -o arithmetic2.o

echo "Link the 'O' files arithmetic2.o and compdiv.o"
g++ -m64 -fno-pie -no-pie -o assemblycomp.out arithmetic2.o compdiv.o

echo "Run the assembly computation program."
./assemblycomp.out

echo "This Bash script file will now terminate."
