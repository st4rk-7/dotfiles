#include "uptime.hpp"

#include <fstream>
#include <iostream>
#include <sstream>
#include <string>

auto GetUptimeAsString() -> std::string {
  std::ifstream uptimeFile("/proc/uptime");
  if (!uptimeFile.is_open()) {
    return "Error reading uptime";
  }
  double uptime{};
  uptimeFile >> uptime;
  int days = uptime / 86400;
  int hours = static_cast<int>(uptime) % 86400 / 3600;
  int mins = static_cast<int>(uptime) % 3600 / 60;
  int secs = static_cast<int>(uptime) % 60;
  std::stringstream ss;
  if (days > 0) {
    ss << days << " day" << (days > 1 ? "s " : " ");
  }
  if (hours > 0) {
    ss << hours << " hour" << (hours > 1 ? "s " : " ");
  }
  if (mins > 0) {
    ss << mins << " min" << (mins > 1 ? "s" : "");
  }
  if (days == 0 && hours == 0 && mins == 0) {
    ss << secs << " sec";
  }
  return ss.str();
}
