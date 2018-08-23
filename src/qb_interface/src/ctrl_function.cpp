/*
 * ctrl_function.cpp
 *
 *  Created on: Aug 21, 2018
 *      Author: Francesco Vigni
 *
 * ctrl_function.cpp takes the values from FSR sensors (calibrated for N)
 * and publish a topic according to a second order model obtained from experiments
 * this model is computed in compute_f in file functions.h
 *
 *
 *
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
	ros::init(argc, argv, "FSRtoClosure");
	ros::NodeHandle n;
	ros::Subscriber sub = n.subscribe("sensors_FSR", 100, arrayCallback_sensors);
	ros::Publisher pub = n.advertise<qb_interface::handRef>("/qb_class/hand_ref", 100);
	qb_interface::handPos state;

	ROS_INFO("Controller by function node started");

	while (ros::ok())
	{
		float sumofFSR=0;
		ros::spinOnce();
		state.closure.clear();
		q=compute_f(sumofFSR);

		state.closure.push_back(q); //round the closure value to the closest integer
		//n.setParam("/stiffness",0.9); //publish parameter to ros
		pub.publish(state);
		usleep(1000);  //dynamic usleeps takes microseconds in input
	}
}
