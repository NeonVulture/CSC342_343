int gcd(int a, int b) {
    if (b == 0)
        return a;
    else
        gcd(b, a%b);
}

int main() {
    int gcd_res = gcd(6,22);
    return 0;
}
