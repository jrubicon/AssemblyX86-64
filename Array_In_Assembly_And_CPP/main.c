//Author: Justin Drouin
//Assignment 4
//Date: October 1st, 2019
//Program name: Assignment 4

#include <stdio.h>
#include "fill1.cpp"


extern long cntrl();

int main(){

  printf("This program was written by Justin Drouin\n");
  printf("The program is multilingual and written in assembly programming.”\n");
  //call assembly control file
  printf("Here we received the number in hex: %lx\n", cntrl()); //display sum in hex
  printf("Have a very nice day and come back soon.\n" );
  return 0;
}
