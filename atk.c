#include <stdio.h>

int main () {
  int a[] = {1,2,3,4,5,6,7,8,9};
  int i, j, sum;

  for(i = 0; i  < 512; ++i) {
    sum = 0;
    for(j = 0; j < 9; ++j) {
      if(i >> j & 0x01) {
        printf("+ %d" , a[j]);
        sum  += a[j];
      }
    }
    printf("= %d\n" , sum);
  }
  return 0;
}
