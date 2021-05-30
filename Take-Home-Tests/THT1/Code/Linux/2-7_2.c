void main() {
	static int i = 8;
	static int k = 20;
	static int save[100];

	save[8] = 20;
	save[9] = 20;

	while (save[i] == k)
		i++;

	k = 0;
}