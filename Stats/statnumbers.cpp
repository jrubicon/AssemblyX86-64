//Author: Justin Drouin
//Assignment 3
//Date: September 17th, 2019
//Program name: Assignment 3
#include <iostream>
#include <stdio.h>

extern "C" int arithm();

int main(){
  int result;
  printf("Welcome to Statistical Numbers\n");
  printf("Bought to you by Justin Drouin\n");
  result = arithm();
  printf("This is the C++ program responding. Here we received the number %d. Have a nice day.\n", result);
  printf("The C++ program will not return a zero to the operating system.\n" );
  return 1;
}
