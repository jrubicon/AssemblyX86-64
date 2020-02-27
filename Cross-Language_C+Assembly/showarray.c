
#include <stdio.h>

//displays array contents
long showarray(long myarray[], long maximum){

  printf("Here is your array: \n");
    for(int i = 0; i < maximum; i++){
        printf("%ld ", myarray[i]);
    }

  printf("\n");
return 0;
}
