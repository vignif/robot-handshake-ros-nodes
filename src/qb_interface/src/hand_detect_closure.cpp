/*
 * hand_detect_closure.cpp
 *
 *  Created on: May 29, 2018
 *      Author: francesco
 */
#include <qb_force_control.h>
#include "ros/ros.h"
#include <std_msgs/Float32MultiArray.h>
#include <std_msgs/String.h>
#include <std_msgs/Int32.h>
#include <functions.h>


/*
	start =0,
	handshake =1,
	stop=2
 */

class Listener{
public:
	int cmd;
	void toggle(const std_msgs::Int32::ConstPtr str);
};

void Listener::toggle(const std_msgs::Int32::ConstPtr str){
	cmd = str->data;// variable cmd now has value from topic
}

void OpenClose(qb_interface::handPos state);
void control_FSR(ros::NodeHandle n);



int main(int argc, char **argv)
{

	ros::init(argc, argv, "hand_detect_closure");

	Listener listen;
	ros::NodeHandle n;
	ros::Subscriber sub = n.subscribe("sensors_FSR", 100, arrayCallback_sensors);
	ros::Publisher pub = n.advertise<qb_interface::handRef>("/qb_class/hand_ref", 100);
	ros::Subscriber tog = n.subscribe("toggle", 100, &Listener::toggle, &listen);
	qb_interface::handPos state;
	std_msgs::Float32MultiArray array;
	ROS_INFO("hand_detect_closure node started");
	int iterations=0;

	while (ros::ok()){
		switch(listen.cmd){
		case 0:
			if(value!=0){
				state.closure.clear();
				cout << "OFF - waiting for toggle" << endl;
				value=0;
				state.closure.push_back((int)value); //round the closure value to the closest integers
				pub.publish(state);
			}
			break;
		case 1: //start
			if(value!=6000){
				state.closure.clear();
				cout << "OFF - waiting for toggle" << endl;
				value=6000;
				state.closure.push_back((int)value); //round the closure value to the closest integers
				pub.publish(state);
			}
			break;
		case 2: //handshake
			state.closure.clear();
			cout << "ON - im in handshake state" << endl;
			control_FSR(n);
			state.closure.push_back((int)value); //round the closure value to the closest integer

			pub.publish(state);
			break;
		}
		//pubblico valore di chiusura a softhand
		usleep(200000);
		ros::spinOnce();

		update_hand_status();			//update hand_detected



	}	//end while(ros::ok)
	return 0;
}		//end main


void OpenClose(qb_interface::handPos state){
	int k=10;	//fraction rate
	int UB =17; //valore massimo di chiusura
	int LB =0;  //valore minimo di chiusura
	float last_closure;
	float closure=0;
	for (int j =LB*k; j <= UB*k ; j++){
		value=1000/k;
		closure=abs(value*j);
		state.closure.push_back(closure);
		last_closure=closure;
	}
}


void control_FSR(ros::NodeHandle n){
	float stiff;
	n.getParam("/stiffness", stiff);
	value=0;
	value= scale_closure(value, 3.4, 2, 5);
}
