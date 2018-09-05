/*
 * ctrl_5.cpp
 *
 *  Created on: Aug 31, 2018
 *      Author: Francesco Vigni
 *
 * ctrl_5.cpp implements a closed loop controller for human-robot
 * handshake. The F_r is a mixing the C1 with a spring dynamic reaction
 * and C2 with a constant q. here we have the high value of C2
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
string save_file(const string& name);

int main(int argc, char **argv)
{
	if (argc < 3) {
		// Tell the user how to run the program
		show_usage(argv[0]);
		/* "Usage messages" are a conventional way of telling the user
		 * how to run a program if they enter the command incorrectly.
		 */
		return 1;
	}
	int q0;float p[3];

	if(*argv[1]=='1'){
		q0=8500;
		p[0]=0.02538; p[1]=-3.471; p[2]=177.5; p[3]=0;
	}else if(*argv[1]=='2'){
		q0=9000;
		p[0] = 0.02432; p[1] =-2.862; p[2]= 157.2; p[3]=0;
	}else if(*argv[1]=='3'){
		q0=10000;
		p[0]=0.0232; p[1]=-2.1; p[2]=92.15; p[3]=0;
	}else if(*argv[1]=='4'){
		q0=11000;
		p[0]=0.019435; p[1]=-3.7; p[2]=270.15; p[3]=0;
	}else if(*argv[1]=='5'){
		q0=12000;
		p[0]=0.007035; p[1]=-0.1305; p[2]=55.82; p[3]=0;

		// AVG(q0) = 10100
	}else {
		show_usage(argv[0]);
		cout << "handsize code out of bounds" << std::endl;
		return 1;
	}
	string id_participant = argv[2];

	cout <<"Participant ID = "<< id_participant <<"\ninitial position set to " << q0 <<endl;
	int q;
	ros::init(argc, argv, "ctrl_1");
	ros::NodeHandle n;
	ros::Rate loop_rate(1000); //Hz
	ros::Subscriber sub = n.subscribe("sensors_FSR", 100, arrayCallback_sensors);
	ros::Publisher pub = n.advertise<qb_interface::handRef>("/qb_class/hand_ref", 100);
	qb_interface::handPos state;
	ROS_INFO("Controller by function node started");
	ros::param::set("/stiffness",1.0);

	// Saving file routine
	callbacks cb;
	ros::Subscriber sub1 = n.subscribe("/qb_class/hand_ref",100, &callbacks::cb_closure, &cb);
	ros::Subscriber sub2 = n.subscribe("/qb_class/hand_measurement",100, &callbacks::cb_current, &cb);
	ros::Subscriber sub3 = n.subscribe("sensors_FSR", 100, arrayCallback_sensors);

	// Saving File routine
	string name = "id_" + id_participant + "_n";
	//save_file checks if a file exists in a specific folder
	//it true create a new file with a incremental number in the name

	std::ofstream outFile;
	cout << "saving file: " << save_file(name) << endl;
	outFile.open(save_file(name));

	bool last_contact= false ;
	while (ros::ok())
	{
		bool in_contact= check_contact();
		state.closure.clear();
		if(in_contact){

			//  in contact


			q=compute_f_with_q0(q0,p);
			outFile << Arr[0] << ", " << Arr[1]<< ", "<< Arr[2] << ", " << cb.closure << ", "<< cb.current <<endl;

			state.closure.push_back(q); //round the closure value to the closest integer

		}else{
			// not in contact
			if(last_contact!=in_contact)
			outFile << 0 << ", " << 0<< ", "<< 0 << ", " << 0 << ", "<< 0 <<endl;
			state.closure.push_back((int) 0 );
		}
		pub.publish(state);
		ros::spinOnce();
		//		usleep(1000);  //dynamic usleeps takes microseconds in input
		loop_rate.sleep();
		last_contact=in_contact;
	}
	outFile.close();

}





string save_file(const string& name) {
	/*save_file checks if a file exists in a specific folder
	it true create a new file with a incremental number in the name
	 */
	string dir = "/home/francesco/ros_ws_handshake/ctrl/5/";
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
	return filetosave;
}




