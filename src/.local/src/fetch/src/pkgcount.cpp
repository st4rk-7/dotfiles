#include "pkgcount.hpp"

#include <algorithm>
#include <filesystem>
#include <string>

auto GetPacmanPackageCount() -> std::string {
  constexpr const char* kPacmanDir = "/var/lib/pacman/local/";
  try {
    auto count =
        std::count_if(std::filesystem::directory_iterator(kPacmanDir),
                      std::filesystem::directory_iterator(),
                      [](const auto& entry) { return entry.is_directory(); });
    return std::to_string(count);
  } catch (...) {
    return "Pacman Error";
  }
}
