#include <iostream>
#include <qb_force_control.h>
#include "ros/ros.h"
#include <std_msgs/Float32MultiArray.h>
#include <std_msgs/String.h>
#include <std_msgs/Int32.h>
#include <functions.h>

#include <fstream>
#include <vector>
#include <string>
#include <time.h>


using namespace std;



int main(int argc, char **argv)
{
    clock_t start = clock();
	callbacks cb;
	ros::init(argc, argv, "Test_res_current");
	ros::NodeHandle n;
	ros::Subscriber sub1 = n.subscribe("/qb_class/hand_ref",100, &callbacks::cb_closure, &cb);
	ros::Subscriber sub2 = n.subscribe("/qb_class/hand_measurement",100, &callbacks::cb_current, &cb);
	ros::Publisher pub = n.advertise<qb_interface::handRef>("/qb_class/hand_ref", 100);

	qb_interface::handPos state;

	//put the hand into the initial position
	/*
	state.closure.clear();
	float st=0;
	state.closure.push_back(st);
	ros::spinOnce();
	pub.publish(state);
	//wait for 1sec
	sleep(4);
*/
	char dir[50];
	char name[20];
	strcpy(dir,"ros_ws_handshake/tests/");
	strcpy(name,"Francesco_1.csv");
	strcat(dir,name);


	std::ofstream outFile(dir);

	for(int i=0; i <1;i++){
		int k=10;
		int upbound =19;
		float value=0;
		for (int j =-upbound*k; j <= upbound*k ; j++){
			cout <<"Closure: "<< cb.closure << " Current: "<< cb.current << endl;
			value=1000/k;
			state.closure.clear();
			state.closure.push_back(upbound*1000-abs(value*j));
			outFile << cb.closure << ", " << cb.current <<endl;
			ros::spinOnce();
			usleep(10000);
			pub.publish(state);
		}

		//usleep(10000);
	}
	outFile.close();



	return 0;
}




