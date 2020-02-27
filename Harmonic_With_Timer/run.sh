#/bin/bash

#Author: Justin Drouin
#FINAL
#Date: December 19th, 2019
#Program name: Harmonic Sum Plus Time Delay

rm *.o
rm *.out

echo "Assemble the X86 file Harmon.asm"
nasm -f elf64 Harmon.asm -o Harmon.o

echo "Compile the C++ file main.cpp"
#gcc -c -m64 -std=c11 main.cpp -o main.o
g++ -c -m64 -Wall -std=c++14 main.cpp -o main.o -fno-pie -no-pie

echo "Link the 'O' files main.o and Harmon.o"
g++ -m64 -fno-pie -no-pie -o HSAssembly.out main.o Harmon.o

echo "Running..."
./HSAssembly.out

echo "This Bash script file will now terminate. Have a good break, I really enjoyed this class! Bye."
