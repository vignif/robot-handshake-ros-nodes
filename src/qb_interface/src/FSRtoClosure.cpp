#include <qb_force_control.h>
#include "ros/ros.h"
#include <std_msgs/Float32MultiArray.h>
#include <functions.h>


int main(int argc, char **argv)
{

	ros::init(argc, argv, "FSRtoClosure");
	ros::NodeHandle n;
	ros::Subscriber sub = n.subscribe("sensors_FSR", 100, arrayCallback_sensors);
	ros::Publisher pub = n.advertise<qb_interface::handRef>("/qb_class/hand_ref", 100);
	qb_interface::handPos state;

	ROS_INFO("FSRtoClosure node started");
	while (ros::ok())
	{
		float value=0;
		ros::spinOnce();
		state.closure.clear();

		value = scale_closure(value, 3.4, 0 , 5);
		state.closure.push_back((int)value); //round the closure value to the closest integer
		//n.setParam("/stiffness",0.9); //publish parameter to ros
		pub.publish(state);
		usleep(10000);  //dynamic usleeps takes microseconds in input
	}
}
