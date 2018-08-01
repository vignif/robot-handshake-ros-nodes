#include <iostream>     // cout, endl
#include <fstream>      // fstream
#include <vector>
#include <string>
#include <algorithm>    // copy
#include <iterator>     // ostream_operator
#include <boost/tokenizer.hpp>

using namespace std;
using namespace boost;

int main()
{
	FILE *fid = fopen("model1.csv","r");
	vector<int> v1,v2;
	while(!feof(fid))
	{
		int val1,val2;
		fscanf(fid,"%d,%d",&val1,&val2);
		v1.push_back(val1);
		v2.push_back(val2);
	}
	const int n = v1.size();
	int m[n][2];
	for(int i=0;i<n;i++)
	{
		m[i][0]=v1[i];
		m[i][1]=v2[i];
	}

	for(int i=0;i<n;i++)
		cout<<m[i][0]<<" "<<m[i][1]<<endl;
	return 0;

}
