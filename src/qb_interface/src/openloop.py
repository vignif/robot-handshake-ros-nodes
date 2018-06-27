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
from std_msgs.msg import String
import csv

class final(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['valid'])
        
    def execute(self, ud):
        rospy.signal_shutdown("Handshake terminate")
        return 'valid'


class start(smach.State):
    def __init__(self):
        self.FSR_value=0
        smach.State.__init__(self, outcomes=['valid'])

    def execute(self, userdata):        
        rospy.loginfo("Waiting for 3 seconds")
        rate = rospy.Rate(70)

        for i in xrange(3,0,-1):
            rospy.sleep(1)
            print i
        #while(rospy.is_shutdown()==False):
            #rospy.loginfo("rate test")
#            self.pub.publish("rate test")
         #   rate.sleep()
 #           rospy.loginfo(self.FSR)
        return 'valid'
    

class zero(smach.State):
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
        self.sub = rospy.Subscriber("sensors_FSR", Float32MultiArray, self.sens_cb)
        Bound=16000
        rospy.loginfo("Execute zero state")
        rate = rospy.Rate(70)
        rg=range(-Bound,Bound,100)
        for value in rg:
            self.cls=[Bound-np.abs(value)]
            self.pub.publish(self.cls)
            self.cal_q.append(self.cls)
            self.cal_i.append(self.current)
            self.calibrated_q_i = np.column_stack((np.array(self.cal_q),np.array(self.cal_i)))
            rate.sleep()
        ud.calibrate_out=self.calibrated_q_i
        self.FSR=[0,0,0,0]
#        print self.calibrated_q_i
#        print self.current
        return 'valid'


    def current_cb(self,handPos):
        self.current=handPos.closure[2]
        #     Start.execute(current)
        return self.current
    
    def sens_cb(self,msg):
        self.FSR_value=np.sum(msg.data[2:])
        self.FSR=np.array(msg.data[2:])
        with open(r'FSR', 'a') as f:
            writer = csv.writer(f)
            writer.writerow(self.FSR)
    #np.savetxt("FSR.csv", self.FSR,  fmt='%.2f', delimiter=',', header=" #1,  #2,  #3,  #4")
       # if self.FSR_value>9000:
       #     self.FSR_value=9000
       # else:
       #     self.FSR_value=np.sum(msg.data[2:])
        return self.FSR
    
        
        
class fsr_control(smach.State):
    def __init__(self):
        smach.State.__init__(self,
                             outcomes=['valid'],
                             input_keys=['calibrate_in'])
        self.pub = rospy.Publisher("qb_class/hand_ref", msg.handRef, queue_size= 1000)
        self.sub = rospy.Subscriber("sensors_FSR", Float32MultiArray, self.sens_cb)
        self.Qt1=0
        self.Qtf=5000
    
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
        threshold = rng*0.10 ## 10 % of max load current for detecting hand
        threshold_max_closure = rng*0.80
        print "Threshold = " + str(threshold)
        print "Shape = " + str(self.calibrated_array.shape)
        for index, item in enumerate(self.calibrated_array):
#           print index
            
            #print "shape: " + str(item.shape)
            #print "item: " + str(item)
            ## item[0] == POSITION
            ## item[1] == RESIDUAL CURRENT
            if item[1] > threshold:
                self.Qt1=item[0]
                continue

            if item[1] > threshold_max_closure:
                self.Qtf=item[0]
                continue
            

        print "First closure position: " + str(self.Qt1)
        print "Final closure position: " + str(self.Qtf)
        
        while(rospy.is_shutdown()==False):
            #print self.FSR_value
            adj_FSR=(self.FSR_value/9000)*(self.Qtf-self.Qt1)
            #print adj_FSR
            value=[adj_FSR+self.Qt1]
            if(value>[19000]):
                self.pub.publish([19000])
            else:
                self.pub.publish(value)
        rospy.signal_shutdown("Closing program")
        return 'valid'
    
    def sens_cb(self,msg):
        self.FSR_value=np.sum(msg.data[2:])
        np.savetxt("FSR.csv", msg.data , delimiter=",")
       # if self.FSR_value>9000:
       #     self.FSR_value=9000
       # else:
       #     self.FSR_value=np.sum(msg.data[2:])
        return self.FSR_value
        


    
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
        rospy.loginfo("Execute full calibration, put your hand in shakehand position")
        for i in xrange(3,0,-1):
            rospy.sleep(1)
            print i
        Bound=16000
        self.empty=ud.calibrate_in
        rate = rospy.Rate(70)
        rg=range(-Bound,Bound,100)
        
        for value in rg:
            self.cls=[Bound-np.abs(value)]
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
        #print ud.calibrate_out
        #rospy.sleep(3)
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
                               transitions={'valid':'0'})
#         smach.StateMachine.add('CALIBRATE', smach_ros.MonitorState("/qb_class/hand_measurement",  handPos, monitor_cb_hand), transitions={'invalid':'FSR_CONTROL', 'valid':'FOO', 'preempted':'FOO'})
        smach.StateMachine.add('0', zero(), 
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