#!/bin/bash
#!/usr/bin/bash

# ========================================================================== #
# This program creates a popup list to choose an intermediate option.
# (Requires zenity: https://help.gnome.org/users/zenity/stable/intro.html.en)
# ========================================================================== #

# Define an associative array to map choices to numeric values
declare -A choice_values=(
    ["  Uncompressed"]=2
    ["  Uncompressed / RAW"]=0
    ["  Packed"]=3
    ["  Packed / RAW"]=4
    ["  Apple ProRes 4444"]=65540
    ["  Apple ProRes 4444 / RAW"]=65796
    ["  Apple ProRes 4444 XQ"]=65541
    ["  Apple ProRes 4444 XQ / RAW"]=65797
    ["  Apple ProRes 422"]=65538
    ["  Apple ProRes 422 / RAW"]=65794
    ["  Apple ProRes 422 HQ"]=65539
    ["  Apple ProRes 422 HQ / RAW"]=65795
    ["  Apple ProRes 422 LT"]=65537
    ["  Apple ProRes 422 LT / RAW"]=65793
    ["  Apple ProRes 422 Proxy"]=65536
    ["  Apple ProRes 422 Proxy / RAW"]=65792
    ["  DNxHR/DNxHD 444"]=640
    ["  DNxHR/DNxHD 444 / RAW"]=512
    ["  DNxHR/DNxHD HQ"]=641
    ["  DNxHR/DNxHD HQ / RAW"]=513
    ["  DNxHR/DNxHD LB"]=643
    ["  DNxHR/DNxHD LB / RAW"]=515
    ["  DNxHR/DNxHD SQ"]=642
    ["  DNxHR/DNxHD SQ / RAW"]=514
)

# Define the order of choices, including separators
choice_order=(
    "# ======================= #"
    "  Uncompressed"
    "  Uncompressed / RAW"
    "# ======================= #"
    "  Packed"
    "  Packed / RAW"
    "# ======================= #"
    "  Apple ProRes 4444"
    "  Apple ProRes 4444 / RAW"
    "  Apple ProRes 4444 XQ"
    "  Apple ProRes 4444 XQ / RAW"
    "# ======================= #"
    "  Apple ProRes 422"
    "  Apple ProRes 422 / RAW"
    "  Apple ProRes 422 HQ"
    "  Apple ProRes 422 HQ / RAW"
    "  Apple ProRes 422 LT"
    "  Apple ProRes 422 LT / RAW"
    "  Apple ProRes 422 Proxy"
    "  Apple ProRes 422 Proxy / RAW"
    "# ======================= #"
    "  DNxHR/DNxHD 444"
    "  DNxHR/DNxHD 444 / RAW"
    "  DNxHR/DNxHD HQ"
    "  DNxHR/DNxHD HQ / RAW"
    "  DNxHR/DNxHD LB"
    "  DNxHR/DNxHD LB / RAW"
    "  DNxHR/DNxHD SQ"
    "  DNxHR/DNxHD SQ / RAW"
    "# ======================= #"
)

# Initialize choice to an empty string
choice=""

# Keep displaying the Zenity pop-up menu until a valid choice is made or the user cancels
while true; do
    # Create a list of choices in the specified order
    ordered_choices=()
    for item in "${choice_order[@]}"; do
        ordered_choices+=("$item")
    done

    choice=$(zenity \
    --list \
    --title="Select a Format" \
    --text="Choose a format:" \
    --column="Formats" "${ordered_choices[@]}" \
    --width=360 \
    --height=960)

    # Check if the user cancels the dialog
    if [ $? -ne 0 ]; then
        echo "User canceled the dialog."
        exit 1
    fi

    # Check if the choice is empty or starts with "Separator"
    if [[ "$choice" == "" || "$choice" == "#"* ]]; then
        zenity --error --text="Invalid choice. Please select a valid option."
    else
        break
    fi
done

# Set the 'intermediate_option' variable based on the user's choice
intermediate_option="${choice_values[$choice]}"

# Process the valid choice
echo "You chose: $choice (Value: $intermediate_option)"
