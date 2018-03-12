/* Using the CUDA framework for the array addition in the GPU*/
/* Allocate the memory in device, declare the addition function in device, pass the array from host to device,
Call the device function, Copy the results to the host, Free the device memory*/

#include <stdio.h>

#define N  10

__global__ void add(int *a, int *b, int *c){
	int tid=blockIdx.x; // Used to get the index of the thread kernel
	if(tid<N)
		c[tid]=a[tid]+b[tid];
}

int main()
{
	int a[N],b[N],c[N];
	int *devA,*devB,*devC;
	
	// Enter the values in the arrays
	for(int i=0;i<N;i++)
	{
		a[i]=-i;
		b[i]=2*i;
	}
	
	//Allocate the memory in the device
	
	cudaMalloc(&devA,N*sizeof(int));
	cudaMalloc(&devB,N*sizeof(int));
	cudaMalloc(&devC,N*sizeof(int));
		
	//Copy the values to the device memory
	
	cudaMemcpy(devA , a, N*sizeof(int), cudaMemcpyHostToDevice);
	cudaMemcpy(devB , b, N*sizeof(int), cudaMemcpyHostToDevice);
	
	//Call the device function
	
	add<<<N,1>>>(devA,devB,devC);
	
	//Copy the results into the host memory location
	
	cudaMemcpy(c,devC,N*sizeof(int),cudaMemcpyDeviceToHost);
	
	for(int i=0;i<N;i++)
	{
		printf("A + B = C: %d + %d = %d \n" ,a[i],b[i],c[i]);
	}
	
	//Free the memory alloted in the device
	
	cudaFree(devA); 
	cudaFree(devB); 
	cudaFree(devC);
	
	return 0;
}