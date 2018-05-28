#include <qb_force_control.h>
#include "ros/ros.h"
#include <std_msgs/Float32MultiArray.h>
#include <std_msgs/Float32.h>

float Arr[6];

//vector for storing last values of current
std::vector<int> history;


//Funzione computeAVG NON UTILIZZATA
/*
std_msgs::Float32 computeAvg(std::vector<int> v){
	std_msgs::Float32 avg;
	avg.data=0;
	for (std::vector<int>::iterator it = v.begin() ; it != v.end(); ++it){
		avg.data += *it;
	}
	avg.data=avg.data/size;
	return avg;
}
*/


class Listener{
    public:
        int current;
        void currCallback(const qb_interface::handPos::Ptr& msg);
};


void Listener::currCallback(const qb_interface::handPos::Ptr& msg){
    current = msg->closure[2];
    //ROS_DEBUG("current %d",current);
    ROS_DEBUG_STREAM("closure: " << msg->closure[0] << "\tcurrent:" << current);
    }


//ottieni letture sensori in array da arduino
void arrayCallback(const std_msgs::Float32MultiArray::ConstPtr& array)
{	int i = 0;
	// print all the remaining numbers
	for(std::vector<float>::const_iterator it = array->data.begin(); it != array->data.end(); ++it)
	{
		Arr[i] = *it;
		i++;
	}
}

//funzione che ritorna la media mobile degli ultimi [window] valori

std_msgs::Float32 historyAvg(int current,int window){
std_msgs::Float32 avg;
avg.data=0;
int	sum=0;
int rise_up_threshold=50;
if(history.size()<window){
	history.push_back(current); //current from listener::current
}else{
history.erase (history.begin());  //erase first element
history.push_back(current); //current from listener::current
}
cout <<"history size: "<< history.size() << endl;
cout << "[";
for (int i=0; i<=history.size()-1; i++){
    if(history[i]<rise_up_threshold){
    //std::fill(history.begin(), history.end(), 0);  //se anche solo un elemento della corrente e` inferiore alla soglia, saturo tutto il vettore a zero
    history[i]=0; //se il valore di corrente e` inferiore alla soglia lo saturo a zero
    sum=0;
    }else{
    sum+=history[i];
    }
    cout <<history[i] << ' ';
		}//esegui media del vettore
cout <<"]" << endl;
avg.data =sum/history.size();
return avg;
}


int main(int argc, char **argv)
{

cout << "filter node started" << endl;
	//state.closure.clear();
	ros::init(argc, argv, "FSR_current_control");
	ros::NodeHandle n;
    //read 6 arduino sensors
	ros::Subscriber sub = n.subscribe("sensors_FSR", 100, arrayCallback); 
    
    Listener listen;
    
    //read current from qb_interface
    ros::Subscriber sub_current = n.subscribe("/qb_class/hand_measurement", 100, &Listener::currCallback, &listen);
    
    //publish closure value
	ros::Publisher pub = n.advertise<qb_interface::handRef>("/qb_class/hand_ref", 100);
    
    //publish average 
	ros::Publisher pub1 = n.advertise<std_msgs::Float32>("smooth",100);

	qb_interface::handPos state;
	//ros::Rate loop_rate(10); //10hz

	float value_past=0;
	int history_window=10;
	while (ros::ok())
	{
		std_msgs::Float32 media;
		std_msgs::Float32MultiArray array;
	

		state.closure.clear();
		media.data = 0;
        
		float value=0;
		ros::spinOnce();
		//start arduino values
		int limit = 19000;
		for(int j = 0; j < 6; j++){
			//			printf("%f, ", Arr[j]);
			value+=Arr[j];
		}
		value=value*1.9*3/2;
		//		printf("\n");
		if( value > limit){
			value = limit;
		}
		//value va sostituito con il valore di corrente
		media = historyAvg(listen.current, history_window);

		pub1.publish(media);
        cout <<"current \t"<< listen.current << endl;
        cout <<"average \t"<< media.data<< endl;
		//	cout << media << endl;

		state.closure.push_back((int)value);
		//n.setParam("/stiffness",0.9); //publish parameter to ros
		//pub.publish(state);
		usleep(50000);  //dynamic usleeps takes microseconds in input

		//end arduino values

	}
}
