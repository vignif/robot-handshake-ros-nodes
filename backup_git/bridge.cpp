#include <stdio.h>
#include <stdlib.h>
#include <qb_force_control.h>
#include "ros/ros.h"

#include "std_msgs/MultiArrayLayout.h"
#include "std_msgs/MultiArrayDimension.h"

#include <std_msgs/Float32MultiArray.h>
float Arr[6];

void arrayCallback(const std_msgs::Float32MultiArray::ConstPtr& array);

int main(int argc, char **argv)
{


  //state.closure.clear();
	ros::init(argc, argv, "sensorReading");
	ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("sensors_FSR", 100, arrayCallback);

  qb_interface::handPos state;

	while (ros::ok())
	{
    ros::Publisher pub = n.advertise<qb_interface::handRef>("/qb_class/hand_ref", 1);

    float value=0;
		std_msgs::Float32MultiArray array;

    ros::spinOnce();
		for(int j = 0; j < 6; j++)
		{
		printf("%f, ", Arr[j]);
    value+=Arr[j];
		}
		printf("\n");

    state.closure.push_back(value);
    pub.publish(state);
    usleep(100);
    state.closure.clear();
	}



//sleep(2);

}

void arrayCallback(const std_msgs::Float32MultiArray::ConstPtr& array)
{

	int i = 0;
	// print all the remaining numbers
	for(std::vector<float>::const_iterator it = array->data.begin(); it != array->data.end(); ++it)
	{
		Arr[i] = *it;
		i++;
	}

	return;
}
