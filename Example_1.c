// C Language Example:

#include <stdio.h>

int main()
{
  int i, k;

  i=k=1;

  while (i<=32767)
  {
    if (i%3==2 && i%5==3 && i%7==4) { 
      printf("\nThe %3d Target Number is %5d\n", k, i);
      k+=1;
    }
    i+=1;
  }

  printf("The number of hits below 32767 is %5d\n", k-1);
  getchar();
  return 0;
}

// NUMBER OF VARIABLES : 1
// LENGTH OF PROGRAM : 2