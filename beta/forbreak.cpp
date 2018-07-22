#include <iostream>  
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
using namespace std;  
  

int main()  
{  
char A="CIAO come stai?";


int last_value=0;
while(1)
{
int limit = 5;
    // An example of a standard for loop
while(last_value==0)
{  
    for (int i = 1; i < 10; i++)  
    {  
        cout << i << '\n';  
        if (i >= limit)\
    {
	last_value=i;  
            break;  
    } //end if
  }//end for int i
usleep(1000000);
}//end while(last_value) 
}//end while(1)

  
} //end main
