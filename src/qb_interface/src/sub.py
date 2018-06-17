#!/usr/bin/env python
import roslib
import rospy
import smach
import smach_ros
from std_msgs.msg import Float32MultiArray
import numpy as np
from qb_interface import msg as qb_msg
from qb_interface.msg._handPos import handPos


from std_msgs.msg import Empty

class bar(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['bar_succeeded'])
    def execute(self, userdata):
        rospy.sleep(3.0)
        return 'bar_succeeded'
    
def monitor_cb_hand(ud, msg):
#     current=msg.closure[2]
#     Perform slowlyclose and go to next state
    pub = rospy.Publisher("qb_class/hand_ref",qb_msg,queue_size= 1000)
#     rospy.init_node('publisher_open_close_python', anonymous=True)
    rate = rospy.Rate(20)
    rg=range(-19000,19000,100)
    for value in rg:
        rospy.spin()
        cls=[19000-np.abs(value)]
        pub.publish(cls)
        rate.sleep()    
    print current
    return False
    
def sens_trig(ud, msg):
    td=20
    sensors=msg.data[2:]
    sensors=np.sum(msg.data[2:])
    if sensors < td:
        return True
    else:
        return False
    
def monitor_cb(ud, msg):
    return False

def main():
    rospy.init_node("monitor_example")

    sm = smach.StateMachine(outcomes=['DONE'])
    with sm:
        
        smach.StateMachine.add('START', smach_ros.MonitorState("/sensors_FSR", Float32MultiArray, sens_trig), transitions={'invalid':'SLOWLYCLOSE', 'valid':'FOO', 'preempted':'FOO'})
        
        smach.StateMachine.add('SLOWLY')
        smach.StateMachine.add('SLOWLYCLOSE', smach_ros.MonitorState("/qb_class/hand_measurement",  handPos, monitor_cb_hand), transitions={'invalid':'FSR_CONTROL', 'valid':'FOO', 'preempted':'FOO'})
        smach.StateMachine.add('FSR_CONTROL', smach_ros.MonitorState("/sensors_FSR", Float32MultiArray, sens_trig), transitions={'invalid':'FINAL', 'valid':'FOO', 'preempted':'FOO'})
        smach.StateMachine.add('FINAL',bar(), transitions={'bar_succeeded':'START'})

        smach.StateMachine.add('FOO', smach_ros.MonitorState("/sm_reset", Empty, monitor_cb), transitions={'invalid':'FOO', 'valid':'FOO', 'preempted':'FOO'})
#         smach.StateMachine.add('hand', smach_ros.MonitorState("/qb_class/hand_measurement", handPos, ), transitions={'invalid':'BAR', 'valid':'FOO', 'preempted':'FOO'})

       
    sis = smach_ros.IntrospectionServer('smach_server', sm, '/SM_ROOT')
    sis.start()
    sm.execute()
    rospy.spin()
    sis.stop()

if __name__=="__main__":
    main()