#include <ros.h>
#include <std_msgs/String.h>

ros::NodeHandle nh;

std_msgs::String str_msg;
ros::Publisher chatter("chatter", &str_msg);
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
  Serial.begin(9600);
  pinMode(FSR_PIN, INPUT);
  nh.initNode();
  nh.advertise(chatter);


}

void loop()
{
  int fsrADC = analogRead(FSR_PIN);
  int fsrADC2 = analogRead(FSR_PIN2);
  int fsrADC3 = analogRead(FSR_PIN3);
  int fsrADC4 = analogRead(FSR_PIN4);
  int fsrADC5 = analogRead(FSR_PIN5);
  int fsrADC6 = analogRead(FSR_PIN6);


  float force1;
  float force2;
  float force3;
  float force4;
  float force5;
  float force6;

  // If the FSR has no pressure, the resistance will be
  // near infinite. So the voltage should be near 0.
  //Sensor 1
  if (fsrADC > threshold) // If the analog reading is non-zero
  {
   force1 = ComputeForce(fsrADC, VCC);
  }
  else
  {
    // No pressure detected
    force1 = 0;
  }

  //sensor 2
  if (fsrADC2 > threshold) // If the analog reading is non-zero
  {
  force2 = ComputeForce(fsrADC2, VCC);
  }
  else
  {
    // No pressure detected
    force2 = 0;
  }


  //sensor 3
  if (fsrADC3 > threshold) // If the analog reading is non-zero
  {
   force3 = ComputeForce(fsrADC3, VCC);
  }
  else
  {
    // No pressure detected
    force3 = 0;
  }


  //sensor 4
  if (fsrADC4 > threshold) // If the analog reading is non-zero
  {
   force4 = ComputeForce(fsrADC4, VCC);
  }
  else
  {
    // No pressure detected
    force4 = 0;
  }


  //sensor 5
  if (fsrADC5 > threshold) // If the analog reading is non-zero
  {
 force5 = ComputeForce(fsrADC5, VCC);
  }
  else
  {
    // No pressure detected
    force5 = 0;
  }

  //sensor 6
  if (fsrADC6 > threshold) // If the analog reading is non-zero
  {
      force6 = ComputeForce(fsrADC6, VCC);
  }
  else
  {
    // No pressure detected
  }
//Serial.println(analogRead(FSR_PIN));
//delay(200);

  // disp forces
  if ((force1 != 0) || (force2 != 0) || (force3 != 0) || (force4 != 0) || (force5 != 0) || (force6 != 0)){
    //Serial.println(String(force1) + ";" + String(force2) + ";" + String(force3) + ";" + String(force4) + ";" + String(force5) + ";" + String(force6));
   
    String message = String(force1) + ";" + String(force2) + ";" + String(force3) + ";" + String(force4) + ";" + String(force5) + ";" + String(force6);
    str_msg.data = message.c_str();
    chatter.publish( &str_msg );
    nh.spinOnce();
  }
  else
  {
    //no forces detected
  }
  //delay(500);
}

