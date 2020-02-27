//Author: Justin Drouin
//Assignment 6
//Date: November 21st, 2019
//Program name: Harmonic Summation

#include <stdio.h>


extern "C" double harmonic();

int main(){
  printf("Welcome to fast number crunching by programmer Justin Drouin.”\n");
  //call assembly control file
  printf("The driver has received the number %lf. Have a nice day.\n", harmonic()); //display sum in hex
  return 0;
}
