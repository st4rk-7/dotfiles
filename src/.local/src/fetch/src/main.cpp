#include <iostream>
#include <string>
#include <vector>

#include "ascii.hpp"
#include "colors.hpp"
#include "config.hpp"
#include "distro.hpp"
#include "formatter.hpp"
#include "kernel.hpp"
#include "pkgcount.hpp"
#include "printer.hpp"
#include "ram.hpp"
#include "terminal.hpp"
#include "uptime.hpp"
#include "userhost.hpp"
#include "wm.hpp"

auto main(int argc, char* argv[]) -> int {
  auto show_ascii = kDefaultShowAscii;
  auto layout = kDefaultLayout;

  for (int i = 1; i < argc; ++i) {
    std::string arg = argv[i];

    if (arg == "-h" || arg == "--help") {
      std::cout << "Usage:\n"
                << "  -h, --help           Show this help message\n"
                << "  -l, --layout [1|2]   Choose layout style\n"
                << "  -n, --no-ascii       Disable ASCII art\n";
      return 0;
    }
    if (arg == "-n" || arg == "--no-ascii") {
      show_ascii = false;
    } else if (arg == "-l") {
      if (i + 1 < argc) {
        std::string value = argv[++i];
        if (value == "1") {
          layout = 1;
        } else if (value == "2") {
          layout = 2;
        } else {
          std::cerr << "Unknown layout value: " << value << "\n";
          return 1;
        }
      } else {
        std::cerr << "Missing value after -l\n";
        return 1;
      }
    } else if (arg.rfind("--layout=", 0) == 0) {
      std::string value = arg.substr(9);
      if (value == "1") {
        layout = 1;
      } else if (value == "2") {
        layout = 2;
      } else {
        std::cerr << "Unknown layout value: " << value << "\n";
        return 1;
      }
    } else {
      std::cerr << "Unknown argument: " << arg << "\n";
      return 1;
    }
  }

  std::vector<std::string> ascii_art;
  if (show_ascii) {
    ascii_art = std::string(kAsciiArtChoice).empty()
                    ? GetAsciiArt()
                    : GetAsciiArt(kAsciiArtChoice);
  }
  // clang-format off
  std::vector<std::string> info1 = {
    kCol8 + " ╭─────┬─────────────────────────────╮"   + kColR,
    kCol8 + " │  " +kCol4+ kIconUser   +kCol8+ "  │  " + kCol2 + Pad(GetUsername() + "@" + GetHostname(), 27) + kCol8 + "│" + kColR,
    kCol8 + " │  " +kCol4+ kIconDistro +kCol8+ "  │  " + kColR + Pad(GetDistroName(), 27)                     + kCol8 + "│" + kColR,
    kCol8 + " │  " +kCol4+ kIconKernel +kCol8+ "  │  " + kColR + Pad(GetKernelName(), 27)                     + kCol8 + "│" + kColR,
    kCol8 + " │  " +kCol4+ kIconWM     +kCol8+ "  │  " + kColR + Pad(GetWindowManagerName(), 27)              + kCol8 + "│" + kColR,
    kCol8 + " │  " +kCol4+ kIconRAM    +kCol8+ "  │  " + kColR + Pad(GetRamUsage(), 27)                       + kCol8 + "│" + kColR,
    kCol8 + " │  " +kCol4+ kIconTerm   +kCol8+ "  │  " + kColR + Pad(GetTerminalEmulatorName(), 27)           + kCol8 + "│" + kColR,
    kCol8 + " │  " +kCol4+ kIconUptime +kCol8+ "  │  " + kColR + Pad(GetUptimeAsString(), 27)                 + kCol8 + "│" + kColR,
    kCol8 + " │  " +kCol4+ kIconPkgs   +kCol8+ "  │  " + kColR + Pad(GetPacmanPackageCount()+" (pacman)", 27) + kCol8 + "│" + kColR,
    kCol8 + " ├─────┴─────────────────────────────┤"   + kColR,
    kCol8 + " │   "    +  kColorsInfo  + kCol8 + "│"   + kColR,
    kCol8 + " ╰───────────────────────────────────╯"   + kColR
  };
  // clang-format on

  // clang-format off
  std::vector<std::string> info2 = {
    kCol8 + " ╭─────╮╭─────────────────────────────╮" + kColR,
    kCol8 + " │  " +kCol4+ kIconUser   +kCol8+ "  ││" + kCol2 + PadC(GetUsername() + "@" + GetHostname(), 29) + kCol8 + "│" + kColR,
    kCol8 + " │  " +kCol4+ kIconDistro +kCol8+ "  ││" + kColR + PadC(GetDistroName(), 29)                     + kCol8 + "│" + kColR,
    kCol8 + " │  " +kCol4+ kIconKernel +kCol8+ "  ││" + kColR + PadC(GetKernelName(), 29)                     + kCol8 + "│" + kColR,
    kCol8 + " │  " +kCol4+ kIconWM     +kCol8+ "  ││" + kColR + PadC(GetWindowManagerName(), 29)              + kCol8 + "│" + kColR,
    kCol8 + " │  " +kCol4+ kIconRAM    +kCol8+ "  ││" + kColR + PadC(GetRamUsage(), 29)                       + kCol8 + "│" + kColR,
    kCol8 + " │  " +kCol4+ kIconTerm   +kCol8+ "  ││" + kColR + PadC(GetTerminalEmulatorName(), 29)           + kCol8 + "│" + kColR,
    kCol8 + " │  " +kCol4+ kIconUptime +kCol8+ "  ││" + kColR + PadC(GetUptimeAsString(), 29)                 + kCol8 + "│" + kColR,
    kCol8 + " │  " +kCol4+ kIconPkgs   +kCol8+ "  ││" + kColR + PadC(GetPacmanPackageCount()+" (pacman)", 29) + kCol8 + "│" + kColR,
    kCol8 + " ╰─────╯╰─────────────────────────────╯" + kColR,
  };
  // clang-format on

  const auto& info = (layout == 1) ? info1 : info2;

  if (show_ascii) {
    PrintSideBySide(ascii_art, info);
  } else {
    for (const auto& line : info) {
      std::cout << line << "\n";
    }
  }

  return 0;
}
