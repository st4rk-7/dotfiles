#include "ram.hpp"

#include <cstdint>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <sstream>
#include <string>

auto GetRamUsage() -> std::string {
  std::ifstream file("/proc/meminfo");
  std::string line;
  uint64_t memTotal{};
  uint64_t memAvailable{};
  uint64_t memFree{};
  uint64_t buffers{};
  uint64_t cached{};
  uint64_t sReclaimable{};
  uint64_t shmem{};
  while (std::getline(file, line)) {
    std::istringstream iss(line);
    std::string key;
    uint64_t value = 0;
    iss >> key >> value;
    if (key == "MemTotal:") {
      memTotal = value;
    } else if (key == "MemAvailable:") {
      memAvailable = value;
    } else if (key == "MemFree:") {
      memFree = value;
    } else if (key == "Buffers:") {
      buffers = value;
    } else if (key == "Cached:") {
      cached = value;
    } else if (key == "SReclaimable:") {
      sReclaimable = value;
    } else if (key == "Shmem:") {
      shmem = value;
    }
  }
  if (memAvailable == 0) {
    memAvailable = memFree + buffers + cached + sReclaimable - shmem;
  }

  uint64_t used = memTotal - memAvailable;
  std::stringstream ss;
  ss << std::fixed << std::setprecision(0) << static_cast<double>(used) / 1024
     << " MiB / " << static_cast<double>(memTotal) / 1024 << " MiB";
  return ss.str();
}
