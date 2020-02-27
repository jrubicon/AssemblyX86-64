//Justin Drouin
//october 24th, 2019
//Midterm

#include <stdio.h>

extern long man();

int main(){

  printf("Main is executing the manage assembly file.\n");
  //call assembly manage file
  printf("Main received this number: %ld\n", man()); //display sum in hex
  printf("Have a very nice day!\n" );
  return 0;
}
