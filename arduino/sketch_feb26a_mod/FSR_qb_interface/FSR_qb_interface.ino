/******************************************************************************
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
  
  publisher 'send_closure' is publishing a topic in ROS environment TOPIC -> qb_class/hand_ref and
  with type of MESSAGE -> qb_interface/handRef which is a float32 named 'closure' by qb_interface package
insert ros custom message in arduino from http://wiki.ros.org/rosserial_client/Tutorials/Generating%20Message%20Header%20Files

PROBLEMS
  qb_hand stiffness is changing the closure range

UNDERSTAND
  difference between topics and parameters

Francesco Vigni @ SIRSLab
may 13, 2018
 
******************************************************************************/

#include <ros.h>
#include <handRef.h> //includi custom message in modo
//che arduino invii direttamente a ros il valore closure.
//path per includere libreria ~/Arduino/libraries/Rosserial_Arduino_Library/src/

#include <std_msgs/Float32MultiArray.h>

ros::NodeHandle nh;
const int queue_size=0; //infinit queue can overload arduino memory if the not dequeued properly

//publisher for sensors array useful to 'bridge' on node FSRtoClosure of qb_interface package
std_msgs::Float32MultiArray sensors;
ros::Publisher chatter("sensors_FSR", &sensors, queue_size);

//publisher for closure
qb_interface::handRef ClosureValue;
ros::Publisher send_closure("closure", &ClosureValue, queue_size);
float value;


//initialize fsrADC int array of analog readings
//define how many FSR sensors are connected to the board
//
const int NumberOfSensors =6; 


int fsrADC[NumberOfSensors];       //initialize Int array
int FSR_PIN[]={A0,A1,A2,A3,A4,A5}; //create array of PINS


const float threshold=5;


float ComputeForce(int fsrADC){
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
    //Serial.println("Resistance sensor 6: " + String(fsrR) + " ohms");
    // Guesstimate force based on slopes in figure 3 of
    // FSR datasheet:
    //float force6;
    float fsrG = 1.0 / fsrR; // Calculate conductance
    // Break parabolic curve down into two linear slopes:
    if (fsrR <= 600)
      force = (fsrG - 0.00075) / 0.00000032639;
    else
      force =  fsrG / 0.000000642857;
    //Serial.println("Sensor 6: " + String(force6) + " g");
    //Serial.println();
return force;
    //delay(500);
    }

void setup()
{
  Serial.begin(57600);
  nh.getHardware()->setBaud(57600);
  pinMode(FSR_PIN[0], INPUT);
  
  nh.initNode();
  nh.advertise(chatter);
  nh.advertise(send_closure);  
  sensors.data_length=NumberOfSensors;
  sensors.data = (float *)malloc(sizeof(float)*NumberOfSensors);
//  fsrADC = (int *)malloc(sizeof(int)*6);

}

void loop()
{
  
 //for loop over sensors, and compute force from analog read with function ComputeForce
for(int i =0; i<NumberOfSensors; i++){
  fsrADC[i]=analogRead(FSR_PIN[i]); // fill array of fsrADC from analogReads
  if(fsrADC[i]>threshold){ //check if threshold is satisfied
  sensors.data[i]=ComputeForce(fsrADC[i]); //compute force from analog read with function ComputeForce
  }
  }


//compute closure from array vector(f.i as sum of values) and 
//publish it in the TOPIC -> qb_class/hand_ref 
//with type of MESSAGE -> qb_interface/handRef
for (int i=0; i<NumberOfSensors; i++){
  value+= sensors.data[i];
}
//Hand-Dynamic definition starts here.
/* IDEAS
 *  1- compute Simple Moving Average of last X 'value' in order to make the function smoother it makes sense when the frequency increase
 *  2- discretize closure of hand in order to have steps of closure, when value is close to a step, aproximate.
 *  3- work on delayMicroseconds to set frequency publish of topic [DYNAMICS]
 *  4- force estimate from residual current so we know when the qbhand is applying a force on the human hand
 *  5- work as fast as possible so that the bottleneck is the qbhand
*/
//Start publish routine
ClosureValue.closure=&value;

send_closure.publish(&ClosureValue); //i'm publishing the closure value as defined from qb_interface package
chatter.publish( &sensors ); //i'm publishing the sensors pointer to array
nh.spinOnce();
//delay(1);  //SECONDS
delayMicroseconds(1000);

//END publish routine
}
