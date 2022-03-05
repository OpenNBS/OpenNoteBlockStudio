/// @author YellowAfterlife

#include "stdafx.h"
#include <CommCtrl.h>
#include <shlobj.h>
#include <stdint.h>
#include <stdio.h>
#include <algorithm>

#if defined(WIN32)
#define dllx extern "C" __declspec(dllexport)
#elif defined(GNUC)
#define dllx extern "C" __attribute__ ((visibility("default"))) 
#else
#define dllx extern "C"
#endif

#define trace(...) { printf("[window_set_icon:%d] ", __LINE__); printf(__VA_ARGS__); printf("\n"); fflush(stdout); }

class StringConv {
public:
	char* cbuf = NULL;
	size_t cbuf_size = 0;
	WCHAR* wbuf = NULL;
	size_t wbuf_size = 0;
	StringConv() {

	}
	LPCWSTR wget(size_t size) {
		if (wbuf_size < size) {
			if (wbuf != NULL) delete wbuf;
			wbuf = new WCHAR[size];
			wbuf_size = size;
		}
		return wbuf;
	}
	LPCWSTR proc(const char* src, int cp = CP_UTF8) {
		size_t size = MultiByteToWideChar(cp, 0, src, -1, NULL, 0);
		LPCWSTR buf = wget(size);
		MultiByteToWideChar(cp, 0, src, -1, wbuf, size);
		return wbuf;
	}
	char* get(size_t size) {
		if (cbuf_size < size) {
			if (cbuf != NULL) delete cbuf;
			cbuf = new char[size];
			cbuf_size = size;
		}
		return cbuf;
	}
	char* proc(LPCWSTR src, int cp = CP_UTF8) {
		size_t size = WideCharToMultiByte(cp, 0, src, -1, NULL, 0, NULL, NULL);
		char* buf = get(size);
		WideCharToMultiByte(cp, 0, src, -1, buf, size, NULL, NULL);
		return buf;
	}
} utf8;

ITaskbarList3* taskbarList3 = nullptr;

typedef struct {
	BYTE        bWidth;          // Width, in pixels, of the image
	BYTE        bHeight;         // Height, in pixels, of the image
	BYTE        bColorCount;     // Number of colors in image (0 if >=8bpp)
	BYTE        bReserved;       // Reserved ( must be 0)
	WORD        wPlanes;         // Color Planes
	WORD        wBitCount;       // Bits per pixel
	DWORD       dwBytesInRes;    // How many bytes in this resource?
	DWORD       dwImageOffset;   // Where in the file is this image?
} ICONDIRENTRY, * LPICONDIRENTRY;

struct window_set_icon_data {
	int32_t size;
	HRESULT result;
	char info[120];
	inline bool set(HRESULT _result, const char* _info, bool _ret = false) {
		result = _result;
		strncpy(info, _info, sizeof(info));
		return _ret;
	}
	inline bool setLastError(const char* _info, bool _ret = false) {
		auto e = GetLastError();
		result = HRESULT_FROM_WIN32(e);
		strncpy(info, _info, sizeof(info));
		return _ret;
	}
};

struct {
	HICON bigIcon, smallIcon;
	bool isSet = false;
	void check(HWND hwnd) {
		if (!isSet) {
			isSet = true;
			bigIcon = (HICON)SendMessageW(hwnd, WM_SETICON, ICON_BIG, 0);
			smallIcon = (HICON)SendMessageW(hwnd, WM_SETICON, ICON_SMALL, 0);
		}
	}
} defIcon;

struct PreserveIcon {
	HICON icon = NULL;
	void set(HICON val) {
		if (icon) DestroyIcon(icon);
		icon = val;
	}
};
struct PreserveBitmap {
	HBITMAP bitmap = NULL;
	void set(HBITMAP val) {
		if (bitmap) DeleteObject(bitmap);
		bitmap = val;
	}
};

