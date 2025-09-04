#pragma once

#include <string>

auto GetDisplayWidth(const std::string& input) -> int;
auto Pad(const std::string& str, size_t total_length) -> std::string;
auto PadC(const std::string& str, size_t total_length) -> std::string;
