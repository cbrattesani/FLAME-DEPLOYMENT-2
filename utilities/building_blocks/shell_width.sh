#!/bin/bash

# -------------------------------------------------------------------------- #

# These commands get the width of a terminal
terminal_width=$(tput cols)

# Print a message indicating the new width
echo "Shell width is $terminal_width columns."

# This doesn't work
# konsole --geometry 80x60

konsole &
sleep 0.5 # Wait for Konsole to open

wid=$(xdotool search --sync --onlyvisible --class konsole | tail -n1)
xdotool windowactivate "$wid" && xdotool windowsize --sync --usehints "$wid" 80 60
Save the script to a file, for example, open_new_window.sh. Make the script executable using the command chmod +x open_new_window.sh. Finally, run the script using ./open_new_window.sh.

This updated script opens a new Konsole window using konsole & and waits for a small period of time (sleep 0.5) to ensure that Konsole is fully opened. Then, it uses xdotool to find the window ID of the Konsole window, activates the window with xdotool windowactivate, and resizes it to the desired width and height with xdotool windowsize.

Please ensure that you have xdotool installed on your system. You can install it using the package manager of your Linux distribution (e.g., apt, yum, or dnf).
