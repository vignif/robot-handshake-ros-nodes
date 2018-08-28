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
	string error = "Usage: Input the HandSize code\n 1(verysmall hand)->5(verybig hand)";
	if (argc < 2) {
	        // Tell the user how to run the program
	        std::cerr << error << std::endl;
	        /* "Usage messages" are a conventional way of telling the user
	         * how to run a program if they enter the command incorrectly.
	         */
	        return 1;
	    }
	int q0;
	if(*argv[1]=='1'){
		q0=11000;
	}else if(*argv[1]=='2'){
		q0=10000;
	}else if(*argv[1]=='3'){
		q0=9000;
	}else if(*argv[1]=='4'){
		q0=8000;
	}else if(*argv[1]=='5'){
		q0=7000;

		}else {
	        std::cerr << error << std::endl;

		return 1;
	}
	cout << "initial position set to " << q0 <<endl;
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
//		q=compute_f(sumofFSR);
		q=compute_f_with_q0(sumofFSR,q0);
		state.closure.push_back(q); //round the closure value to the closest integer
		//n.setParam("/stiffness",0.9); //publish parameter to ros
		pub.publish(state);
		usleep(1000);  //dynamic usleeps takes microseconds in input
	}
}
