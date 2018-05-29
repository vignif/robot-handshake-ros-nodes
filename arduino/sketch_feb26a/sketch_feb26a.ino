#include <ros.h>
#include <qb_interface/handRef.h> //includi custom message in modo
//che arduino invii direttamente a ros il valore closure.
//path per includere libreria ~/Arduino/libraries/Rosserial_Arduino_Library/src/

#include <std_msgs/Float32MultiArray.h>

ros::NodeHandle nh;
const int queue_size=0; //infinit queue can overload arduino memory if the not dequeued properly
std_msgs::Float32MultiArray sensors;
ros::Publisher chatter("sensors_FSR", &sensors, queue_size);


/******************************************************************************
  Force_Sensitive_Resistor_Example.ino
  Example sketch for SparkFun's force sensitive resistors
  (https://www.sparkfun.com/products/9375)
  Jim Lindblom @ SparkFun Electronics
  April 28, 2016

  Create a voltage divider circuit combining an FSR with a 3.3k resistor.
  - The resistor should connect from A0 to GND.
  - The FSR should connect from A0 to 3.3V
  As the resistance of the FSR decreases (meaning an increase in pressure), the
  voltage at A0 should increase.

  Development environment specifics:
  Arduino 1.6.7
******************************************************************************/

const int FSR_PIN = A0; // Pin connected to FSR/resistor divider
const int FSR_PIN2 = A1; // Pin connected to FSR/resistor divider
const int FSR_PIN3 = A2; // Pin connected to FSR/resistor divider
const int FSR_PIN4 = A3; // Pin connected to FSR/resistor divider
const int FSR_PIN5 = A4; // Pin connected to FSR/resistor divider
const int FSR_PIN6 = A5; // Pin connected to FSR/resistor divider


// Measure the voltage at 5V and resistance of your 3.3k resistor, and enter
// their value's below:
const float VCC = 4.98; // Measured voltage of Ardunio 5V line
const float R_DIV = 3230.0; // Measured resistance of 3.3k resistor
const float threshold=5;


float ComputeForce(float fsrADC, float VCC){
  // If the FSR has no pressure, the resistance will be
  // near infinite. So the voltage should be near 0.
  
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
  pinMode(FSR_PIN, INPUT);
  
  nh.initNode();
  nh.advertise(chatter);
  sensors.data_length=6;
  sensors.data = (float *)malloc(sizeof(float)*6);
  float fsrADC[6];
}

void loop()
{
  int fsrADC = analogRead(FSR_PIN);
  int fsrADC2 = analogRead(FSR_PIN2);
  int fsrADC3 = analogRead(FSR_PIN3);
  int fsrADC4 = analogRead(FSR_PIN4);
  int fsrADC5 = analogRead(FSR_PIN5);
  int fsrADC6 = analogRead(FSR_PIN6);
  float force1, force2, force3, force4 ,force5, force6;


//at each iteration forces are set to zero if lower the threshold 
  force1 = force2 = force3 = force4 = force5 = force6 = 0;

//threshold condition, values close to zero are set to zero
  if (fsrADC > threshold)
  force1 = ComputeForce(fsrADC, VCC);
 
  //sensor 2
  if (fsrADC2 > threshold)  
  force2 = ComputeForce(fsrADC2, VCC);
  
  //sensor 3
  if (fsrADC3 > threshold) 
   force3 = ComputeForce(fsrADC3, VCC);
 
  //sensor 4
  if (fsrADC4 > threshold) 
   force4 = ComputeForce(fsrADC4, VCC);  

  //sensor 5
  if (fsrADC5 > threshold) 
  force5 = ComputeForce(fsrADC5, VCC);
 
  //sensor 6
  if (fsrADC6 > threshold) 
  force6 = ComputeForce(fsrADC6, VCC);

//assign force values to array for topic publish
sensors.data[0]=force1;
sensors.data[1]=force2;
sensors.data[2]=force3;
sensors.data[3]=force4;
sensors.data[4]=force5;
sensors.data[5]=force6;

  //If a force is detected.
  if ((force1 != 0) || (force2 != 0) || (force3 != 0) || (force4 != 0) || (force5 != 0) || (force6 != 0)){
  //Serial.println(String(sensor_array[0]) + ";" + String(force2) + ";" + String(force3) + ";" + String(force4) + ";" + String(force5) + ";" + String(force6));
  //String message = String(force1) + ";" + String(force2) + ";" + String(force3) + ";" + String(force4) + ";" + String(force5) + ";" + String(force6);
  //str_msg.data = message.c_str();
  //chatter.publish( &sensors );
  //nh.spinOnce();
  //delay(10);
  }
  else
  {
    //no forces detected
  }

//always publish even if values are all zeros

chatter.publish( &sensors );
nh.spinOnce();
delay(1); 
}
