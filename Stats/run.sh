#!/bin/bash

#Author: Justin Drouin
#Assignment 3
#Date: September 17th, 2019
#Program name: Assignment 3

rm *.o
rm *.out

echo "Assemble the X86 file stats.asm"
nasm -f elf64 stats.asm -o stats.o

echo "Compile the C++ file statnumbers.c"
g++ -c -m64 -Wall -std=c++14 statnumbers.cpp -o statnumbers.o -fno-pie -no-pie

echo "Link the 'O' files arithmetic2.o and compdiv.o"
g++ -m64 -fno-pie -no-pie -o assemblycomp.out statnumbers.o stats.o

echo "Run the assembly Statistical Numbers program."
./assemblycomp.out

echo "This Bash script file will now terminate."
