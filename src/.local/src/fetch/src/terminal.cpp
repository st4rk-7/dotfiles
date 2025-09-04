#include "terminal.hpp"

#include <string>

auto GetEnvVar(const char* var) -> std::string {
  const char* val = std::getenv(var);
  return (val != nullptr) ? std::string(val) : "";
}

auto GetTerminalEmulatorName() -> std::string {
  std::string term = GetEnvVar("TERM");
  if (term.find("rxvt-unicode") != std::string::npos) {
    return "urxvt";
  }
  if (term.find("linux") != std::string::npos) {
    return "Linux Console";
  }
  if (term.find("screen") != std::string::npos) {
    return "Screen";
  }
  if (term.find("tmux") != std::string::npos) {
    return "tmux";
  }
  if (term.find("st-256color") != std::string::npos) {
    return "st";
  }
  if (term.find("alacritty") != std::string::npos) {
    return "Alacritty";
  }
  if (term.find("foot") != std::string::npos) {
    return "foot";
  }
  if (term.find("xterm-kitty") != std::string::npos) {
    return "kitty";
  }
  if (term.find("wezterm") != std::string::npos) {
    return "WezTerm";
  }
  if (term.find("gnome") != std::string::npos) {
    return "Gnome Terminal";
  }
  if (term.find("konsole") != std::string::npos) {
    return "Konsole";
  }
  if (term.find("hyper") != std::string::npos) {
    return "Hyper";
  }
  if (term.find("xterm-256color") != std::string::npos) {
    return "xterm";
  }

  return !term.empty() ? term : "Unknown";
}
