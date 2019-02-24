#!/usr/bin/env bash

# file: ~/.xinitrc

LAUNCH_WM="i3"

command -v "${LAUNCH_WM}" >/dev/null 2>&1 && 
	$LAUNCH_WM

