//Compile with: g++ -o Euler80 Euler80.cpp -lgmp -lgmpxx -std=c++11
#include <gmpxx.h>
#include <set>
#include <cassert>
#include <iostream>

using namespace std;

uint32_t digitSum(const char* d, size_t n) {
    uint32_t sum = 0;
    for (int i = 0; i < n; ++i) {
        assert(d[i] >= '0');
        assert(d[i] <= '9');
        sum += d[i] - '0';
    }
    return sum;
}


int main (void) {
    std::set<int> squares = {1,4,9,16,25,36,49,64,81,100};
    uint32_t overallSum = 0;
    for (int i = 1; i <= 100; ++i) {
        //Skip non irrationals
       if(squares.count(i)) {
            continue;
       }
       mpf_class f(i, 100000);
       mpf_class fsq(sqrt(f));

       //Serialize decimal digits
       mp_exp_t exp;
       std::string s = fsq.get_str(exp, 10, 105);
       s = s.substr(0, 100);
       if(i == 2) {
            cout << digitSum(s.data(), s.size()) << endl;
       }
       cout << i << ": " << s.size() << endl;

       overallSum += digitSum(s.data(), s.size());
    }
    cout << overallSum << endl;
    return 0;
}