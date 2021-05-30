#include <stdio.h>

int factorial(int);

int main() {
        int N_fact = factorial(5);
}

int factorial (int n) {
        if (n == 1) return 1;
        return (n * factorial(n - 1));
}
