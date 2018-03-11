/*In order to choose the correct device for computation it is essential to compare the computation
capability of the devices available  and choose the best. It is a boring task to print out all the device properties and compare
hence CUDA C provides the methods for the same.
cudaChooseDevice is used to select the best of the devices after comparing with the desired properties-- here 1.3 computation capability
cudaSetDevice is used to set the best device. */

#include<stdio.h>

int main()
{
	cudaDeviceProp prop;
	int dev;
	int count;
	cudaGetDeviceCount(&count);
	printf("Number of devices available: %d\n",count); // Gives the number of devices available to choose from
	cudaGetDevice(&dev);
	printf("ID of the current device: %d\n", dev); //ID of the current device under check
	memset(&prop,0,sizeof(cudaDeviceProp));
	prop.major=1;
	prop.minor=3;
	cudaChooseDevice(&dev,&prop); 
	printf("ID of CUDA Device Closest to 1.3 Computation Capability: %d\n", dev); // ID of the best selected device
	cudaGetDeviceProperties(&prop,dev);
	printf("Computation Capability of the selected device: %d.%d\n", prop.major,prop.minor); // Gives the compute capability of the device
	cudaSetDevice(dev);
}