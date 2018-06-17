#!/usr/bin/env python
import roslib
import rospy
import smach
import smach_ros
from std_msgs.msg import Float32MultiArray
import numpy as np
from qb_interface import msg
from qb_interface.msg._handPos import handPos

def main():
    pub = rospy.Publisher("qb_class/hand_ref",msg.handRef,queue_size= 1000)
    rospy.init_node('publisher_open_close_python', anonymous=True)
    rate = rospy.Rate(20)
    rg=range(-19000,19000,100)
    for value in rg:
        
        cls=[19000-np.abs(value)]
        pub.publish(cls)
        rate.sleep()
#         msg.closure=[value]
#         pub.publish(msg)
#         rate.sleep()
    
    
if __name__=="__main__":
   try:
        main()
   except rospy.ROSInterruptException:
        pass