#!/usr/bin/env python

import functools
import rospy

from std_msgs.msg import Float32MultiArray

rospy.init_node("delay")


def delayed_callback(msg, event):
    pub.publish(msg)

def callback(msg):
    timer = rospy.Timer(rospy.Duration(0.025), #delay topic of 250 ms
                        functools.partial(delayed_callback, msg),
                        oneshot=True)

sub = rospy.Subscriber("sensors_FSR_2_delay", Float32MultiArray, callback, queue_size=100)
pub = rospy.Publisher("sensors_FSR", Float32MultiArray, queue_size=100)


while not rospy.is_shutdown():
    rospy.spin()
    