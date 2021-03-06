#include <cmath>
#include <cstdint>
#include <iostream>
#include <vector>

using namespace std;
const double logOf2 = log(2);

inline double t(double k) {
  // wolfram alpha: solve 4^t=2^t+k for t:
  return log(0.5 * (sqrt(4 * k + 1) + 1)) / logOf2;
}

inline bool isnat(double v) { return abs(v - round(v)) < 1e-6; }

void Ps() {
  size_t num = 0, denom = 0;
  for (size_t i = 2; i; i++) {
    double tv = t(i);
    // 4^tv == 2^tv + some int but 2^tv is much smaller
    bool isvalid = isnat(pow(2.0, tv));
    bool isperfect = isvalid && isnat(tv);
    num += isperfect ? 1 : 0;
    denom += isvalid ? 1 : 0;
    /*cout << "P(" << i << ") = " << num << "/" << denom << " = "
         << ((double)num / (double)denom) << endl;*/
    double p = ((double)num / (double)denom);
    if (p < (1.0 / 12345.0)) {
      cout << "Result: " << i << endl;
      break;
    }
    if (i % 10000000 == 0) {
      cout << i << " - " << (1.0 / p) << endl;
    }
  }
}

int main() {
  Ps();
}