#!/bin/sh

WINDOW=$(xdotool getactivewindow)

xdotool search --name "firefox" windowfocus --sync
xdotool search --name "firefox" key --clearmodifiers "CTRL+R"

xdotool windowactivate --sync ${WINDOW}
