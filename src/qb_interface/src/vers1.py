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
    print "im in CALIBRATE"
    current=msg.closure[2]
#     Perform slowlyclose and go to next state
#     pub = rospy.Publisher("qb_class/hand_ref",qb_msg,queue_size= 1000)
#     value=10000
#     cls=[value]
#     pub.publish(cls)
# #     rospy.init_node('publisher_open_close_python', anonymous=True)
#     rate = rospy.Rate(20)

# 
#         print current
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

class start(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['valid'])
    def execute(self, userdata):
        rospy.sleep(3.0)
        return 'valid'

class calibrate(smach.State):
    def __init__(self):
        smach.State.__init__(self, 
                             outcomes=['valid','preempted'])
        self.pub = rospy.Publisher("qb_class/hand_ref", msg.handRef, queue_size= 1000)
        self.sub = rospy.Subscriber("qb_class/hand_measurement", msg.handPos, self.current_cb)
        self.cal_q=[]
        self.cal_i=[]
        self.calibrated_q_i=[]
        self.current=0

        
    def execute(self, ud):
        rate = rospy.Rate(20)
        rg=range(-19000,19000,100)
        for value in rg:
            self.cls=[19000-np.abs(value)]
            self.pub.publish(self.cls)
            self.cal_q.append(self.cls)
            self.cal_i.append(self.current)
            self.calibrated_q_i = np.column_stack((np.array(self.cal_q),np.array(self.cal_i)))
            rate.sleep()
        print self.calibrated_q_i
        print self.current
        return 'valid'


    def current_cb(self,handPos):
        self.current=handPos.closure[2]
        #     Start.execute(current)
        return self.current

def main():
    rospy.init_node("monitor_example")

    sm = smach.StateMachine(outcomes=['DONE'])
    
    
    with sm:
        
        smach.StateMachine.add('WAIT', start(), 
                               transitions={'valid':'CALIBRATE'})
#         smach.StateMachine.add('CALIBRATE', smach_ros.MonitorState("/qb_class/hand_measurement",  handPos, monitor_cb_hand), transitions={'invalid':'FSR_CONTROL', 'valid':'FOO', 'preempted':'FOO'})
        smach.StateMachine.add('CALIBRATE', calibrate(), 
                               transitions={'valid':'FSR_CONTROL', 'preempted':'FOO'})

        smach.StateMachine.add('FSR_CONTROL', 
                               smach_ros.MonitorState("/sensors_FSR", Float32MultiArray, sens_trig), 
                               transitions={'invalid':'WAIT', 'valid':'FOO', 'preempted':'FOO'})

        smach.StateMachine.add('FOO', 
                               smach_ros.MonitorState("/sm_reset", Empty, monitor_cb), 
                               transitions={'invalid':'FOO', 'valid':'FOO', 'preempted':'FOO'})
#         smach.StateMachine.add('hand', smach_ros.MonitorState("/qb_class/hand_measurement", handPos, ), transitions={'invalid':'BAR', 'valid':'FOO', 'preempted':'FOO'})

       
    sis = smach_ros.IntrospectionServer('smach_server', sm, '/SM_ROOT')
    sis.start()
    sm.execute()
    rospy.spin()
    sis.stop()

if __name__=="__main__":
    main()