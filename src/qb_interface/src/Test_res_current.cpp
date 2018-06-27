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

#include <iostream>
#include <chrono>

using namespace std;



int main(int argc, char **argv)
{

	callbacks cb;
	ros::init(argc, argv, "Test_res_current");
	ros::NodeHandle n;
	ros::Subscriber sub1 = n.subscribe("/qb_class/hand_ref",100, &callbacks::cb_closure, &cb);
	ros::Subscriber sub2 = n.subscribe("/qb_class/hand_measurement",100, &callbacks::cb_current, &cb);
	ros::Subscriber sub3 = n.subscribe("/smooth",100, &callbacks::cb_current, &cb);

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
	strcpy(dir,"/home/francesco/ros_ws_handshake/tests/");
	strcpy(name,"Davide_0.csv");
	strcat(dir,name);

	std::ofstream outFile(dir);

	//start set param
		float step=50; //step
		int freq=8; //frequency of publisher (Hz)
	//end

		int k= 1000/step;
		int upbound =19;
		int iterations=2*upbound*k;
		chrono::high_resolution_clock::time_point start = chrono::high_resolution_clock::now();
	for(int i=0; i <1;i++){
		for (int j =-upbound*k; j <= upbound*k ; j++){
			state.closure.clear();
			state.closure.push_back(upbound*1000-abs(step*j));
			pub.publish(state);
			ros::spinOnce();
			usleep(freq*1000); //(Hz*1000)
			if(cb.closure>=1) //salto la prima lettura
			{
				cout <<"Closure: "<< cb.closure << " Current: "<< cb.current << endl;
				outFile << cb.closure << ", " << cb.current <<endl;
				/*
			cout <<"Closure: "<< cb.closure << " Current: "<< cb.smooth_current << endl;
			outFile << cb.closure << ", " << cb.smooth_current <<endl;
				 */
			}
		}
		//usleep(10000);
	}
    chrono::high_resolution_clock::time_point end = chrono::high_resolution_clock::now();
    auto duration = chrono::duration_cast<chrono::milliseconds>( end - start ).count();
	cout << "step resolution: " << step <<endl;
    cout << "iterations: " << iterations << endl;
    cout << "estimated time elapsed(ms): " << iterations*freq << endl;
    cout <<"real time elapsed(ms): " << duration<< endl;
    outFile.close();



	return 0;
}