PBYTE PickBestMatchIcon(BYTE* icoData, size_t icoSize, int cx, int cy) {
	auto count = *(WORD*)(icoData + 2 * sizeof(WORD));
	if (count == 0) return NULL;
	auto entries = (ICONDIRENTRY*)(icoData + 3 * sizeof(WORD));

	// direct match?:
	for (int i = 0; i < count; i++) {
		auto& entry = entries[i];
		if (entry.bColorCount > 0) continue;
		if (entry.bWidth == cx && entry.bHeight == cy) return icoData + entry.dwImageOffset;
	}

	// smallest icon that is >=2x?:
	int bw = 0, bh = 0;
	PBYTE bb = NULL;
	for (int i = 0; i < count; i++) {
		auto& entry = entries[i];
		if (entry.bColorCount > 0) continue;
		auto w = entry.bWidth;
		auto h = entry.bHeight;
		if (w < cx * 2 || h < cy * 2) continue;
		if (bb == NULL || (w < bw && h < bh)) {
			bb = icoData + entry.dwImageOffset;
			bw = w;
			bh = h;
		}
	}
	if (bb) return bb;

	// just pick the biggest icon then:
	bw = 0; bh = 0;
	bb = NULL;
	for (int i = 0; i < count; i++) {
		auto& entry = entries[i];
		if (entry.bColorCount > 0) continue;
		auto w = entry.bWidth;
		auto h = entry.bHeight;
		if (w > bw && h > bh) 
		if (w < cx * 2 || h < cy * 2) continue;
		if (bb == NULL || (w < bw && h < bh)) {
			bb = icoData + entry.dwImageOffset;
			bw = w;
			bh = h;
		}
	}
	return bb;
}

HICON LoadIconFromBuffer(BYTE* data, size_t size, int cx, int cy) {
	// https://stackoverflow.com/a/51806326/5578773
	auto icon_count = *(WORD*)(data + 2 * sizeof(WORD));
	auto resBits = PickBestMatchIcon(data, size, cx, cy);
	auto resSize = data + size - resBits;
	// "This parameter is generally set to 0x00030000."
	// https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-createiconfromresourceex
	constexpr auto ver = 0x00030000;
	return CreateIconFromResourceEx(resBits, resSize, TRUE, ver, cx, cy, LR_DEFAULTCOLOR);
}

dllx double window_set_icon_raw(void* _hwnd, uint8_t* data, window_set_icon_data* out) {
	PreserveIcon currSmall, currBig;

	auto cx = GetSystemMetrics(SM_CXSMICON);
	auto cy = GetSystemMetrics(SM_CYSMICON);
	auto nextSmall = LoadIconFromBuffer(data, out->size, cx, cy);
	if (!nextSmall) {
		auto error = GetLastError();
		auto result = HRESULT_FROM_WIN32(error);
		out->set(result, "CreateIconFromResourceEx (small)");
		return false;
	}

	cx = GetSystemMetrics(SM_CXICON);
	cy = GetSystemMetrics(SM_CYICON);
	auto nextBig = LoadIconFromBuffer(data, out->size, cx, cy);
	if (!nextBig) {
		auto error = GetLastError();
		auto result = HRESULT_FROM_WIN32(error);
		out->set(result, "CreateIconFromResourceEx (big)");
		DestroyIcon(nextSmall);
		return false;
	}

	currSmall.set(nextSmall);
	currBig.set(nextBig);
	auto hwnd = (HWND)_hwnd;
	defIcon.check(hwnd);
	SendMessage(hwnd, WM_SETICON, ICON_SMALL, (LPARAM)nextSmall);
	SendMessage(hwnd, WM_SETICON, ICON_BIG, (LPARAM)nextBig);
	out->set(S_OK, "All good!");
	return true;
}

struct window_set_icon_surface_data {
	int32_t width;
	int32_t height;
	int32_t flags;
	HRESULT result;
	char info[112];
	inline bool set(HRESULT _result, const char* _info, bool _ret = false) {
		result = _result;
		strncpy(info, _info, sizeof(info));
		return _ret;
	}
	inline bool setLastError(const char* _info, bool _ret = false) {
		auto e = GetLastError();
		result = HRESULT_FROM_WIN32(e);
		strncpy(info, _info, sizeof(info));
		return _ret;
	}
};
inline HICON CreateIconFromBitmap(HBITMAP bmp) {
	ICONINFO inf{};
	inf.fIcon = true;
	inf.hbmMask = bmp;
	inf.hbmColor = bmp;
	return CreateIconIndirect(&inf);
}
static bool SwapRedBlue_needed = true;
void SwapRedBlue(uint8_t* buf, size_t count) {
	if (!SwapRedBlue_needed) return;
	size_t i = 0;
	const size_t count_nand_3 = count & ~3;
	while (i < count_nand_3) {
		std::swap(buf[i], buf[i + 2]);
		std::swap(buf[i + 4], buf[i + 6]);
		std::swap(buf[i + 8], buf[i + 10]);
		std::swap(buf[i + 12], buf[i + 14]);
		i += 16;
	}
	for (; i < count; i += 4) std::swap(buf[i], buf[i + 2]);
}
dllx double window_set_icon_surface_raw(void* _hwnd, uint8_t* rgba, window_set_icon_surface_data* out) {
	static PreserveIcon lastIcon[2];
	static PreserveBitmap lastBitmap[2];
	//
	SwapRedBlue(rgba, out->width * out->height * 4);
	auto bmp = CreateBitmap(out->width, out->height, 1, 32, rgba);
	if (bmp == NULL) return out->set(E_FAIL, "CreateBitmap");
	//
	auto icon = CreateIconFromBitmap(bmp);
	if (icon == NULL) {
		DeleteObject(bmp);
		return out->setLastError("CreateIconIndirect");
	}
	//
	int big = (out->flags & 1);
	lastIcon[big].set(icon);
	lastBitmap[big].set(bmp);
	//
	WPARAM wp = big ? ICON_BIG : ICON_SMALL;
	SendMessage((HWND)_hwnd, WM_SETICON, wp, (LPARAM)icon);
	return true;
}

