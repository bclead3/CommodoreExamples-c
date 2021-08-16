# CommodoreExamples-c

# The Commodore Programmer’s Challenge
## Steve Chen

### 50 Challenging Problems to Test Your Programming Skills - with Solutions in BASIC, Pascal, and C

## Excercise 1 -  Triple Remainders

Write a program to find the smallest positive integer n which corresponds to the following conditions:

N / 3 = integer x and remainder 2
N / 5 = integer y and remainder 3
N / 7 = integer z and remainder 4

Input: none
Test Data: none
Output: The smallest positive integer for this exercise. Since it is less than 32767, you may use a two-byte integer for this output answer. The output format will be:  The Number is XXX.

Limitations: 
Time…………..20 minutes
Variables……. 6 variables
Program Length 640 Characters  or 6 Commodore Blocks

(Answer from book)
```
#include "stdio.h"

int main()
{
  int i;

  i=1;
  while (i<=32767)
  {
    if (i%3==2 && i%5==3 && i%7==4)
    { printf("\nThe Number is %5d\n",i) ; break; }
    i=i+1;
  }

  getchar();
  return 0;
}
```

### Godbolt Compiler Explorer with x86-64 ics 2021.1.2
```
main:                                   # 
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     dword ptr [rbp - 4], 0
        mov     dword ptr [rbp - 8], 1
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
        cmp     dword ptr [rbp - 8], 32767
        jg      .LBB0_7
        mov     eax, dword ptr [rbp - 8]
        cdq
        mov     ecx, 3
        idiv    ecx
        cmp     edx, 2
        jne     .LBB0_6
        mov     eax, dword ptr [rbp - 8]
        cdq
        mov     ecx, 5
        idiv    ecx
        cmp     edx, 3
        jne     .LBB0_6
        mov     eax, dword ptr [rbp - 8]
        cdq
        mov     ecx, 7
        idiv    ecx
        cmp     edx, 4
        jne     .LBB0_6
        mov     esi, dword ptr [rbp - 8]
        movabs  rdi, offset .L.str
        mov     al, 0
        call    printf
        jmp     .LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_1 Depth=1
        mov     eax, dword ptr [rbp - 8]
        add     eax, 1
        mov     dword ptr [rbp - 8], eax
        jmp     .LBB0_1
.LBB0_7:
        call    getchar
        xor     ecx, ecx
        mov     dword ptr [rbp - 12], eax       # 4-byte Spill
        mov     eax, ecx
        add     rsp, 16
        pop     rbp
        ret
.L.str:
        .asciz  "\nThe Number is %5d\n"
```

### To compile the source on a Mac
`gcc -o Example1 Example_1.c`

### run the file
`./Example1`

### The initial output looks like
```
The Number is    53
```

### With changes in the code that look like:
```
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
```

### now the output at the end looks like

```
...
The 304 Target Number is 31868

The 305 Target Number is 31973

The 306 Target Number is 32078

The 307 Target Number is 32183

The 308 Target Number is 32288

The 309 Target Number is 32393

The 310 Target Number is 32498

The 311 Target Number is 32603

The 312 Target Number is 32708
The number of hits below 32767 is   312
```

### And the Godbolt Compiler Explorer (httpd://godbolt.org)
```
main:                                   # 
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     dword ptr [rbp - 4], 0
        mov     dword ptr [rbp - 12], 1
        mov     dword ptr [rbp - 8], 1
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
        cmp     dword ptr [rbp - 8], 32767
        jg      .LBB0_7
        mov     eax, dword ptr [rbp - 8]
        cdq
        mov     ecx, 3
        idiv    ecx
        cmp     edx, 2
        jne     .LBB0_6
        mov     eax, dword ptr [rbp - 8]
        cdq
        mov     ecx, 5
        idiv    ecx
        cmp     edx, 3
        jne     .LBB0_6
        mov     eax, dword ptr [rbp - 8]
        cdq
        mov     ecx, 7
        idiv    ecx
        cmp     edx, 4
        jne     .LBB0_6
        mov     esi, dword ptr [rbp - 12]
        mov     edx, dword ptr [rbp - 8]
        movabs  rdi, offset .L.str
        mov     al, 0
        call    printf
        mov     ecx, dword ptr [rbp - 12]
        add     ecx, 1
        mov     dword ptr [rbp - 12], ecx
.LBB0_6:                                #   in Loop: Header=BB0_1 Depth=1
        mov     eax, dword ptr [rbp - 8]
        add     eax, 1
        mov     dword ptr [rbp - 8], eax
        jmp     .LBB0_1
.LBB0_7:
        mov     eax, dword ptr [rbp - 12]
        sub     eax, 1
        movabs  rdi, offset .L.str.1
        mov     esi, eax
        mov     al, 0
        call    printf
        mov     dword ptr [rbp - 16], eax       # 4-byte Spill
        call    getchar
        xor     ecx, ecx
        mov     dword ptr [rbp - 20], eax       # 4-byte Spill
        mov     eax, ecx
        add     rsp, 32
        pop     rbp
        ret
.L.str:
        .asciz  "\nThe %3d Target Number is %5d\n"

.L.str.1:
        .asciz  "The number of hits below 32767 is %5d\n"
```