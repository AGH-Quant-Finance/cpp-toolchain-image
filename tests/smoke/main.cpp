#include <array>
#include <numeric>
#include <span>

int main() {
    const std::array values{1, 2, 3, 4};
    const std::span<const int> view{values};
    return std::accumulate(view.begin(), view.end(), 0) == 10 ? 0 : 1;
}
