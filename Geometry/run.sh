#/bin/bash

#Author: Justin Drouin
#Assignment 5
#Date: November 21st, 2019
#Program name: GEOMETRY

rm *.o
rm *.out

echo "Assemble the X86 file geometry.asm"
nasm -f elf64 geometry.asm -o geometry.o

echo "Compile the C file main.c"
gcc -c -m64 -std=c11 main.c -o main.o

echo "Link the 'O' files main.o and geometry.o"
g++ -m64 -fno-pie -no-pie -o assembly.out main.o geometry.o

echo "Running..."
./assembly.out

echo "This Bash script file will now terminate.  Bye."
