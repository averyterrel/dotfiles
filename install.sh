#!/usr/bin/env bash

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
