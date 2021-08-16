# Commodore Programmers Challenge 

## Example 1

### Here is the code
```
UPPER_RANGE = 32767

def main():
    for i in range(1, UPPER_RANGE):
        if (i%3 == 2 and i%5==3 and i%7==4):
            print("the number is "+str(i))

main()
```

### Here is the Godbolt Compiler Explorer output
```
  1           0 LOAD_CONST               0 (32767)
              2 STORE_NAME               0 (UPPER_RANGE)

  3           4 LOAD_CONST               1 (<code object main at 0x55dfaea5a850, file "example.py", line 3>)
              6 LOAD_CONST               2 ('main')
              8 MAKE_FUNCTION            0
             10 STORE_NAME               1 (main)
             12 LOAD_CONST               3 (None)
             14 RETURN_VALUE

Disassembly of <code object main at 0x55dfaea5a850, file "example.py", line 3>:
  4           0 LOAD_GLOBAL              0 (range)
              2 LOAD_CONST               1 (1)
              4 LOAD_GLOBAL              1 (UPPER_RANGE)
              6 CALL_FUNCTION            2
              8 GET_ITER
        >>   10 FOR_ITER                56 (to 68)
             12 STORE_FAST               0 (i)

  5          14 LOAD_FAST                0 (i)
             16 LOAD_CONST               2 (3)
             18 BINARY_MODULO
             20 LOAD_CONST               3 (2)
             22 COMPARE_OP               2 (==)
             24 POP_JUMP_IF_FALSE       10
             26 LOAD_FAST                0 (i)
             28 LOAD_CONST               4 (5)
             30 BINARY_MODULO
             32 LOAD_CONST               2 (3)
             34 COMPARE_OP               2 (==)
             36 POP_JUMP_IF_FALSE       10
             38 LOAD_FAST                0 (i)
             40 LOAD_CONST               5 (7)
             42 BINARY_MODULO
             44 LOAD_CONST               6 (4)
             46 COMPARE_OP               2 (==)
             48 POP_JUMP_IF_FALSE       10

  6          50 LOAD_GLOBAL              2 (print)
             52 LOAD_CONST               7 ('the number is ')
             54 LOAD_GLOBAL              3 (str)
             56 LOAD_FAST                0 (i)
             58 CALL_FUNCTION            1
             60 BINARY_ADD
             62 CALL_FUNCTION            1
             64 POP_TOP
             66 JUMP_ABSOLUTE           10
        >>   68 LOAD_CONST               0 (None)
             70 RETURN_VALUE
```

## Added interpretation
### Add k to keep track of the number of target hits
### The code now looks like
```
UPPER_RANGE = 32767

def main():
    k = 0
    for i in range(1, UPPER_RANGE):
        if (i%3 == 2 and i%5==3 and i%7==4):
            k+=1
            print("the "+str(k)+" number is "+str(i))

    print("There were "+str(k)+" target values")

main()
```

### The Matt Godbolt output looks like this
```
  1           0 LOAD_CONST               0 (32767)
              2 STORE_NAME               0 (UPPER_RANGE)

  3           4 LOAD_CONST               1 (<code object main at 0x55c29aef1900, file "example.py", line 3>)
              6 LOAD_CONST               2 ('main')
              8 MAKE_FUNCTION            0
             10 STORE_NAME               1 (main)
             12 LOAD_CONST               3 (None)
             14 RETURN_VALUE

Disassembly of <code object main at 0x55c29aef1900, file "example.py", line 3>:
  4           0 LOAD_CONST               1 (0)
              2 STORE_FAST               0 (k)

  5           4 LOAD_GLOBAL              0 (range)
              6 LOAD_CONST               2 (1)
              8 LOAD_GLOBAL              1 (UPPER_RANGE)
             10 CALL_FUNCTION            2
             12 GET_ITER
        >>   14 FOR_ITER                76 (to 92)
             16 STORE_FAST               1 (i)

  6          18 LOAD_FAST                1 (i)
             20 LOAD_CONST               3 (3)
             22 BINARY_MODULO
             24 LOAD_CONST               4 (2)
             26 COMPARE_OP               2 (==)
             28 POP_JUMP_IF_FALSE       14
             30 LOAD_FAST                1 (i)
             32 LOAD_CONST               5 (5)
             34 BINARY_MODULO
             36 LOAD_CONST               3 (3)
             38 COMPARE_OP               2 (==)
             40 POP_JUMP_IF_FALSE       14
             42 LOAD_FAST                1 (i)
             44 LOAD_CONST               6 (7)
             46 BINARY_MODULO
             48 LOAD_CONST               7 (4)
             50 COMPARE_OP               2 (==)
             52 POP_JUMP_IF_FALSE       14

  7          54 LOAD_FAST                0 (k)
             56 LOAD_CONST               2 (1)
             58 INPLACE_ADD
             60 STORE_FAST               0 (k)

  8          62 LOAD_GLOBAL              2 (print)
             64 LOAD_CONST               8 ('the ')
             66 LOAD_GLOBAL              3 (str)
             68 LOAD_FAST                0 (k)
             70 CALL_FUNCTION            1
             72 BINARY_ADD
             74 LOAD_CONST               9 (' number is ')
             76 BINARY_ADD
             78 LOAD_GLOBAL              3 (str)
             80 LOAD_FAST                1 (i)
             82 CALL_FUNCTION            1
             84 BINARY_ADD
             86 CALL_FUNCTION            1
             88 POP_TOP
             90 JUMP_ABSOLUTE           14

 10     >>   92 LOAD_GLOBAL              2 (print)
             94 LOAD_CONST              10 ('There were ')
             96 LOAD_GLOBAL              3 (str)
             98 LOAD_FAST                0 (k)
            100 CALL_FUNCTION            1
            102 BINARY_ADD
            104 LOAD_CONST              11 (' target values')
            106 BINARY_ADD
            108 CALL_FUNCTION            1
            110 POP_TOP
            112 LOAD_CONST               0 (None)
            114 RETURN_VALUE
```