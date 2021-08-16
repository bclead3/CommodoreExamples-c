#!/usr/local/bin/python3

UPPER_RANGE = 32767

def main():
    for i in range(1, UPPER_RANGE):
        if (i%3 == 2 and i%5==3 and i%7==4):
            print("the number is "+str(i))
            # break

main()