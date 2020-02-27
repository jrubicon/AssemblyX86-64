//Author: Justin Drouin
//FINAL
//Date: December 19th, 2019
//Program name: Harmonic Sum Plus Delay

#include <stdio.h>


extern "C" double harmonic();

int main(){
  printf("Welcome to fast number crunching by programmer Justin Drouin.”\n");
  //call assembly control file
  printf("The driver has received the number %lf.\n", harmonic()); //display sum in hex
  return 0;
}
