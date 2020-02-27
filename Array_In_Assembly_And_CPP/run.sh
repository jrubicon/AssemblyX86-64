#!/bin/bash

#Author: Justin Drouin
#Assignment 4
#Date: October 1st, 2019
#Program name: Assignment 4

rm *.o
rm *.out

echo "Compile the C file main.c"
gcc -c -m64 -std=c11 main.c -o main.o

echo "Assemble the X86 file array.asm"
nasm -f elf64 control.asm -o control.o

echo "Compile the C++ file fill.cpp"
g++ -c -m64 -Wall -std=c++14 fill1.cpp -o fill1.o -fno-pie -no-pie

echo "Compile the C file display.c"
gcc -c -m64 -std=c11 display.c -o display.o

echo "Assemble the X86 file sum.asm"
nasm -f elf64 sum.asm -o sum.o

echo "Link the 'O' files control.o, main.o, fill.o, and display.o"
g++ -m64 -fno-pie -no-pie -o assemblycomp.out main.o control.o fill1.o display.o sum.o

echo "Run the assembly Statistical Numbers program."
./assemblycomp.out

echo "This Bash script file will now terminate."
