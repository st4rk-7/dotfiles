#include "printer.hpp"

#include <algorithm>
#include <iostream>

#include "config.hpp"
#include "formatter.hpp"

void PrintSideBySide(std::vector<std::string> ascii_art,
                     std::vector<std::string> info) {
  size_t ascii_lines = ascii_art.size();
  size_t info_lines = info.size();

  if (ascii_lines < info_lines) {
    size_t diff = info_lines - ascii_lines;
    size_t pad_bottom = diff / 2;
    size_t pad_top = diff - pad_bottom;

    int ascii_width = ascii_art.empty() ? 0 : GetDisplayWidth(ascii_art[0]);
    std::string padding_line(ascii_width, ' ');
    ascii_art.insert(ascii_art.begin(), pad_top, padding_line);
    ascii_art.insert(ascii_art.end(), pad_bottom, padding_line);
  }

  if (info_lines < ascii_lines) {
    size_t diff = ascii_lines - info_lines;
    size_t pad_bottom = diff / 2;
    size_t pad_top = diff - pad_bottom;

    int max_info_width = 0;
    for (const auto& line : info) {
      max_info_width = std::max(max_info_width, GetDisplayWidth(line));
    }

    std::string padding_line(max_info_width, ' ');
    info.insert(info.begin(), pad_top, padding_line);
    info.insert(info.end(), pad_bottom, padding_line);
  }

  std::string left_space(kAsciiLeftPadding, ' ');
  std::string right_space(kAsciiRightPadding, ' ');

  for (auto& line : ascii_art) {
    std::string original_line = line;

    line.clear();
    line += kAsciiColor;
    line += left_space;
    line += original_line;
    line += right_space;
    line += kColR;
  }

  for (size_t i = 0; i < std::max(ascii_art.size(), info.size()); ++i) {
    if (i < ascii_art.size()) {
      std::cout << ascii_art[i];
    }
    if (i < info.size()) {
      std::cout << info[i];
    }
    std::cout << '\n';
  }
}
