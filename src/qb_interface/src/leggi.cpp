#include <iostream>
#include <fstream>
#include <vector>
using namespace std;
int main()
{
	ifstream in("model1.csv");
	vector<float> vv;
	while(!in.eof())
	{
		float v;
		in>>v;
		vv.push_back(v);
	}
	const int n=vv.size();
	int v[n];
	for(int i=0;i<n;i++)
		v[i]=vv[i];
	for(int i=0;i<n;i++)
		cout<<"v["<<i<<"]="<<v[i]<<endl;
	in.close();
	return 0;
}