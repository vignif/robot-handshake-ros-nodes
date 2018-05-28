#include <qb_force_control.h>
#include "ros/ros.h"
#include <std_msgs/Float32MultiArray.h>
float Arr[6];
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


int main(int argc, char **argv)
{

ros::init(argc, argv, "FSRtoClosure");
ros::NodeHandle n;
ros::Subscriber sub = n.subscribe("sensors_FSR", 100, arrayCallback);  
ros::Publisher pub = n.advertise<qb_interface::handRef>("/qb_class/hand_ref", 100);
qb_interface::handPos state;
cout << "[INFO] FSRtoClosure node started" << endl;
while (ros::ok())
	{
    float value=0;
    state.closure.clear();
    std_msgs::Float32MultiArray array;
    ros::spinOnce();
        
//start arduino values

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
state.closure.push_back((int)value); //round the closure value to the closest integer
//n.setParam("/stiffness",0.9); //publish parameter to ros
pub.publish(state);
usleep(10000);  //dynamic usleeps takes microseconds in input
    }
}
