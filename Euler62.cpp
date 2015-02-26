#include <iostream>
#include <cmath>
#include <string>
#include <cassert>
#include <vector>
#include <map>
#include <limits>
#include <string>
#include <cstring>
#include <algorithm>

using namespace std;

const int limit = 10000;

//cubeTable[n] = n*n*n
static uint64_t cubeTable[limit];

/**
 * For every n, cubesByLength[n] stores a list of cubes
 * with length n when represented as decimal string.
 */
static std::vector<std::string> cubesByLength[32];


/**
 * Check if two strings contain exactly the same digits.
 * Permutations are considered equal.
 * Precondition: Both strings contain only digits and are of length
 */
bool isPermutationOf(const char* a, const char* b, size_t n) {
    //Counts how many times digit n (0..9) occurs in the string
    uint32_t countA[10];
    memset(countA, 0, sizeof(uint32_t) * 10);
    uint32_t countB[10];
    memset(countB, 0, sizeof(uint32_t) * 10);
    for (int i = 0; i < n; ++i) {
        countA[a[i] - '0']++;
        countB[b[i] - '0']++;
    }
    return memcmp(countA, countB, sizeof(uint32_t) * 10) == 0;
}

int main(int argc, char** argv) {
    //Initialize cube map
    for (uint64_t i = 0; i < limit; ++i) {
        uint64_t cube = i * i * i;
        std::string cubeStr = std::to_string(cube);
        cubesByLength[cubeStr.size()].push_back(cubeStr);
    }

    //#pragma omp parallel for
    for (uint64_t i = 0; i < limit; ++i) {
        uint64_t cube = i * i * i;
        const std::string cubeStr = std::to_string(cube);
        /**
         * Only strings of the same size are candidates for permuted cubes.
         * We already initialized a size-sorted list of cubes.
         * We only check how many of the known cubes are permutations of the given number.
         */
        std::vector<std::string>& cubes = cubesByLength[cubeStr.size()];
        uint32_t count = count_if(cubes.begin(), cubes.end(), [&](const std::string& refCube) {
            assert(refCube.size() == cubeStr.size());
            return isPermutationOf(cubeStr.data(), refCube.data(), cubeStr.size());
        });
        //Print only the solution
        if(count == 5) {
            cout << cube << " (" << i << " ** 3)" << endl;
            return 0;
        }
    }
}