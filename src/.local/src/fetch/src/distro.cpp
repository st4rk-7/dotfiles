#include "distro.hpp"

#include <fstream>
#include <string>

auto GetDistroName() -> std::string {
  std::ifstream file("/etc/os-release");
  std::string line;
  while (std::getline(file, line)) {
    if (line.find("PRETTY_NAME=") != std::string::npos) {
      auto value = line.substr(line.find('=') + 1);
      if (!value.empty() && value.front() == '"') {
        value.erase(0, 1);
      }
      if (!value.empty() && value.back() == '"') {
        value.pop_back();
      }
      return value;
    }
  }
  return "Unknown Distro";
}
