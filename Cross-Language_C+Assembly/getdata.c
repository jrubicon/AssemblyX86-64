//Justin Drouin
//october 24th, 2019
//Midterm

#include <stdio.h>
#include <stdlib.h>

//fill up array passed from control and keep a counter for tracking and return
long fillarray(long myarray[], long maximum){

  int i = 0;

//if user inputs enter and then cntrl+D - while loop breaks; reads as EOF
  printf("Please enter some integers (Max %ld numbers). PRESS 'Enter' THEN 'Ctrl+D' WHEN FINISHED: \n", maximum);
    while(scanf ("%ld", &myarray[i]) != EOF && i < maximum){
       ++i;
       //clear buffer
       fflush(stdin);
    }

return i;
}
