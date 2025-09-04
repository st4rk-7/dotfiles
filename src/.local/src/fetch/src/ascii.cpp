#include "ascii.hpp"

#include <ctime>
#include <random>
#include <unordered_map>

#include "config.hpp"

auto ListAsciiArtNames() -> std::vector<std::string> {
  std::vector<std::string> names;
  names.reserve(kAsciiArts.size());
  for (const auto& [name, _] : kAsciiArts) {
    names.push_back(name);
  }
  return names;
}

auto GetAsciiArt(const std::string& name) -> std::vector<std::string> {
  if (!name.empty()) {
    auto it = kAsciiArts.find(name);
    if (it != kAsciiArts.end()) {
      return it->second;
    }
    return {"[Unknown ASCII Art: " + name + "]"};
  }

  // Random selection
  static std::mt19937 rng(static_cast<unsigned>(std::time(nullptr)));
  auto keys = ListAsciiArtNames();
  std::uniform_int_distribution<size_t> dist(0, keys.size() - 1);
  return kAsciiArts.at(keys[dist(rng)]);
}
