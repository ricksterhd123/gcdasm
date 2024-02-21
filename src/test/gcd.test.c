#include <assert.h>

extern int gcd(int a, int b);

int main() {
    assert(gcd(50120, 120) == 40);
    return 0;
}
