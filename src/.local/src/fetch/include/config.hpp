#pragma once

#include <string>
#include <unordered_map>
#include <vector>

// Color escape sequences
inline const std::string kCol1 = "\x1B[31m"; // red
inline const std::string kCol2 = "\x1B[32m"; // green
inline const std::string kCol3 = "\x1B[33m"; // yellow
inline const std::string kCol4 = "\x1B[34m"; // blue
inline const std::string kCol5 = "\x1B[35m"; // magenta
inline const std::string kCol6 = "\x1B[36m"; // cyan
inline const std::string kCol7 = "\x1B[37m"; // white
inline const std::string kCol8 = "\x1B[90m"; // gray
inline const std::string kColR = "\x1B[0m";  // reset

constexpr bool kDefaultShowAscii = true; // true or false
constexpr int kDefaultLayout = 1; // 1 or 2

// ASCII art color
inline const std::string kAsciiColor = kCol8;

// ASCII ARTS
// clang-format off
inline const std::unordered_map<std::string, std::vector<std::string>> kAsciiArts = {
  {"meatboy", {
  "⠀⠀⣀⣀⣤⣤⣦⣶⢶⣶⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⡄⠀⠀⠀⠀⠀",
  "⠀⠀⣿⣿⣿⠿⣿⣿⣾⣿⣿⣿⣿⣿⣿⠟⠛⠛⢿⣿⡇⠀⠀⠀⠀⠀",
  "⠀⠀⣿⡟⠡⠂⠀⢹⣿⣿⣿⣿⣿⣿⡇⠘⠁⠀⠀⣿⡇⠀⢠⣄⠀⠀",
  "⠀⠀⢸⣗⢴⣶⣷⣷⣿⣿⣿⣿⣿⣿⣷⣤⣤⣤⣴⣿⣗⣄⣼⣷⣶⡄",
  "⠀⢀⣾⣿⡅⠐⣶⣦⣶⠀⢰⣶⣴⣦⣦⣶⠴⠀⢠⣿⣿⣿⣿⣼⣿⡇",
  "⢀⣾⣿⣿⣷⣬⡛⠷⣿⣿⣿⣿⣿⣿⣿⠿⠿⣠⣿⣿⣿⣿⣿⠿⠛⠃",
  "⢸⣿⣿⣿⣿⣿⣿⣿⣶⣦⣭⣭⣥⣭⣵⣶⣿⣿⣿⣿⣟⠉⠀⠀⠀⠀",
  "⠀⠙⠇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀",
  "⠀⠀⠀⣿⣿⣿⣿⣿⣛⠛⠛⠛⠛⠛⢛⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀",
  " ⠀⠀⠿⣿⣿⣿⠿⠿⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⠿⠇⠀⠀⠀⠀ ",
  "                          ",
  }},
  {"hydra", {
  "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
  "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
  "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
  "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
  "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
  "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
  "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
  " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
  " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
  "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
  "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣤⣾⡿⠃     ",
  }},
  {"isaac", {
  "        ⣀⣤⣴⣶⣶⣶⣶⣶⣶⣤⣄⣀       ",
  "    ⢀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄    ",
  "  ⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣆  ",
  " ⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧ ",
  " ⣾⣿⡿⠟⡋⠉⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠉⠉⠙⠻⣿⣿⣇",
  "⢠⣿⡏⢰⣿⣿⡇  ⢸⣿⣿⣿⠿⠿⣿⣿⣿⠁⣾⣿⣷  ⠘⣿⣿",
  "⠸⣿⣇⠈⠉⠉  ⢀⣼⡿⠋    ⠙⢿⣄⠙⠛⠁  ⢠⣿⣿",
  " ⢿⣿⡇   ⣶⣿⣿⢁⣤⣤⣤⣤⣤⣤ ⣿⣷   ⠈⢹⣿⡟",
  " ⠈⢿⡗  ⢸⣿⣿⣿⣶⣶⣶⣶⣶⣶⣶⣶⣿⣿    ⢸⡟ ",
  "   ⠳⡀ ⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿    ⠌  ",
  "      ⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤      ",
  "       ⠉⠙⠻⠿⠿⣿⣿⣿⣿⠿⠿⠛⠉       ",
  }},
  {"knight", {
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⡀⠀",
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠠⣀⣠⣶⣶⣶⣿⣿⣿⣟⠟⠉⠁⠀⠉",
  "⠀⠀⠀⠀⠀⠀⢀⣀⣤⣵⣶⣿⣿⣿⡿⣟⢿⡝⠙⠀⠤⠤⣤⣤⡶⠂",
  "⠀⠀⠀⢀⠴⣪⣾⣿⣿⣿⣿⣿⢿⡿⠃⢿⢸⣧⡍⠭⣭⣿⡿⠋⠀⠀",
  "⠀⠀⢀⣵⣿⣿⣿⣿⣿⢯⠟⡵⠋ ⢠⢾⣿⣿⣿⡤⣼⢏⣠⣀⠀⠀",
  "⠀⣰⣻⣿⣿⣿⣾⣿⣧⢡⣘⠁⠀⠀⠘⣄⣻⣿⣿⣷⣿⣿⡿⠍⠁⠀",
  "⡇⡿⣿⣿⣿⡿⣿⡻⣿⣜⢄⣶⣤⣀⠀⠀⠀⠈⠛⢻⣟⠫⠉⠀⠀⠀",
  "⠣⡻⣌⡻⠿⣿⣮⣽⣿⣶⣾⣿⣳⠶⠖⠬⠍⠃⠀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠈⠀⠉⠉⠙⠛⠛⠒⠓⠒⠀⠀⠀⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  }},
  {"raven", {
  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⠀",
  "⠀⠀⢤⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠠⣢⢃⡶",
  "⠀⠀⣼⡶⠘⠀⠀⠀⠀⠀⠀⠀⠀⢠⢀⠄⠀⠢⢼⣿⣿⣷⡅",
  "⠠⠀⣿⣿⢇⡀⠀⠀⠀⠀⠀⠀⡤⠀⢈⢄⡇⣪⣿⣿⣿⢟⡠",
  "⠀⢸⣿⣿⣟⡐⠁⣀⠀⠀⠀⣠⡤⡨⣳⣿⣿⣿⣿⣿⣿⡿⠃",
  "⠀⠀⢻⣿⣿⣇⠸⠠⠀⠀⣠⣿⣷⣿⣿⣿⣿⣿⣿⣿⠿⠁⠁",
  "⠀⠀⠀⠙⠿⣿⣮⣄⣄⣈⣾⣿⣿⣿⣿⣿⣿⣿⣿⢏⠹⠄⠃",
  "⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⠻⠀⠙⠠⠀⠀",
  "⠀⠀⠀⠈⢤⡟⠻⣿⣿⣿⣿⣿⣿⡿⠿⡻⠳⠁⠀⠁⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠁⠙⢿⣿⣿⣿⣿⣶⣾⣷⣶⣦⣤⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⢀⣤⡶⡖⠿⣿⣿⣿⣿⡿⠏⠝⠁⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠈⠀⠡⠔⠀⠈⠙⠙⠑⠂⠀⠀⠀⠀⠀⠀⠀⠀",
  }},
  {"yggdrasil", {
  "⠀⠀⠀⠀⠀⠀⢀⢀⠀⣄⢂⣀⣂⣤⣀⢀⢀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⣄⣰⣝⣉⣙⢱⣞⠜⡖⣌⣌⣁⣻⣠⣀⠀⠀⠀⠀",
  "⠀⠀⢔⢽⣊⣂⣇⡒⠮⢻⣇⠲⢍⣿⢟⣒⣰⣠⣑⡔⣀⠀⠀",
  "⠀⠹⡸⢙⣕⡐⢂⠍⣩⡻⣿⣆⣾⠟⣉⢣⠪⠲⡰⡋⣢⢆⠀",
  "⠀⣪⡹⣵⢦⠽⡓⠶⠶⣧⣹⣿⣏⣴⠶⠛⠟⠽⢛⣒⢮⡙⠀",
  "⠸⢋⢪⠑⢩⠈⠀⠀⠀⠈⣿⣿⣿⠁⠀⠀⠘⢠⠈⠆⢎⢱⠁",
  "⠀⠻⡕⡲⡈⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠆⠄⠁",
  "⠀⠀⠀⠇⠀⠀⠀⠀⠀⣰⣿⣿⣿⣤⡀⠀⠀⠀⠀⠌⠘⠀⠀",
  "⠀⠀⠀⢱⠒⡶⡶⢖⣫⡿⢻⠿⡟⢿⣍⡱⢖⠶⠒⡆⠀⠀⠀",
  "⠀⠀⠀⠀⠁⠬⡃⠴⣇⣴⠏⠖⠙⣦⣸⠦⡼⠣⠉⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠈⠁⠑⠢⠧⠭⠼⠵⠋⠊⠁⠀⠀⠀⠀⠀⠀",
  }},
  {"galaxy", {
  "        ⠀⠀⢀⣀⣀⡀⠒⠒⠦⣄⡀⠀⠀⠀⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⢀⣤⣶⡾⠿⠿⠿⠿⣿⣿⣶⣦⣄⠙⠷⣤⡀⠀⠀⠀⠀",
  "⠀⠀⠀⣠⡾⠛⠉⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⣿⣷⣄⠘⢿⡄⠀⠀⠀",
  "⠀⢀⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠐⠂⠠⢄⡀⠈⢿⣿⣧⠈⢿⡄⠀⠀",
  "⢀⠏⠀⠀⠀⢀⠄⣀⣴⣾⠿⠛⠛⠛⠷⣦⡙⢦⠀⢻⣿⡆⠘⡇⠀⠀",
  "⠀⠀⠀⠀⡐⢁⣴⡿⠋⢀⠠⣠⠤⠒⠲⡜⣧⢸⠄⢸⣿⡇⠀⡇⠀⠀",
  "⠀⠀⠀⡼⠀⣾⡿⠁⣠⢃⡞⢁⢔⣆⠔⣰⠏⡼⠀⣸⣿⠃⢸⠃⠀⠀",
  "⠀⠀⢰⡇⢸⣿⡇⠀⡇⢸⡇⣇⣀⣠⠔⠫⠊⠀⣰⣿⠏⡠⠃⠀⠀⢀",
  "⠀⠀⢸⡇⠸⣿⣷⠀⢳⡈⢿⣦⣀⣀⣀⣠⣴⣾⠟⠁⠀⠀⠀⠀⢀⡎",
  "⠀⠀⠘⣷⠀⢻⣿⣧⠀⠙⠢⠌⢉⣛⠛⠋⠉⠀⠀⠀⠀⠀⠀⣠⠎⠀",
  "⠀⠀⠀⠹⣧⡀⠻⣿⣷⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡾⠃⠀⠀",
  "⠀⠀⠀⠀⠈⠻⣤⡈⠻⢿⣿⣷⣦⣤⣤⣤⣤⣤⣴⡾⠛⠉⠀⠀⠀⠀",
  "⠀⠀⠀⠀⠀⠀⠈⠙⠶⢤⣈⣉⠛⠛⠛⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀",
  }}
};
// clang-format on

// Leave empty for random ASCII art
// Acceptable Values: meatboy, hydra, isaac, knight, raven, yggdrasil, galaxy
inline constexpr const char* kAsciiArtChoice = "";

// ASCII art padding
inline constexpr int kAsciiLeftPadding = 2;
inline constexpr int kAsciiRightPadding = 2;

// Number of spaces between color icons in the color info string
inline constexpr int kColSpace = 3;

// The symbols used for each color block in the color info string
inline const std::string kColChar1 = "󰮯";
inline const std::string kColChar2 = "󰊠";
inline const std::string kColChar3 = "󰊠";
inline const std::string kColChar4 = "󰊠";
inline const std::string kColChar5 = "󰊠";
inline const std::string kColChar6 = "󰊠";
inline const std::string kColChar7 = "󰊠";
inline const std::string kColChar8 = "󰊠";

// Icons used in the info box
// clang-format off
inline const std::string kIconUser =   "";
inline const std::string kIconDistro = "";
inline const std::string kIconKernel = "";
inline const std::string kIconWM =     "󰙀";
inline const std::string kIconRAM =    "";
inline const std::string kIconTerm =   "";
inline const std::string kIconUptime = "󰔚";
inline const std::string kIconPkgs =   "";
// clang-format on
