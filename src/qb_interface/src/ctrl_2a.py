#!/usr/bin/env python
## 03_july_18
# ctrl_2 implements the second controller for human-robot handshake
# we want to seek for a consensus behaviour from human to robot
# so the Pisa/IIT SoftHand is executing some fixed step signals
# with different amplitudes and the human in squeezing the hand
# presumibely with a coherent force


import roslib
import rospy
import std_msgs
import numpy as np
import csv
import random
from std_msgs.msg import Float32MultiArray
from qb_interface import msg 
from std_msgs.msg import Empty
from std_msgs.msg import String
import curses
from datetime import datetime
import os

##include for emergency break
import sys, termios, atexit
from select import select
import time

tstart = datetime.now()


## input char from keyboard

# save the terminal settings
fd = sys.stdin.fileno()
new_term = termios.tcgetattr(fd)
old_term = termios.tcgetattr(fd)

# new terminal setting unbuffered
new_term[3] = (new_term[3] & ~termios.ICANON & ~termios.ECHO)

# switch to normal terminal
def set_normal_term():
    termios.tcsetattr(fd, termios.TCSAFLUSH, old_term)

# switch to unbuffered terminal
def set_curses_term():
    termios.tcsetattr(fd, termios.TCSAFLUSH, new_term)

def putch(ch):
    sys.stdout.write(ch)

def getch():
    return sys.stdin.read(1)

def getche():
    ch = getch()
    putch(ch)
    return ch

def kbhit():
    dr,dw,de = select([sys.stdin], [], [], 0)
    return dr <> []

def emergency(pos):
    if getch() == 'x':
        print "EXIT"
        rospy.sleep(0.1)
        pos.publish([0])
        rospy.signal_shutdown("Emergency")
        rospy.on_shutdown(h)
        
def h():
    print "Emergency shutdown!"


def main():
    halt= False
    pub = rospy.Publisher("qb_class/hand_ref", msg.handRef, queue_size= 1000)
    rospy.init_node("steps", anonymous=True)
    rospy.set_param('/stiffness',1.0)
    #Class for managing subscription and file with relevant data
    Mg=manage_cb()
    
    # 22 different values
#     steps=range(6000,17000,250)
#     
#     #initial seed to make a pseudorandom shuffle
#     SEED = 448 
#     random.seed(SEED)
#     random.shuffle(steps)
#for one step experiment uncomment the next row
    steps=[14000, 16000]
    rate=rospy.Rate(100) #100 Hz
    index=0
    ln=len(steps)
    ln=float(ln)
    
    #threshold of trigger contact points
    threshold = 0.1
    
    # create path for saving file
    idx=0
    dir="/home/francesco/ros_ws_handshake/ctrl/2/"
    name="experiment"    
    path=dir + name
    
    # check if file exists, if it exists save a new one with an increasing number
    while os.path.exists(path + "%s.csv" % idx):
            idx += 1
            
    ## initially open the hand
    print "Start the handshake" 
    pub.publish([0])
    rate.sleep()     
    
    ## main loop
    while not rospy.is_shutdown():
        if np.sum(Mg.FSR) > threshold:
            for i in steps:
               # print "Experiment status: " + str(round(index/ln,2)*100) + "%" + "\t \t closure: " + str(i)
                print "closure: " + str(i)
                for a in range(0,300,1):
                    pub.publish([i])
                    Mg.sent_pos(i)
                    ## write a row in the file at each iteration
                    Mg.save(idx,path) 
                    rate.sleep()
                    ## if a key is hitted, check if its the safe key 'x'
                    ## send a safe position '0' and stop the experiment
                    if np.sum(Mg.FSR) < threshold:
                        print "No contact" 
                        pub.publish([0])
                        rate.sleep()
                        halt=True                      
                        break
                    if kbhit():
                        emergency(pub)
                        halt=True
                        break
                    if rospy.is_shutdown():
                        break
                if halt==True:
                    break
                if rospy.is_shutdown():
                        break
                index+=1
        else:
            ## no contact part
            pass
            
        

 
class manage_cb:
    def __init__(self):
        
        self.sub_current = rospy.Subscriber("qb_class/hand_measurement", msg.handPos , self.current_cb)
        self.sub_sensors = rospy.Subscriber("sensors_FSR", Float32MultiArray, self.sens_cb)
        self.sub_realpos = rospy.Subscriber("qb_class/hand_measurement", msg.handPos , self.realpos_cb)
        self.FSR=[0,0,0]
        self.current=0
        self.realpos=0
    
    def realpos_cb(self,handPos):
        self.realpos=handPos.closure[0]
        return self.realpos
    
    def current_cb(self,handPos):
        self.current=handPos.closure[2]
        return self.current
    
    def sens_cb(self,msg):
        self.FSR=np.array(msg.data)
        self.FSR=np.around(self.FSR, decimals=2)
        return self.FSR
    
    def sent_pos(self,pos):
        self.sentpos=pos
        return self.sentpos
    
    def save(self,i,path):
        ##File structure
        ## [FSR1, FSR2, FSR3, FSR4, current, realpos, sentpos]
                
        tosave = np.append(self.FSR, np.around(self.current , decimals=2))
        tosave = np.append(tosave, np.around(self.realpos , decimals=2))
        tosave = np.append(tosave, self.sentpos)
        
        self.path = path
        self.i=i
        
        
#         fh = open(dir + name + "%s.csv" % i, "w")
        with open(self.path + "%s.csv" % i, "a") as f:
            writer = csv.writer(f)
            writer.writerow(tosave)         
        #print tosave

 
        
if __name__=="__main__":
    try:
        atexit.register(set_normal_term)
        set_curses_term()
        main()
    except rospy.ROSInterruptException:
        pass
