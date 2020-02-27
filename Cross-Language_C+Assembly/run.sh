#!/bin/bash

#Author: Justin Drouin
#Midterm
#Date: October 24th, 2019
#Program name: Midterm - Largest Number

rm *.o
rm *.out

echo "Compile the C file main.c"
gcc -c -m64 -std=c11 main.c -o main.o

echo "Assemble the X86 file manage.asm"
nasm -f elf64 manage.asm -o manage.o

echo "Compile the C file getdata.c"
gcc -c -m64 -std=c11 getdata.c -o getdata.o

echo "Compile the C file showarray.c"
gcc -c -m64 -std=c11 showarray.c -o showarray.o

echo "Assemble the x86 file maximum.asm"
nasm -f elf64 maximum.asm -o maximum.o

echo "Linking the 'O' files main.o, manage.o, getdata.o, showarray.o, maximum.o"
g++ -m64 -fno-pie -no-pie -o midtermcomp.out main.o manage.o getdata.o showarray.o maximum.o

echo "Run the assembly Midterm - Largest Number Program."
./midtermcomp.out

echo "This Bash script file will now terminate. Take care!"
