#!/usr/bin/env python
import itertools
import random

uid="15\t"
q0="9000\t"
x= ['C1','C2','C3','C4','C5']

A=random.shuffle(x)
print(x)
B=random.shuffle(x)
print(x)
C=random.shuffle(x)
print(x)

dir="/home/francesco/ros_ws_handshake/ctrl/"
name="log_experiments.txt"
file = open ( dir + name, 'a' )
file.write(uid+q0)
for i in range(1,4,1):	
	random.shuffle(x)
	file.write(str(x))   
file.write("\n")
file.close()
