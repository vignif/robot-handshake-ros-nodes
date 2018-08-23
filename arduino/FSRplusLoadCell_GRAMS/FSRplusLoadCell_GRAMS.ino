/******************************************************************************
 Arduino with 6 FSR plugged to the ANALOG inputs AND load cell plugged to Digital
  in order to sync the topics to ROS in order to save a file to understand the 
  relation between fsrvalues and force(N) from load cell
  
  FSR_qb_interface.ino
  starting from:
  Example sketch for SparkFun's force sensitive resistors
  (https://www.sparkfun.com/products/9375)
  Jim Lindblom @ SparkFun Electronics   April 28, 2016

function ComputeForce with specific:
  Create a voltage divider circuit combining an FSR with a 3.3k resistor.
  - The resistor should connect from A0 to GND.
  - The FSR should connect from A0 to 3.3V
  As the resistance of the FSR decreases (meaning an increase in pressure), the
  voltage at A0 should increase.

ROS integration:
  publisher 'chatter' is publishing a topic in ROS environment with a vector of float32 of size = NumberOfSensors,
  named 'sensors_FSR' where each entry is the force sensor value read by the pins.

The parameter NumberOfSensors is currently set to 4 but if needed can be changed in order to publish a smaller/larger
vector. 


Francesco Vigni @ SIRSLab
july 8, 2018
 
******************************************************************************/
#include <HX711.h>
#include <ros.h>
#include <std_msgs/Float32.h>
#include <std_msgs/Float32MultiArray.h>
#include <math.h>

#define DOUT 3
#define CLK 2

HX711 scale(DOUT,CLK);
/*
#include <qb_interface/handRef.h> //includi custom message in modo
//che arduino invii direttamente a ros il valore closure.
//path per includere libreria ~/Arduino/libraries/Rosserial_Arduino_Library/src/
*/

ros::NodeHandle nh;
const int queue_size=0; //infinit queue can overload arduino memory if the not dequeued properly
//create ros publisher named 'sensors_FSR'
std_msgs::Float32MultiArray sensors;
std_msgs::Float32 force;

ros::Publisher chatter("sensors_FSR", &sensors, queue_size);
ros::Publisher chatter1("dummipalm", &force, queue_size);
long calibration_val=0;

//publisher for closure
/*
qb_interface::handRef ClosureValue;
ros::Publisher send_closure("closure", &ClosureValue, queue_size);
float value;
*/
// Modify these values if needed
//start
const int NumberOfSensors =6; 
const float threshold=3; // minimum pressure filtered
//end

int fsrADC[NumberOfSensors];       //initialize Int array
int FSR_PIN[]={A0,A1,A2,A3,A4,A5}; //create array of PINS


float ComputeForce(int fsrADC){
  // This function is called for each sensor, and is returning a force based on FSR datasheet. 
  // If the FSR has no pressure, the resistance will be
  // near infinite. So the voltage should be near 0.
  // Measure the voltage at 5V and resistance of your 3.3k resistor, and enter
  // their value's below:
    const float VCC = 4.98; // Measured voltage of Ardunio 5V line
    const float R_DIV = 3230.0; // Measured resistance of 3.3k resistor
 
    float force;
    float fsrV = fsrADC * VCC / 1023.0;
 // Use voltage and static resistor value to
    // calculate FSR resistance:
    float fsrR = R_DIV * (VCC / fsrV - 1.0);
    // Guesstimate force based on slopes in figure 3 of FSR datasheet:
    
    float fsrG = 1.0 / fsrR; // Calculate conductance
    // Break parabolic curve down into two linear slopes:
    if (fsrR <= 600)
      force = (fsrG - 0.00075) / 0.00000032639;
    else
      force =  fsrG / 0.000000642857;
    return ( force*9.80665/1000);
    }

void setup()
{
  nh.getHardware()->setBaud(57600);
  pinMode(FSR_PIN[0], INPUT);
  
  nh.initNode();
  nh.advertise(chatter);
  nh.advertise(chatter1);

//calibrate dummypalm
  for (int i=0;i<100;i++)
    calibration_val+=scale.read();
  calibration_val=calibration_val/100;

//sensors alloc space
  sensors.data_length=NumberOfSensors;
  sensors.data = (float *)malloc(sizeof(float)*NumberOfSensors);
}

void loop()
{
  long read_val=scale.read();

 //for loop over sensors, and compute force from analog reading with function ComputeForce
for(int i =0; i<NumberOfSensors; i++){
  fsrADC[i]=analogRead(FSR_PIN[i]); // fill array of fsrADC from analogReads
  if(fsrADC[i]>threshold){ //check if threshold is satisfied
  sensors.data[i]=ComputeForce(fsrADC[i]); //compute force from analog read with function ComputeForce
  }else{
  sensors.data[i]=0; // if the threshold is not satistied set the value to zero
  }   
  }
if((read_val-calibration_val) >0)
    {
      //Serial.println((read_val-calibration_val)/11180);
      force.data=(read_val-calibration_val)/11180;
      
     // force.data=-2.051*(force.data*force.data)+269*force.data+867.7;
      // To get force in N, divide by factor 11180
    }
//Start publish routine
chatter.publish( &sensors ); //i'm publishing the sensors pointer to array
chatter1.publish( &force ); //i'm publishing the pointer to force

nh.spinOnce();
delayMicroseconds(100);
//END publish routine
}
