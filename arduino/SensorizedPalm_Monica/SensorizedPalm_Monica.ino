#include <HX711.h>
#include <ros.h>
#include <std_msgs/Float32.h>

#define DOUT 3
#define CLK 2

HX711 scale(DOUT,CLK);
  
ros::NodeHandle nh;
const int queue_size=0; //infinit queue can overload arduino memory if the not dequeued properly
std_msgs::Float32 force;
ros::Publisher chatter("dummipalm", &force, queue_size);
long calibration_val=0;


void setup() {
  
  
  nh.getHardware()->setBaud(57600);
  nh.initNode();
  nh.advertise(chatter);
  
  
  for (int i=0;i<100;i++)
    calibration_val+=scale.read();
  calibration_val=calibration_val/100;
}

void loop() {
  
  long read_val=scale.read();
  //Serial.println(read_val-calibration_val);

  if((read_val-calibration_val) >0)
    {
      Serial.println((read_val-calibration_val)/11180);
      force.data=(read_val-calibration_val)/11180;    
      // To get force in N, divide by factor 11180
    }
chatter.publish( &force ); //i'm publishing the sensors pointer to array
nh.spinOnce();
delayMicroseconds(1000);

  
}  


