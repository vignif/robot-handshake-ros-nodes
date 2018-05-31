/*
 * hand_detect_closure.cpp
 *
 *  Created on: May 29, 2018
 *      Author: francesco
 */

#include <qb_force_control.h>
#include "ros/ros.h"
#include <std_msgs/Float32MultiArray.h>
float Arr[6];
float sensors_threshold=10;
bool hand_detected=false;
float value=0;


void OpenClose(qb_interface::handPos state, ros::Publisher pub, bool hand_detected);
void arrayCallback(const std_msgs::Float32MultiArray::ConstPtr& array);
void control_FSR(float last_closure, ros::NodeHandle n);
void update_hand_status();





int main(int argc, char **argv)
{

	ros::init(argc, argv, "hand_detect_closure");
	ros::NodeHandle n;
	ros::Subscriber sub = n.subscribe("sensors_FSR", 100, arrayCallback);
	ros::Publisher pub = n.advertise<qb_interface::handRef>("/qb_class/hand_ref", 100);
	qb_interface::handPos state;
	std_msgs::Float32MultiArray array;
	ROS_INFO("hand_detect_closure node started");
	int iterations=0;
	while (ros::ok()){




		int k=10;							//fraction rate
		int UB =17; //valore massimo di chiusura
		int LB =0;  //valore minimo di chiusura
		float closure=0;
		float last_closure;
		update_hand_status();			//update hand_detected
		//openclose hand

			for (int j =LB*k; j <= UB*k ; j++){ //contatore valore di chiusura mano
				if(hand_detected==0){
					value=1000/k;
					closure=abs(value*j);
					state.closure.push_back(closure);

			//		cout << "hand detected: " <<hand_detected << endl;
	//				cout<< "sens: " << Arr[0] << endl;
					last_closure=closure;
					//n.setParam("/stiffness",0.2); //publish parameter to ros
				}else{
					//n.setParam("/stiffness",0.5); //publish parameter to ros
					control_FSR(last_closure, n);
					state.closure.push_back((int)value); //round the closure value to the closest integer
		//			cout<< "sens: " << Arr[0] << endl;
				}		//update hand_detected

					pub.publish(state);				//pubblico valore di chiusura a softhand
					update_hand_status();
					usleep(200000);
					ros::spinOnce();
					state.closure.clear();
			}
		//OpenClose(state, pub, hand_detected);
		//start arduino values
		/*
		 */

		//n.setParam("/stiffness",0.9); //publish parameter to ros
		//pub.publish(state);
		//usleep(10000);  //dynamic usleeps takes microseconds in input
		iterations+=1;
		//cout <<"iterations: " << iterations << endl;
	}	//end while(ros::ok)
}		//end main


void OpenClose(qb_interface::handPos state, ros::Publisher pub, bool hand_detected){

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
}


void control_FSR(float last_closure, ros::NodeHandle n){
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
    stiff=(0.8/(limit-last_closure))*(value-last_closure)+0.1;
    n.setParam("/stiffness",stiff);
    if( value > limit){
        value = limit;
    }
    if(value < last_closure){
    	value = last_closure;
    }
}


void update_hand_status(){
	if( Arr[0]<sensors_threshold && Arr[1]<sensors_threshold){
		cout << "hand_NOT_detected" << endl;
		hand_detected=false;
	}else{
		cout << "hand_detected" << endl;
		//n.setParam("/stiffness",0.2); //publish parameter to ros
		hand_detected=true;
	}
}

