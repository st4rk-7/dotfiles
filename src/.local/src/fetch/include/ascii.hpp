#pragma once

#include <string>
#include <vector>

auto GetAsciiArt(const std::string& name = "") -> std::vector<std::string>;
auto ListAsciiArtNames() -> std::vector<std::string>;
