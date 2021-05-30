void main() {
	static int h = 20;
	static int A[400];
	A[300] = 13;
	A[300] = h + A[300];
}