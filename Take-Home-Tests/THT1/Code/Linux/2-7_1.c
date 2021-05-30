void main() {
	static int f = 0;
	static int g = 50;
	static int h = 40;
	static int i = 30;
	static int j = 20;
	
	if (i == j)
		f = g + h;
	else
		f = g - h;
}