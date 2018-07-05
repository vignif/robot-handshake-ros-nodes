#!/usr/bin/env python
## 03_july_18
import roslib
import rospy
import smach
import smach_ros
import std_msgs
import numpy as np
import csv
import random
from std_msgs.msg import Float32MultiArray
from qb_interface import msg 
from std_msgs.msg import Empty
from std_msgs.msg import String




def main():
    pub = rospy.Publisher("qb_class/hand_ref", msg.handRef, queue_size= 1000)
    rospy.init_node("steps", anonymous=True)
    
    #Class for managing subscription and file with relevant data
    Mg=manage_cb()

    # 22 different values
    steps=range(6000,17000,500)
    #initial seed to make a pseudorandom shuffle
    SEED = 448 
    random.seed(SEED)
    random.shuffle(steps)
    rate=rospy.Rate(100) #100 Hz
    
    for i in steps:
#         Mg.sentpos(i)
        for a in range(0,300,1):
            pub.publish([i])    
            rate.sleep()
    
 
class manage_cb:
    def __init__(self):
        self.sub_current = rospy.Subscriber("qb_class/hand_measurement", msg.handPos , self.current_cb)
        self.sub_sensors = rospy.Subscriber("sensors_FSR", Float32MultiArray, self.sens_cb)
        self.sub_realpos = rospy.Subscriber("qb_class/hand_measurement", msg.handPos , self.realpos_cb)
#         self.sub_sentpos = rospy.Subscriber("qb_class/hand_ref", msg.handRef , self.sentpos_cb)
#         
#     def sentpos(self, closure):
#         self.sentpos = closure
#         self.save()
#         return self.sentpos
    
    def realpos_cb(self,handPos):
        self.realpos=handPos.closure[0]
        self.save()
        return self.realpos
    
    def current_cb(self,handPos):
        self.current=handPos.closure[2]
        self.save()
        return self.current
    
    def sens_cb(self,msg):
#         FSR_value=np.sum(msg.data[2:])
        self.FSR=np.array(msg.data[2:])
        self.FSR=np.around(self.FSR, decimals=2)
        self.save()
        return self.FSR
    
    def save(self):
        tosave = np.append(self.FSR, self.realpos)
#         tosave = np.append(tosave, self.sentpos)
        tosave = np.append(tosave, np.around(self.current , decimals=2))
        dir="/home/francesco/ros_ws_handshake/openloop_saves/"
        name="steps_v1_onerow" 
        with open(dir + name + ".csv" , 'a') as f:
            writer = csv.writer(f)
            writer.writerow(tosave)
         
        print tosave
        
if __name__=="__main__":
    try:
        main()
    except rospy.ROSInterruptException:
        pass