dllx double window_reset_icon_raw(void* _hwnd) {
	if (!defIcon.isSet) return true;
	auto hwnd = (HWND)_hwnd;
	SendMessage(hwnd, WM_SETICON, ICON_SMALL, (LPARAM)defIcon.smallIcon);
	SendMessage(hwnd, WM_SETICON, ICON_BIG, (LPARAM)defIcon.bigIcon);
	return true;
}

dllx double window_set_overlay_icon_raw(void* hwnd, uint8_t* data, const char* desc, window_set_icon_data* out) {
	static PreserveIcon lastIcon;

	//
	if (!taskbarList3) {
		auto result = CoCreateInstance(CLSID_TaskbarList, NULL, CLSCTX_ALL, IID_ITaskbarList3, (void**)&taskbarList3);
		if (result != S_OK) {
			out->set(result, "CoCreateInstance(CLSID_TaskbarList)");
			return false;
		}
	}

	auto cx = GetSystemMetrics(SM_CXSMICON);
	auto cy = GetSystemMetrics(SM_CYSMICON);
	auto icon = LoadIconFromBuffer(data, out->size, cx, cy);
	if (!icon) {
		auto error = GetLastError();
		auto result = HRESULT_FROM_WIN32(error);
		out->set(result, "CreateIconFromResourceEx");
		return false;
	}

	//
	auto result = taskbarList3->SetOverlayIcon((HWND)hwnd, icon, utf8.proc(desc));
	if (result != S_OK) {
		DestroyIcon(icon);
		out->set(result, "ITaskbarList3::SetOverlayIcon");
		return false;
	}
	lastIcon.set(icon);
	out->set(S_OK, "All good!");
	return true;
}

dllx double window_set_overlay_icon_surface_raw(void* _hwnd, uint8_t* rgba, const char* desc, window_set_icon_surface_data* out) {
	static PreserveIcon lastIcon;
	static PreserveBitmap lastBitmap;

	//
	if (!taskbarList3) {
		auto result = CoCreateInstance(CLSID_TaskbarList, NULL, CLSCTX_ALL, IID_ITaskbarList3, (void**)&taskbarList3);
		if (result != S_OK) {
			out->set(result, "CoCreateInstance(CLSID_TaskbarList)");
			return false;
		}
	}

	//
	SwapRedBlue(rgba, out->width * out->height * 4);
	auto bmp = CreateBitmap(out->width, out->height, 1, 32, rgba);
	if (bmp == NULL) return out->set(E_FAIL, "CreateBitmap");

	//
	auto icon = CreateIconFromBitmap(bmp);
	if (icon == NULL) {
		DeleteObject(bmp);
		return out->setLastError("CreateIconIndirect");
	}
	
	//
	auto result = taskbarList3->SetOverlayIcon((HWND)_hwnd, icon, utf8.proc(desc));
	if (result != S_OK) {
		DeleteObject(bmp);
		DestroyIcon(icon);
		return out->set(result, "ITaskbarList3::SetOverlayIcon");
	}
	lastIcon.set(icon);
	lastBitmap.set(bmp);
	return out->set(S_OK, "All good!", true);
}

dllx double window_reset_overlay_icon_raw(void* hwnd) {
	if (!taskbarList3) return true;
	taskbarList3->SetOverlayIcon((HWND)hwnd, NULL, L"");
	return true;
}

dllx double window_set_icon_init_raw(double isRGBA) {
	SwapRedBlue_needed = isRGBA > 0.5;
	return true;
}