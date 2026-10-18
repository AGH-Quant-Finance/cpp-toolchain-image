#include <array>
#include <cstdlib>
#include <numeric>
#include <span>

int main() {
    const std::array values{1, 2, 3, 4};
    const std::span<const int> view{values};
    const auto sum = std::accumulate(view.begin(), view.end(), 0);
    if (sum != 10) {
        return EXIT_FAILURE;
    }
    return EXIT_SUCCESS;
}
