#/bin/bash

#Author: Justin Drouin
#Assignment 1
#Date: September 3rd, 2019
#Program name: Computation Assembky

rm *.o
rm *.out

echo "Assemble the X86 file computation.asm"
nasm -f elf64 compadd.asm -o compadd.o

echo "Compile the C++ file arithmetic.cpp"
g++ -c -m64 -std=c++14 arithmetic.cpp -o arithmetic.o

echo "Link the 'O' files arithmetic.o and computation.o"
g++ -m64 -fno-pie -no-pie -o assemblycomp.out arithmetic.o compadd.o

echo "Run the assembly computation program."
./assemblycomp.out

echo "This Bash script file will now terminate.  Bye."
