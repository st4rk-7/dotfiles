#include "kernel.hpp"

#include <fstream>
#include <string>

auto GetKernelName() -> std::string {
  std::ifstream file("/proc/version");
  std::string line;
  if (std::getline(file, line)) {
    auto start = line.find("version ");
    auto end = line.find(" (");
    if (start != std::string::npos && end != std::string::npos) {
      return line.substr(start + 8, end - start - 8);
    }
  }
  return "Unknown Kernel";
}
