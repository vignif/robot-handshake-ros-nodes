/*
 * ctrl_3.cpp
 *      Author: Francesco Vigni
 *
 * ctrl_3.cpp implements the mixed openloop/closed loop
 * strategy for the human-robot handshaking
 * initially the robot is waiting for a contact to happens
 * then it will have some own behaviour and after a time T
 * it will take into account the value from the FSRs
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
#include <chrono>

using namespace std;

void save_file(const string& name);


int main(int argc, char **argv)
{
	string error = "Usage: Input the HandSize code\n 1(verysmall hand)->2(verybig hand)";
	if (argc < 2) {
		// Tell the user how to run the program
		std::cerr << error << std::endl;
		return 1;
	}
	int q0;float p[3];
	/*	if(*argv[1]=='1'){
			q0=12000;
			p[0]=-0.01124; p[1]=2.061; p[2]=4.864; p[3]=-4210;
		}else if(*argv[1]=='2'){
	//		PROBLEM HERE
			q0=11000;
			p[0]=0.475775; p[1]=-34.546; p[2]=297.2; p[3]=-5854.5;
		}else
	*/
	if(*argv[1]=='1'){
		q0=12000;
		p[0]=0.007035; p[1]=-0.1305; p[2]=55.82; p[3]=0;
	}else if(*argv[1]=='2'){ //BETTER ONE
		q0=11000;
		p[0]=0.019435; p[1]=-3.7; p[2]=276.15; p[3]=0;
		//	}else if(*argv[1]=='5'){
		//		q0=7000;

	}else {
		std::cerr << error << std::endl;

		return 1;
	}


	cout << "initial position set to " << q0 <<endl;
	int q;
	callbacks cb;
	ros::init(argc, argv, "ctrl_3");
	ros::NodeHandle n;
	ros::Subscriber sub = n.subscribe("sensors_FSR", 100, arrayCallback_sensors);
	ros::Subscriber sub1 = n.subscribe("/qb_class/hand_ref",100, &callbacks::cb_closure, &cb);
	ros::Subscriber sub2 = n.subscribe("/qb_class/hand_measurement",100, &callbacks::cb_current, &cb);
	ros::Publisher pub = n.advertise<qb_interface::handRef>("/qb_class/hand_ref", 100);
	qb_interface::handPos state;
	ROS_INFO("Controller by function node started");
	ros::param::set("/stiffness",1.0);

	// Saving file routine

	string name = "experiment";
	std::ofstream outFile;
	//save_file checks if a file exists in a specific folder
	//it true create a new file with a incremental number in the name
	save_file(name);
	int microsec_to_sleep=1000;
	int it=0;

//	chrono::high_resolution_clock::time_point duration;
	float in_contact_time;
	while (ros::ok())
	{

//		chrono::high_resolution_clock::time_point start = chrono::high_resolution_clock::now();
		bool in_contact= check_contact();
		state.closure.clear();
		if(in_contact){
			//			cout << "IN contact" << endl;
			float sumofFSR=0;

			//q=compute_f(sumofFSR);
//		    cout <<"real time elapsed(ms): " << duration<< endl;
			in_contact_time=(float) it /microsec_to_sleep;
			cout <<"time: "<<in_contact_time << " sec" <<endl;
			if((int)in_contact_time%4 != 0 ){
			q=compute_f_with_q0(sumofFSR,q0,p);
			cout << "part1" <<endl;
			}else{
			q=compute_f_francesco(sumofFSR);
			cout << "part2" << endl;
			}
			outFile << Arr[0] << ", " << Arr[1]<< ", "<< Arr[2] << ", " << cb.closure << ", "<< cb.current <<endl;
			//q=compute_f_francesco(sumofFSR);
			state.closure.push_back(q); //round the closure value to the closest integer
			//n.setParam("/stiffness",0.9); //publish parameter to ros
			it+=1;
		}else{
			//			cout << "NOT contact" << endl;
			state.closure.push_back((int) 0 );
			it=0;
		}
		pub.publish(state);
		ros::spinOnce();
		usleep(microsec_to_sleep);  //dynamic usleeps takes microseconds in input
//		chrono::high_resolution_clock::time_point end = chrono::high_resolution_clock::now();
//		auto duration = chrono::duration_cast<chrono::milliseconds>( end - start ).count();

	}
}






void save_file(const string& name) {
	/*save_file checks if a file exists in a specific folder
	it true create a new file with a incremental number in the name
*/
	string dir = "/home/francesco/ros_ws_handshake/ctrl/1/";
	string filename = dir + name;
	int idx = 0;
	string filetosave;
	bool found = false;
	for (int idx = 0; idx < 10; idx++) {
		if (!fexists(filename + std::to_string(idx) + ".csv")) {
			filetosave = filename + std::to_string(idx) + ".csv";
			break;
		}
	}
	std::ofstream outFile(filetosave);
}
