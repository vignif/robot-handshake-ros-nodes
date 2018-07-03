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


class zero(smach.State):
    def __init__(self):
        smach.State.__init__(self, 
                             outcomes=['valid'],
                             output_keys=['calibrate_out'])
        self.dir="/home/francesco/ros_ws_handshake/openloop_saves/"
        self.name="zero"
        self.pub = rospy.Publisher("qb_class/hand_ref", msg.handRef, queue_size= 1000)
        self.sub = rospy.Subscriber("qb_class/hand_measurement", msg.handPos, self.current_cb)
        self.cal_q=[]
        self.cal_i=[]
        self.calibrated_q_i=[]
        self.current=0

        
    def execute(self, ud):
        self.sub = rospy.Subscriber("sensors_FSR", Float32MultiArray, self.sens_cb)
        Bound=17000
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
        rospy.sleep(2)
        return 'valid'


    def current_cb(self,handPos):
        self.current=handPos.closure[2]
        #     Start.execute(current)
        return self.current
    
    def sens_cb(self,msg):
        
        self.FSR_value=np.sum(msg.data[2:])
        self.FSR=np.array(msg.data[2:])
        self.FSR=np.around(self.FSR, decimals=2)
        with open(self.dir + self.name + ".csv" , 'a') as f:
            writer = csv.writer(f)
            writer.writerow(self.FSR)
    #np.savetxt("FSR.csv", self.FSR,  fmt='%.2f', delimiter=',', header=" #1,  #2,  #3,  #4")
       # if self.FSR_value>9000:
       #     self.FSR_value=9000
       # else:
       #     self.FSR_value=np.sum(msg.data[2:])
        return self.FSR
    
        
        

class one(smach.State):
    def __init__(self):
        smach.State.__init__(self, 
                             outcomes=['valid'],
                             output_keys=['calibrate_out'])
        self.dir="/home/francesco/ros_ws_handshake/openloop_saves/"
        self.name="zero"
        self.pub = rospy.Publisher("qb_class/hand_ref", msg.handRef, queue_size= 1000)
        self.sub = rospy.Subscriber("qb_class/hand_measurement", msg.handPos, self.current_cb)
        self.cal_q=[]
        self.cal_i=[]
        self.calibrated_q_i=[]
        self.current=0

        
    def execute(self, ud):
        self.sub = rospy.Subscriber("sensors_FSR", Float32MultiArray, self.sens_cb)
        Bound=19000
        rospy.loginfo("Execute zero state")
        
        rate = rospy.Rate(70)
        rg=range(0,Bound,100)
        for value in rg:
            self.cls=[value]
            if value < 16000:
                self.pub.publish([value])
            elif value > 16000:
                self.pub.publish([16000])
            #elif value > 15000:
             #   self.pub.publish([15000])
                rate.sleep()
            rate.sleep()

        for value in np.flipud(rg):
            self.cls=[value]
            if value < 16000:
                self.pub.publish([value])
                rate.sleep()
                if value == 14000:
                    self.pub.publish([14000])
                    rospy.sleep(1)
                    
        #ud.calibrate_out=self.calibrated_q_i
        self.FSR=[0,0,0,0]
#        print self.calibrated_q_i
#        print self.current
        #rospy.sleep(10)
        return 'valid'


    def current_cb(self,handPos):
        self.current=handPos.closure[2]
        #     Start.execute(current)
        return self.current
    
    def sens_cb(self,msg):
        
        self.FSR_value=np.sum(msg.data[2:])
        self.FSR=np.array(msg.data[2:])
        self.FSR=np.around(self.FSR, decimals=2)
        with open(self.dir + self.name + ".csv" , 'a') as f:
            writer = csv.writer(f)
            writer.writerow(self.FSR)
    #np.savetxt("FSR.csv", self.FSR,  fmt='%.2f', delimiter=',', header=" #1,  #2,  #3,  #4")
       # if self.FSR_value>9000:
       #     self.FSR_value=9000
       # else:
       #     self.FSR_value=np.sum(msg.data[2:])
        return self.FSR


def main():
    rospy.init_node("monitor_example")
    
    sm = smach.StateMachine(outcomes=['DONE'])
    
    
    with sm:
        
        smach.StateMachine.add('0', zero(), 
                               transitions={'valid':'1'})
        smach.StateMachine.add('1', one(), 
                               transitions={'valid':'0'})
        
        
#         smach.StateMachine.add('hand', smach_ros.MonitorState("/qb_class/hand_measurement", handPos, ), transitions={'invalid':'BAR', 'valid':'FOO', 'preempted':'FOO'})
       
    sis = smach_ros.IntrospectionServer('smach_server', sm, '/SM_ROOT')
    sis.start()
    sm.execute()
    rospy.spin()
    sis.stop()

if __name__=="__main__":
    main()