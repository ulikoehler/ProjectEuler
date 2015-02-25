
#include <iostream>
#include <cmath>
#include <string>
#include <limits>
#include <algorithm>
#include <boost/lexical_cast.hpp>

using namespace std;
using boost::lexical_cast;

bool isCube(uint64_t n) {
    uint64_t root = std::cbrt(n);
    return (root * root * root == n);
}

//http://stackoverflow.com/a/2031708/2597135
void permutation(int k, string &s)  {
    for(int j = 1; j < s.size(); ++j)  {
        std::swap(s[k % (j + 1)], s[j]); 
        k = k / (j + 1);
    }
}

uint64_t factorial(uint64_t x) {
    static const uint64_t f[13] = { 1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800, 39916800, 479001600};
    if ((unsigned)x < (sizeof f/sizeof f[0])) return f[x];
    else return std::numeric_limits<uint64_t>::max(); /* or your favorite undefined behavior */
}

int numCubePermutations(uint64_t n) {
    int numCubes = 0;
    std::string origS = std::to_string(n);
    //Fast serialization of permutations using memcpy
    for (int n = 0; n < factorial(origS.size()); ++n) {
        std::string s = origS; //Without copy we don't get unique permutations
        permutation(n, s);
        //Re-parse as int
        uint64_t val = lexical_cast<uint64_t>(s);
        //cout << val << endl;
        numCubes += isCube(val) ? 1 : 0;
    }
    return numCubes / 2;
}

int main(int argc, char** argv) {
    #pragma omp parallel for
    for (uint64_t i = 0; i < 10000; ++i) {
        if(numCubePermutations(i * i * i) == 5) {
            cout << i << endl;
        }
    }
}