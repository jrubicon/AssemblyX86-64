
#include <stdio.h>

//display array contents
long displayarray(long myarray[], long maximum){

  printf("You Entered: ");
    for(int i = 0; i < maximum; i++){
        printf("%ld ", myarray[i]);
    }

  printf("\n");
return 0;
}
