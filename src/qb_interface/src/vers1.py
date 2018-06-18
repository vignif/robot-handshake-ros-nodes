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


class final(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['valid'])
        
    def execute(self, ud):
        rospy.signal_shutdown("Handshake terminate")
        return 'valid'

class start(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['valid'])
    def execute(self, userdata):
        rospy.loginfo("Waiting for 3 seconds")
        for i in xrange(3,0,-1):
            rospy.sleep(1)
            print i
        return 'valid'

class fsr_control(smach.State):
    def __init__(self):
        smach.State.__init__(self,
                             outcomes=['valid'],
                             input_keys=['calibrate_in'])
        self.pub = rospy.Publisher("qb_class/hand_ref", msg.handRef, queue_size= 1000)
        self.sub = rospy.Subscriber("sensors_FSR", Float32MultiArray, self.sens_cb)
        self.Qt1=10000

    
    def execute(self,ud):
        rospy.loginfo("execute FSR_CONTROL")
        self.calibrated_array=ud.calibrate_in
     #   print self.calibrated_array
      #  rospy.loginfo("force control array input above")
      #  print self.calibrated_array[50,:]
       # rospy.sleep(5)
       # rate=rospy.Rate(30)
        Max=max(self.calibrated_array[:,1])
        Min=min(self.calibrated_array[:,1])
        rng=Max-Min
        print "Threshold = " + str(rng*0.1)
        print "Shape = " + str(self.calibrated_array.shape)
        for index, item in enumerate(self.calibrated_array):
#           print index
            
            #print "shape: " + str(item.shape)
            #print "item: " + str(item)
            if item[1] > rng*0.1:
                self.Qt1=item[0]
                continue
            print "First closure position: " + str(self.Qt1)
        
        while(rospy.is_shutdown()==False):
            value=[np.sum(self.FSR_value)+self.Qt1]
            self.pub.publish(value)
        return 'valid'
        
    def sens_cb(self,msg):
        self.FSR_value=msg.data[2:]
        return self.FSR_value
        


class calibrate(smach.State):
    def __init__(self):
        smach.State.__init__(self, 
                             outcomes=['valid'],
                             output_keys=['calibrate_out'])
        self.pub = rospy.Publisher("qb_class/hand_ref", msg.handRef, queue_size= 1000)
        self.sub = rospy.Subscriber("qb_class/hand_measurement", msg.handPos, self.current_cb)
        self.cal_q=[]
        self.cal_i=[]
        self.calibrated_q_i=[]
        self.current=0

        
    def execute(self, ud):
        rospy.loginfo("Execute empty calibration")
        rate = rospy.Rate(40)
        rg=range(-19000,19000,100)
        for value in rg:
            self.cls=[19000-np.abs(value)]
            self.pub.publish(self.cls)
            self.cal_q.append(self.cls)
            self.cal_i.append(self.current)
            self.calibrated_q_i = np.column_stack((np.array(self.cal_q),np.array(self.cal_i)))
            rate.sleep()
        ud.calibrate_out=self.calibrated_q_i
        print self.calibrated_q_i
#         print self.current
        return 'valid'


    def current_cb(self,handPos):
        self.current=handPos.closure[2]
        #     Start.execute(current)
        return self.current
    
    
class calibrate_full(smach.State):
    def __init__(self):
        smach.State.__init__(self, 
                             outcomes=['valid'],
                             output_keys=['calibrate_out'],
                             input_keys=['calibrate_in','calibrate_out'])
##calibrate_out as input key ???
        self.pub = rospy.Publisher("qb_class/hand_ref", msg.handRef, queue_size= 1000)
        self.sub = rospy.Subscriber("qb_class/hand_measurement", msg.handPos, self.current_cb)
        self.cal_q=[]
        self.cal_i=[]
        self.calibrated_q_i=[]
        self.current=0

        
    def execute(self, ud):
        rospy.loginfo("Execute full calibration")
        self.empty=ud.calibrate_in
        rate = rospy.Rate(40)
        rg=range(-19000,19000,100)
        for value in rg:
            self.cls=[19000-np.abs(value)]
            self.pub.publish(self.cls)
            self.cal_q.append(self.cls)
            self.cal_i.append(self.current)
            self.calibrated_q_i = np.column_stack((np.array(self.cal_q),np.array(self.cal_i)))
            rate.sleep()
        ud.calibrate_out = self.calibrated_q_i-self.empty
        
#        temp=self.calibrated_q_i
 #       temp[:,1]-=self.empty[:,1]
  #      ud.calibrate_out=temp
        ud.calibrate_out[:,0]=self.calibrated_q_i[:,0]
        print ud.calibrate_out
        rospy.sleep(3)
#         print self.current
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
                               transitions={'valid':'CALIBRATE_FULL'},
                               remapping={'calibrate_out':'sm_calibrated_empty'})
        
        smach.StateMachine.add('CALIBRATE_FULL', calibrate_full(), 
                           transitions={'valid':'FSR_CONTROL'},
                           remapping={'calibrate_out':'sm_calibrated_array',
                                      'calibrate_in':'sm_calibrated_empty'})

        smach.StateMachine.add("FSR_CONTROL", fsr_control(),
                               transitions={'valid':'FINAL'},
                               remapping={'calibrate_in':'sm_calibrated_array'})
        
        
        smach.StateMachine.add("FINAL", final(),
                               transitions={'valid':'FINAL'})
        
#         smach.StateMachine.add('hand', smach_ros.MonitorState("/qb_class/hand_measurement", handPos, ), transitions={'invalid':'BAR', 'valid':'FOO', 'preempted':'FOO'})
       
    sis = smach_ros.IntrospectionServer('smach_server', sm, '/SM_ROOT')
    sis.start()
    sm.execute()
    rospy.spin()
    sis.stop()

if __name__=="__main__":
    main()