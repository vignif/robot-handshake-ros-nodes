#!/usr/bin/env python
import roslib
import rospy
import smach
import smach_ros
from std_msgs.msg import Float32MultiArray
import numpy as np

from qb_interface import msg
from qb_interface.msg._handPos import handPos


from std_msgs.msg import Empty

class bar(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['bar_succeeded'])
    def execute(self, userdata):
        rospy.sleep(3.0)
        return 'bar_succeeded'
    
def monitor_cb_hand(ud, msg):
    current=msg.closure[2]
    print current
    return False
    
def sens_trig(ud, msg):
    sensors=msg.data[2:]
    sensors=np.sum(msg.data[2:])
    print sensors
    return True
    
def monitor_cb(ud, msg):
    return False

def main():
    rospy.init_node("monitor_example")

    sm = smach.StateMachine(outcomes=['DONE'])
    with sm:
        
        smach.StateMachine.add('START', smach_ros.MonitorState("/sensors_FSR", Float32MultiArray, sens_trig), transitions={'invalid':'BAR', 'valid':'FOO', 'preempted':'FOO'})
        smach.StateMachine.add('FOO', smach_ros.MonitorState("/sm_reset", Empty, monitor_cb), transitions={'invalid':'BAR', 'valid':'FOO', 'preempted':'FOO'})
        smach.StateMachine.add('hand', smach_ros.MonitorState("/qb_class/hand_measurement", handPos, monitor_cb_hand), transitions={'invalid':'BAR', 'valid':'FOO', 'preempted':'FOO'})

        smach.StateMachine.add('BAR',bar(), transitions={'bar_succeeded':'hand'})

    sis = smach_ros.IntrospectionServer('smach_server', sm, '/SM_ROOT')
    sis.start()
    sm.execute()
    rospy.spin()
    sis.stop()

if __name__=="__main__":
    main()