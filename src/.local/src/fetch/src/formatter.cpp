#include "formatter.hpp"

#include <clocale>
#include <cwchar>
#include <vector>

auto GetDisplayWidth(const std::string& input) -> int {
  std::setlocale(LC_ALL, "");

  std::mbstate_t state{};
  const char* src = input.c_str();
  size_t len = input.length();
  std::vector<wchar_t> wstr(len);

  size_t converted = std::mbsrtowcs(wstr.data(), &src, len, &state);
  if (converted == static_cast<std::size_t>(-1)) {
    return input.size();
  }
  return wcswidth(wstr.data(), converted);
}

auto Pad(const std::string& str, size_t total_length) -> std::string {
  if (str.size() >= total_length) {
    return str;
  }
  return str + std::string(total_length - str.size(), ' ');
}

auto PadC(const std::string& str, size_t total_length) -> std::string {
  if (str.size() >= total_length) {
    return str;
  }
  size_t total_padding = total_length - str.size();
  size_t left_padding = total_padding / 2;
  size_t right_padding = total_padding - left_padding;

  return std::string(left_padding, ' ') + str + std::string(right_padding, ' ');
}
