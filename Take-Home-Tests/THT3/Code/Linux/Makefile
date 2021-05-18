all: performanceTest performanceTestOP1 performanceTestOP2 performanceTestOP3

clean:
	rm -f performanceTest performanceTestOP1 performanceTestOP2 performanceTestOP3

performanceTest: TestFile.cpp DotProduct_Index.cpp DotProduct_Pointer.cpp 
	g++ -O0 TestFile.cpp DotProduct_Index.cpp DotProduct_Pointer.cpp -o performanceTest
performanceTestOP1: TestFile.cpp DotProduct_Index.cpp DotProduct_Pointer.cpp
	g++ -O1 TestFile.cpp DotProduct_Index.cpp DotProduct_Pointer.cpp -o performanceTestOP1
performanceTestOP2: TestFile.cpp DotProduct_Index.cpp DotProduct_Pointer.cpp
	g++ -O2 TestFile.cpp DotProduct_Index.cpp DotProduct_Pointer.cpp -o performanceTestOP2
performanceTestOP3: TestFile.cpp DotProduct_Index.cpp DotProduct_Pointer.cpp
	g++ -O3 TestFile.cpp DotProduct_Index.cpp DotProduct_Pointer.cpp -o performanceTestOP3
