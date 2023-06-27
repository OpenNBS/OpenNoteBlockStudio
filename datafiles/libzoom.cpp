/*

 MIT License

 Copyright © 2023 Samuel Venable

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.

*/

#include <cstdint>
#if defined(_WIN32)
#include <windows.h>
#define EXPORTED_FUNCTION extern "C" __declspec(dllexport)
#else
#define EXPORTED_FUNCTION extern "C" __attribute__((visibility("default")))
#if (defined(__APPLE__) && defined(__MACH__))
#include <AppKit/AppKit.h>
#else
#include <X11/Xlib.h>
#endif
#endif

EXPORTED_FUNCTION void window_zoom(void *window) {
  #if defined(_WIN32)
  ShowWindow((HWND)window, SW_MAXIMIZE);
  #elif (defined(__APPLE__) && defined(__MACH__))
  [(NSWindow *)window zoom:nil];
  #else
  Display *display = XOpenDisplay(nullptr);
  XClientMessageEvent ev;
  Atom state, h, v;
  state = XInternAtom(display, "_NET_WM_STATE", false);
  if (state == None) return;
  h = XInternAtom(display, "_NET_WM_STATE_MAXIMIZED_HORZ", false);
  v = XInternAtom(display, "_NET_WM_STATE_MAXIMIZED_VERT", false);
  ev.type = ClientMessage;
  ev.window = (Window)(std::uintptr_t)window;
  ev.message_type = state;
  ev.format = 32;
  ev.data.l[0] = 1;
  ev.data.l[1] = h;
  ev.data.l[2] = v;
  XSendEvent(display, RootWindow(display, 0), false, SubstructureRedirectMask | SubstructureNotifyMask, (XEvent *)&ev);
  XCloseDisplay(display);
  #endif
}
