#!/usr/bin/env python
##EXIT ON EVENT python
import numpy as np
empty = np.array([[1,2,3,4,5,6,7],[100,200,300,400,500,600,700]])
full = np.array([[1,2,3,4,5,6,7],[80,70,350,460,580,700,830]])
empty=np.transpose(empty)
full=np.transpose(full)
c=full
c[:,1]-=empty[:,1]

## c [position, current]
## c[:,0] ==position
## c[:,1] ==current
Max=max(c[:,1])
Min=min(c[:,1])
rng=Max-Min
print rng
print c
print "Threshold= " + str(rng*0.2)
print "Shape = " + str(c.shape)
print c[5,:]
for index, item in enumerate(c):
	#print item[1]
	print "shape: " + str(item.shape)
	if item[1] > 0.2*rng:
		print item[0]
		first_closure=item[0]
		break


print "this is the first closure: " + str(first_closure)
