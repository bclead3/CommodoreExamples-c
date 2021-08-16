UPPER_RANGE = 32767

def main():
    k = 0
    for i in range(1, UPPER_RANGE):
        if (i%3 == 2 and i%5==3 and i%7==4):
            k+=1
            print("the "+str(k)+" number is "+str(i))

    print("There were "+str(k)+" target values")

main()