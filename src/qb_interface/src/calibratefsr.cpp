/*
 * calibratefsr.cpp
 *
 *  Created on: Aug 21, 2018
 *      Author: francesco
 */




#include <qb_force_control.h>
#include "ros/ros.h"
#include <std_msgs/Float32MultiArray.h>
#include <functions.h>
#include <iostream>
#include <fstream>
#include <vector>
#include <ctime>

using namespace std;

int main(int argc, char **argv)
{
	int q;
	float FSR;

	ros::init(argc, argv, "CalibrateFSR");
	ros::NodeHandle n;
	callbacks cb;
	ros::Subscriber sub = n.subscribe("sensors_FSR", 100, arrayCallback_sensors);
	ros::Subscriber sub1 = n.subscribe("dummipalm", 100, &callbacks::cb_dummipalm, &cb);
	ros::Publisher pub = n.advertise<std_msgs::Float32>("/sumofFSR",100);
	ros::Publisher pub1 = n.advertise<std_msgs::Float32>("/FSRfracDUMMI",100);
	ros::Publisher pub2 = n.advertise<qb_interface::handRef>("/qb_class/hand_ref", 100);


	std_msgs::Float32 fraction;
	std_msgs::Float32 sumofFSR;
	qb_interface::handPos state;

	ROS_INFO("CalibrateFSR node started");

	while (ros::ok())
	{
		ros::spinOnce();
		FSR= Arr[4] + Arr[5];
//		cout << "sumFSR: " << FSR << endl;

		sumofFSR.data = FSR;
		pub.publish(sumofFSR);

// save file with sumofFSR vs DUMMIPALM force

		//
		fraction.data = FSR/cb.dummipalm_force;
		pub1.publish(fraction);


//// control hand via dummipalm
//		state.closure.clear();
//
//		state.closure.push_back(cb.dummipalm_force/150*19000); //round the closure value to the closest integer
		//n.setParam("/stiffness",0.9); //publish parameter to ros
		pub2.publish(state);
		usleep(100000);  //dynamic usleeps takes microseconds in input
	}
}

