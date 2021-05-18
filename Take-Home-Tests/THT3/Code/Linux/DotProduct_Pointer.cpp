int DotProduct_Pointer(int *a1, int *a2, int n) {
	
	int *a, *b;
	int sum = 0;

	for (a = &a1[0], b = &a2[0]; a < &a1[n]; a++, b++)
		sum += ((*a) * (*b));
	return sum;
}