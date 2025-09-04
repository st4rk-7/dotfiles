#include "userhost.hpp"

#include <unistd.h>

#include <array>
#include <cstring>
#include <iostream>

auto GetUsername() -> std::string {
  char *username = getlogin();
  if (username != nullptr) {
    return {username};
  }
  std::cerr << "Error getting username: " << strerror(errno) << '\n';
  return "";
}

auto GetHostname() -> std::string {
  std::array<char, 256> hostname{};
  if (gethostname(hostname.data(), hostname.size()) == 0) {
    return {hostname.data()};
  }
  std::cerr << "Error getting hostname: " << strerror(errno) << '\n';
  return "";
}
