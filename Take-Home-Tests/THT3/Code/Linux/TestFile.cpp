#include <iostream>
#include <time.h>
#include <stdint.h>
#include <stdlib.h>

extern int DotProduct_Index(int a1[], int a2[], int n);
extern int DotProduct_Pointer(int *a1, int *a2, int n);

#define NANO 1000000000L
using namespace std;

const int runs = 1000;
const int arraySize = 1048576;
static int arr1[arraySize];
static int arr2[arraySize];

int main() {
        uint64_t elapsed_time;
        uint64_t PointerSum = 0;
	uint64_t IndexSum = 0;
	int result;
        struct timespec timeStart, timeEnd;

	for (int i = 0; i < arraySize; i++) {
		arr1[i] = i;
		arr2[i] = i/2;
	}

	cout << "Array Size = " << arraySize << endl;
		
	for (int i = 0; i < runs; i++) {
			clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &timeStart); // Begin Timer
        		result = DotProduct_Pointer(&arr1[0], &arr2[0], arraySize);
        		clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &timeEnd); // End Timer
				
			elapsed_time = NANO * (timeEnd.tv_sec - timeStart.tv_sec) + (timeEnd.tv_nsec - timeStart.tv_nsec);
			//cout << "Execution Time = " << elapsed_time << "ns" << endl;
			PointerSum += elapsed_time;
			//cout << PointerSum << endl;
		
	}	

	cout << "Dot Product Pointer :: Average execution time after " << runs <<  " runs = " << PointerSum/runs << " ns" << endl;

	for (int j = 0; j < runs; j++) {
		clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &timeStart); // Begin Timer
		result = DotProduct_Index(arr1, arr2, arraySize);
		clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &timeEnd); // End Timer
                
		elapsed_time = NANO * (timeEnd.tv_sec - timeStart.tv_sec) + (timeEnd.tv_nsec - timeStart.tv_nsec);
                //cout << "Execution Time = " << elapsed_time << "ns" << endl;
                IndexSum += elapsed_time;
                //cout << IndexSum << endl;

	}

	cout << "Dot Product Index :: Average execution time after " << runs << " runs = " << IndexSum/runs << " ns" << endl;
        return 0;

}

