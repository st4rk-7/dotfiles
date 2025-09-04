#include "wm.hpp"

#include <X11/Xlib.h>

#include <string>

auto GetWindowManagerName() -> std::string {
  Display* display = XOpenDisplay(nullptr);
  if (display == nullptr) {
    return "Unknown";
  }
  Atom atom = XInternAtom(display, "_NET_SUPPORTING_WM_CHECK", True);
  Atom type = 0;
  int format = 0;
  unsigned long nitems = 0;
  unsigned long bytesAfter = 0;
  unsigned char* data = nullptr;
  if (XGetWindowProperty(display, DefaultRootWindow(display), atom, 0, (~0L),
                         False, AnyPropertyType, &type, &format, &nitems,
                         &bytesAfter, &data) != Success) {
    XCloseDisplay(display);
    return "Unknown";
  }
  if (nitems != 0U) {
    Window wmWindow = *(reinterpret_cast<Window*>(data));
    XFree(data);
    atom = XInternAtom(display, "_NET_WM_NAME", True);
    if (XGetWindowProperty(display, wmWindow, atom, 0, (~0L), False,
                           AnyPropertyType, &type, &format, &nitems,
                           &bytesAfter, &data) == Success) {
      std::string name(reinterpret_cast<char*>(data));
      XFree(data);
      XCloseDisplay(display);
      return name;
    }
  }
  if (data != nullptr) {
    XFree(data);
  }
  XCloseDisplay(display);
  return "Unknown";
}
