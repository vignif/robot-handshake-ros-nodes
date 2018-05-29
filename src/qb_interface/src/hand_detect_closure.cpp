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
qb_interface::handPos OpenClose(qb_interface::handPos state){

    int k=10;
    int upbound =19;
    float value=0;
    for (int j =-upbound*k; j <= upbound*k ; j++){
    value=1000/k;
	state.closure.clear();
    state.closure.push_back(abs(value*j));
    cout << value*j << endl;
    }
    return state;
}

int main(int argc, char **argv)
{

ros::init(argc, argv, "hand_detect_closure");
ros::NodeHandle n;
ros::Subscriber sub = n.subscribe("sensors_FSR", 100, arrayCallback);
ros::Publisher pub = n.advertise<qb_interface::handRef>("/qb_class/hand_ref", 100);
qb_interface::handPos state;
ROS_INFO("hand_detect_closure node started");
while (ros::ok()){
	float value=0;
    std_msgs::Float32MultiArray array;
	ros::spinOnce();

	//cout <<"sensor0:\t"<< Arr[0] <<endl;

	if( Arr[0]<sensors_threshold && Arr[1]<sensors_threshold){
		//cout << "hand_NOT_detected" << endl;
		hand_detected=false;
	}else{
		//cout << "hand_detected" << endl;
		hand_detected=true;
		state =OpenClose(state);
	    pub.publish(state);
	    usleep(10000);
	}

//start arduino values
/*
    int limit = 19000; //hand limit closure input
    for(int j = 0; j < 6; j++){
        //printf("%f, ", Arr[j]);
        value+=Arr[j];
    }
    value=value*1.9;
    //printf("\n");
    if( value > limit){
        value = limit;
    }
*/

//state.closure.push_back((int)value); //round the closure value to the closest integer
//n.setParam("/stiffness",0.9); //publish parameter to ros
//pub.publish(state);
//usleep(10000);  //dynamic usleeps takes microseconds in input
    }
}



