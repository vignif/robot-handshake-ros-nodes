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
	int q0;float p[3];
	if(*argv[1]=='1'){
		q0=12000;
		p[0]=-0.01124; p[1]=2.061; p[2]=4.864; p[3]=-4210;
	}else if(*argv[1]=='2'){
//		PROBLEM HERE
		q0=11000;
		p[0]=0.475775; p[1]=-34.546; p[2]=297.2; p[3]=-5854.5;
	}else if(*argv[1]=='3'){
		q0=10500;
		p[0]=0.007035; p[1]=-0.1305; p[2]=55.82; p[3]=-2169.5;
	}else if(*argv[1]=='4'){
		q0=10000;
		p[0]=0.019435; p[1]=-3.7; p[2]=276.15; p[3]=-3824;
//	}else if(*argv[1]=='5'){
//		q0=7000;

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
	ros::param::set("/stiffness",1.0);

	while (ros::ok())
	{
		float sumofFSR=0;
		ros::spinOnce();
		state.closure.clear();
//		q=compute_f(sumofFSR);
		q=compute_f_with_q0(sumofFSR,q0,p);
//		q=compute_f_francesco(sumofFSR);
		state.closure.push_back(q); //round the closure value to the closest integer
		//n.setParam("/stiffness",0.9); //publish parameter to ros
		pub.publish(state);
		usleep(1000);  //dynamic usleeps takes microseconds in input
	}
}
