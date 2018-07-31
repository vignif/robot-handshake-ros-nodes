#include <std_msgs/Float32.h>
#include <fstream>
#include <iostream>
#include <cstdlib>

static float value=0;
float Arr[6];
bool hand_detected=false;
float sensors_threshold=10;
std::vector<int> history;
class callbacks{
public:
	float closure;
	float current;
	float smooth_current;
	void cb_closure(const qb_interface::handRef::Ptr& msg){
	closure=msg->closure[0];
	}
	void cb_current(const qb_interface::handPos::Ptr& msg){
	current=msg->closure[2];
	}
	void cb_smooth_current(const std_msgs::Float32::Ptr& msg){
	smooth_current= (float)msg->data;
	}
};

// read FSR sensor value from arduino and store them in a vector
void arrayCallback_sensors(const std_msgs::Float32MultiArray::ConstPtr& array)
{
	int i = 0;
	// print all the remaining numbers
	for(std::vector<float>::const_iterator it = array->data.begin(); it != array->data.end(); ++it)
	{
		Arr[i] = *it;
		i++;
	}
}

//minSensor =0
//maxSensor =5

float scale_closure(float value, float factor, int minSensor, int maxSensor) {
	int limit = 19000; //hand limit closure input
	for (int j = minSensor; j <= maxSensor; j++) {
		//printf("%f, ", Arr[j]);
		value += Arr[j];
	}
	value = value * factor;
	//printf("\n");
	if (value > limit) {
		value = limit;
	}
	return value;
}



void update_hand_status(){
	if( Arr[0]<sensors_threshold && Arr[1]<sensors_threshold){
		ROS_DEBUG_STREAM("hand_NOT_detected");
		hand_detected=false;
	}else{
		ROS_DEBUG_STREAM("hand_detected");
		//n.setParam("/stiffness",0.2); //publish parameter to ros
		hand_detected=true;
	}
}



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


float scale_controller1(float sumofFSR, std::vector<float> model, int pos[], int minSensor, int maxSensor) {
	int limit = 19000; //hand limit closure input
	int output;
	for (int j = minSensor; j <= maxSensor; j++) {
		//printf("%f, ", Arr[j]);
		sumofFSR += Arr[j];
	}
//load csv file and return value in which the sumofFSR index is found

	output=model;


//	value = value * ;
	//printf("\n");
	if (output > limit) {
		output = limit;
	}
	return output;
}

