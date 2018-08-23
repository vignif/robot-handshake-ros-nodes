#!/usr/bin/env python
## 03_july_18
import roslib
import rospy
import std_msgs
import numpy as np
import csv
import random
from std_msgs.msg import Float32MultiArray
from qb_interface import msg 
from std_msgs.msg import Float32
from std_msgs.msg import String
import curses
from datetime import datetime

##include for emergency break
import sys, termios, atexit
from select import select
import time

tstart = datetime.now()

def main():
    pub = rospy.Publisher("qb_class/hand_ref", msg.handRef, queue_size= 1000)
    rospy.init_node("steps", anonymous=True)
    rospy.set_param('/stiffness',1.0)
    #Class for managing subscription and file with relevant data
    Mg=manage_cb()
    
   
 ##for one step experiment uncomment the next row
#     steps=[9000, 9000, 15000, 15000]
    rate=rospy.Rate(10) #100 Hz
    
    print "Start saving CalibrationFile"
    
    for a in range(0,1200,1):
        Mg.show()
        ## write a row in the file at each iteration
        Mg.save() 
        rate.sleep()
                
            
  
    tend = datetime.now()
    print tend-tstart
    print "END"
        

 
class manage_cb:
    def __init__(self):
        self.sub_dummi = rospy.Subscriber("dummipalm", Float32, self.dummiforce_cb)
        self.sub_sensors = rospy.Subscriber("sensors_FSR", Float32MultiArray, self.sens_cb)
        self.FSR=[0,0]
        self.dummiforce=0
        self.sumofFSR=0
        
    def dummiforce_cb(self, msg):
        self.dummiforce = msg.data
        return self.dummiforce
    
    def sens_cb(self,msg):
        self.FSR=np.array(msg.data)
        self.FSR=np.around(self.FSR, decimals=2)
        self.FSR=self.FSR[4:]
        self.sumofFSR = np.sum(self.FSR)
        return self.FSR
    
    def show(self):
#         print self.FSR
#         print self.sumofFSR
        pass
    
    def save(self):
        ##File structure
        ## [FSR1, FSR2, FSR3, FSR4, current, realpos, sentpos]
                
        tosave = np.append(self.sumofFSR, self.dummiforce)
       
        dir="/home/francesco/ros_ws_handshake/calibrateFSR/"
        name="FSRfromDummy_lin"
       
        with open(dir + name + ".csv" , 'a') as f:
            writer = csv.writer(f)
            writer.writerow(tosave)         
        #print tosave

 
        
if __name__=="__main__":
    try:

        main()
    except rospy.ROSInterruptException:
        pass
