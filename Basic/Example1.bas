# BASIC Example:

100 intVal = 1
200 IF intVal-INT(1/3) * 3 <> 2 GOTO 300
210 IF intVal-INT(1/5) * 5 <> 3 GOTO 300
220 IF intVal-INT(1/7) * 7 <> 4 GOTO 300
230 PRINT "THE NUMBER IS "; intVal
240 GOTO 400
300 intVal= intVal + 1
310 GOTO 200
400 END

# NUMBER OF VARIABLES: 1

# LENGTH OF PROGRAM : 1