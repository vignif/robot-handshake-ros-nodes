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

void OpenClose(qb_interface::handPos state, ros::Publisher pub, bool hand_detected);
void control_FSR(ros::NodeHandle n);



int main(int argc, char **argv)
{

	ros::init(argc, argv, "hand_detect_closure");

	Listener listen;
	ros::NodeHandle n;
	ros::Subscriber sub = n.subscribe("sensors_FSR", 100, arrayCallback_sensors);
	ros::Publisher pub = n.advertise<qb_interface::handRef>("/qb_class/hand_ref", 100);
	ros::Subscriber tog = n.subscribe("start_stop", 100, &Listener::toggle, &listen);
	qb_interface::handPos state;
	std_msgs::Float32MultiArray array;
	ROS_INFO("hand_detect_closure node started");
	int iterations=0;

	while (ros::ok()){
		switch(listen.cmd){

		case 0: //start
			cout << "OFF - waiting for toggle" << endl;
			break;
		case 1: //handshake
			cout << "ON - im in handshake state" << endl;
			control_FSR(n);
			break;
		}



		update_hand_status();			//update hand_detected
		//openclose hand
		/*
		for (int j =LB*k; j <= UB*k ; j++){ //contatore valore di chiusura mano
			if(hand_detected==0){

				//n.setParam("/stiffness",0.2); //publish parameter to ros
			}else{
				//n.setParam("/stiffness",0.5); //publish parameter to ros
				control_FSR(last_closure, n);
				state.closure.push_back((int)value); //round the closure value to the closest integer
				//			cout<< "sens: " << Arr[0] << endl;
			}		//update hand_detected

			pub.publish(state);				//pubblico valore di chiusura a softhand
			update_hand_status();

			state.closure.clear();
		}
		 */
		usleep(200000);
		ros::spinOnce();
		//OpenClose(state, pub, hand_detected);
		//start arduino values
		/*
		 */

		//n.setParam("/stiffness",0.9); //publish parameter to ros
		//pub.publish(state);
		//usleep(10000);  //dynamic usleeps takes microseconds in input
		//iterations+=1;
		//cout <<"iterations: " << iterations << endl;

		//cout <<  << endl;
	}	//end while(ros::ok)
	return 0;
}		//end main


void OpenClose(qb_interface::handPos state, ros::Publisher pub){
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
	int limit = 19000; //hand limit closure input
	for(int j = 2; j < 6; j++){
		//printf("%f, ", Arr[j]);
		value+=Arr[j];
	}
	value=value*3.4;
	//printf("\n");
	// stiff=(0.8/(limit-last_closure))*(value-last_closure)+0.1;
	//n.setParam("/stiffness",stiff);
	if( value > limit){
		value = limit;
	}
}





