/*
 * ctrl_file.cpp
 *
 *  Created on: Aug 15, 2018
 *      Author: Francesco Vigni
 *
 * ctrl_file.cpp takes the values from FSR sensors (calibrated for N)
 * and publish a topic according to a second order model obtained from experiments
 * this model is loaded from a comma-separated file named 'model.csv' where
 * the first column represent the closure position q and the second column
 * the sum of the FSR readings.
 * the function is called scale_controller1 in functions.h
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

	ros::init(argc, argv, "FSRtoClosure");
	ros::NodeHandle n;
	ros::Subscriber sub = n.subscribe("sensors_FSR", 100, arrayCallback_sensors);
	ros::Publisher pub = n.advertise<qb_interface::handRef>("/qb_class/hand_ref", 100);
	qb_interface::handPos state;

	ROS_INFO("Controller1 node started");

// get data from file
		FILE *fid = fopen("/home/francesco/ros_ws_handshake/src/qb_interface/src/model1.csv","r");
		vector<int> v1,v2;

		while(!feof(fid))
		{

			int val1,val2;
			fscanf(fid,"%d,%d",&val1,&val2);
			v1.push_back(val1);
			v2.push_back(val2);
		}
		const int nn = v1.size();
		int m[nn][2];
		for(int i=0;i<nn;i++)
		{
			m[i][0]=v1[i];
			m[i][1]=v2[i];
		}

		for(int i=0;i<nn;i++)
			cout<<m[i][0]<<" "<<m[i][1]<<endl;

	while (ros::ok())
	{
		float sumofFSR=0;
		ros::spinOnce();
		state.closure.clear();
		value = scale_controller1(sumofFSR, m, 0 , 5);
		state.closure.push_back((int)value); //round the closure value to the closest integer
		pub.publish(state);
		usleep(10000);  //dynamic usleeps takes microseconds in input
	}
}
