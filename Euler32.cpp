#include <algorithm>
#include <iostream>
#include <vector>
#include <numeric>
#include <set>

using namespace std;


template<typename It>
size_t toNumber(It begin, It end) {
    size_t n = 0;
    while(begin != end) {
        n *= 10;
        n += *begin;
        begin++;
    }
    return n;
}

int main() {
  vector<int> digits = {1, 2, 3, 4, 5, 6, 7, 8, 9};
  set<size_t> products; // Unique products
        
  // Iterate over permutationss
  do {
    // Iterate split points
    for (size_t i = 1; i < 9; i++)
    {
        for (size_t j = i + 1; j < 9; j++)
        {
            auto astart = digits.begin();
            auto aend = digits.begin() + i;

            auto bstart = digits.begin() + i;
            auto bend = digits.begin() + j;

            auto cstart  = digits.begin() + j;
            size_t a = toNumber(astart, aend);
            size_t b = toNumber(bstart, bend);
            size_t c = toNumber(cstart, digits.end());
            if(a * b == c) {
                cout << a << ", " << b << "," << c << endl;
                products.insert(c);
            }
        }
    }
  } while (std::next_permutation(digits.begin(), digits.end()));
  cout << accumulate(products.begin(), products.end(), 0) << endl;
}