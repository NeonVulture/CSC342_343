int DotProduct_Index(int a1[], int a2[], int n) {
	
	int sum = 0;

	for (int i = 0; i < n; i++)
		sum += (a1[i] * a2[i]);
	return sum;
}