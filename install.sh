#!/usr/bin/env bash

# System detection
if [ -f /Cygwin.bat ]; then
	SYSTEM=Cygwin
fi

# Make sure necessary directories exist
if [ ! -d /usr/local/bin ]; then
	mkdir -p /usr/local/bin
fi

# Link files
if [ -w "$HOME" ]; then
	for i in .config .gnupg .local .vim .xinitrc; do
		ln -s $(pwd)/$i "$HOME"/$i
	done
fi
if [ -w /etc/skel ]; then
	for i in .config .gnupg .local .vim .xinitrc; do
		ln -s $(pwd)/$i /etc/skel/$i
	done
fi

if [ "$SYSTEM" = "Cygwin" ]; then
	PRG_FLS="/cygdrive/c/Program Files"
	PRG_FLS_X86="/cygdrive/c/Program Files (x86)"
	ln -s /cygdrive/c/Windows/notepad /usr/local/bin/notepad
	for i in $(find "$PRG_FLS/VcXsrv" -maxdepth 1 -type f -executable -name \*.exe ! -name \*uninstall\*); do
		ln -s "$i" "/usr/local/bin/$(basename "$i" | sed 's/[.]exe$//')"
	done
	for i in $(find "$PRG_FLS/qemu" -maxdepth 1 -type f -executable -name qemu-\* ! -name \*uninstall\*); do
		ln -s "$i" "/usr/local/bin/$(basename "$i" | sed 's/[.]exe$//')"
	done
fi
