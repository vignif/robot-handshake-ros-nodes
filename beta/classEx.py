#!/usr/bin/env python
import sys

class Chaos:
    def __init__(self):
        self.list_value = []
        self.value = "default"
    
    def set_value(self, word):
        self.list_value.append(word)
        self.value = word 

    def show(self, num):
        print("==>" + str(num) + "<==")
        print("value : " + self.value)
        for st in self.list_value:
            sys.stdout.write(st)
        print("\n=====\n")



a = Chaos()
print "show 0"
a.show(0)
a.set_value("A, ")

a.set_value("A1, ")

a.set_value("A2, ")

print "show 1"
a.show(1)


