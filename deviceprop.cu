/* It is essential for the programmer to choose the correct GPU device from a list of GPU devices 
available to perform the calculations very efficiently, 
For Example: To run the double precision applications devices with compute capacity of more than 1.3 are desired.
The following program utilizes the cudaDeviceProp structure to get the info on the same*/

// Note: There are lot of properties available with the cudaDeviceProp struct

#include <stdio.h>
#include <iostream>

using namespace std;

int main()
{
	cudaDeviceProp prop;
	
	int count;
	cudaGetDeviceCount(&count); //Gives the number of devices
	std::cout<<count<<std::endl;
	for(int i=0;i<count;i++)
	{
		cudaGetDeviceProperties(&prop,i);
		printf( "Name: %s\n", prop.name ); // Gives the name of the device
		printf("Computation Capability: %d.%d\n", prop.major,prop.minor); // Givees the compute capability of the device
	}
	
}	