#include <qb_force_control.h>
#include "ros/ros.h"
#include <std_msgs/Float32MultiArray.h>
#include <functions.h>
#include <iostream>
#include <fstream>
#include <vector>

using namespace std;

int main(int argc, char **argv)
{

	ros::init(argc, argv, "FSRtoClosure");
	ros::NodeHandle n;
	ros::Subscriber sub = n.subscribe("sensors_FSR", 100, arrayCallback_sensors);
	ros::Publisher pub = n.advertise<qb_interface::handRef>("/qb_class/hand_ref", 100);
	qb_interface::handPos state;

	ROS_INFO("Controller1 node started");

	ifstream in("model1.csv");
		vector<float> vv;
		while(!in.eof())
		{
			float v;
			in>>v;
			vv.push_back(v);
		}
		const int nn=vv.size();
		int v[nn];
		int pos[nn];
		for(int i=0;i<nn;i++){
			v[i]=vv[i];
			pos[i]=i;
		}
		for(int i=0;i<nn;i++)
			cout<<"v["<<i<<"]="<<v[i]<<endl;
		in.close();

	while (ros::ok())
	{
		float sumofFSR=0;
		ros::spinOnce();
		state.closure.clear();

		value = scale_controller1(sumofFSR, vv, pos, 0 , 5);
		state.closure.push_back((int)value); //round the closure value to the closest integer
		//n.setParam("/stiffness",0.9); //publish parameter to ros
		pub.publish(state);
		usleep(10000);  //dynamic usleeps takes microseconds in input
	}
}
