#include <qb_force_control.h>
#include "ros/ros.h"

int main(int argc, char **argv)
{

	ros::init(argc, argv, "Open_close");
	ros::NodeHandle n;
 	ros::Publisher pub = n.advertise<qb_interface::handRef>("/qb_class/hand_ref", 100);

    qb_interface::handPos state;
    cout << "[INFO] OpenClose node started" << endl;

	while (ros::ok())
	{

    float value=0;


// start step closure test
// k stepfactor. for k=1 the closure will go at 1000 steps. 1000/2000/3000 .... 
// increasing k means execute more steps so for k=10. 1000/1100/1200 ...

    int k=10;
    int upbound =15;
    for (int j =-upbound*k; j <= upbound*k ; j++){
    value=1000/k;
    state.closure.clear();
    state.closure.push_back(abs(value*j));
    pub.publish(state);
    usleep(20000);
    }
    
     ros::spinOnce();
   
}
}
