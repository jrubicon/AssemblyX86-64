//Author: Justin Drouin
//Assignment 5
//Date: November 21st, 2019
//Program name: Assignment 5

#include <stdio.h>


extern double geo();

int main(){
  printf("Welcome to CPSC 240 brought to you by Justin Drouin”\n");
  //call assembly control file
  printf("This main program has received this number: %lf. Have a nice day.\n", geo()); //display sum in hex
  printf("Main will return 0 to the operating system.\n" );
  return 0;
}
