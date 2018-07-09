#include <HX711.h>

#define DOUT 3
#define CLK 2

HX711 scale(DOUT,CLK);
  
long calibration_val=0;
void setup() {
  Serial.begin(9600);
  //scale.set_scale(11180);

Serial.println(".....Calibrating....");

  for (int i=0;i<100;i++)
    calibration_val+=scale.read();
  calibration_val=calibration_val/100;
Serial.print("Start value:");
Serial.println(calibration_val);
Serial.println("########Acquisition start.....###########");

}

void loop() {
  long read_val=scale.read();
  //Serial.println(read_val-calibration_val);

  if((read_val-calibration_val) >0)
    {Serial.println((read_val-calibration_val)/11180);}// To get force in N, divide by factor 11180
  else
  { } 
  //  Serial.print (0);
  //Serial.println (" Newton");
  
  //delay(100);
}  


