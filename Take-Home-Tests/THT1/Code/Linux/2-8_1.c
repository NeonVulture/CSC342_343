static int f = 0;
static int g = 50;
static int h = 40;
static int i = 30;
static int j = 20;

int myadd() {
	int t0 = g + h;
	int t1 = i + j;
	int v0 = t0 - t1;
	return v0;
}

void main() {
	f = myadd();
}