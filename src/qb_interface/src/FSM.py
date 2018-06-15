#!/usr/bin/env python

import roslib
import rospy
import smach
import smach_ros
from docutils.nodes import transition
from std_msgs.msg import Float32MultiArray
from std_msgs.msg import Int32
from qb_interface import msg
from qb_interface.msg._handPos import handPos
from time import sleep

class Callbacks():
    def __init__(self):
        current=0
        sensors=[]
    @staticmethod
    def current_cb(self,handPos):
        self.current=handPos.closure[2]
        print self.current
        return self

    def sensors_array_cb(self,data):
        #print "Here are some floats:", str(data.data)
        self.sensors=data.data[2:]
        return sensors
        # rospy.loginfo(rospy.get_caller_id() + "I heard %s", data.data)


# define state Start
class Start(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['sensors_triggered'])

    def execute(self, userdata):
        rospy.loginfo('Executing state Start')
        cb=Callbacks()
        
        return 'sensors_triggered'


# define state SlowlyClose
class SlowlyClose(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['current_triggered'])

    def execute(self, userdata):
        rospy.loginfo('Executing state SlowlyClose')
        return 'current_triggered'
        

# define state FSR_Ctrl
class FSR_Ctrl(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['end_handshake'])

    def execute(self, userdata):
        rospy.loginfo('Executing state FSR_Ctrl')
        return 'end_handshake'
        
class Final(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['timeout'])

    def execute(self, userdata):
        rospy.loginfo('Executing state Final')
        sleep(1)
        return 'timeout'


        

def main():
    rospy.init_node('smach')
    rospy.Subscriber("sensors_FSR", Float32MultiArray, Callbacks.sensors_array_cb)
    rospy.Subscriber("qb_class/hand_measurement", msg.handPos, Callbacks.current_cb)
    rospy.Publisher("qb_class/hand_ref",msg.handRef,queue_size= 1000)
    # Create a SMACH state machine
    sm = smach.StateMachine(outcomes=['Start'])
    
    
    # Open the container
    with sm:
        # Add states to the container
        smach.StateMachine.add('Start', Start(), 
                               transitions={'sensors_triggered':'SlowlyClose'})
        smach.StateMachine.add('SlowlyClose', SlowlyClose(), 
                               transitions={'current_triggered':'FSR_Ctrl'})
        smach.StateMachine.add('FSR_Ctrl', FSR_Ctrl(),
                               transitions={'end_handshake':'Final'})
        smach.StateMachine.add('Final', Final(),
                               transitions={'timeout':'Start'})
        
    # Execute SMACH plan
    sis = smach_ros.IntrospectionServer('smach_server', sm, '/SM_ROOT')
    sis.start()
    sm.execute()
    rospy.spin()
    sis.stop()
    
    
    

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
    