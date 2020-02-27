
#include <stdio.h>
#include <stdlib.h>

//fill up array passed from control and keep a counter for tracking and return

long fillarray(long myarray[], long maximum){

  int i = 0;

//if user input enter and then cntrl+D, while loop breaks; reads as EOF
  printf("Enter up to %ld numbers seperated by spaces (PRESS 'Enter' THEN 'Ctrl+D' WHEN FINISHED): ", maximum);
    while(scanf ("%ld", &myarray[i]) != EOF && i < maximum){
       ++i;
       fflush(stdin);
    }
//clear buffer
//while ((getchar()) != '\n');
return i;
}
