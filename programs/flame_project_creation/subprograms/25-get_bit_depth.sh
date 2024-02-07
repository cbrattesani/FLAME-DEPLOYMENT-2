
# ========================================================================== #
# This section gathers bit depth information to create a new flame project.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Function to validate user input for bit depth
validate_depth_choice() {
    local choice=$1
    if [[ $choice =~ ^[1-5]$ ]]; then
        return 0  # Valid choice
    else
        echo -e "  Invalid input. Please enter a number between 1 and 5."
        echo -e "\n$separator\n"
        return 1  # Invalid choice
    fi
}

# -------------------------------------------------------------------------- #

while true; do
    # Prompt user for project bit depth
    echo -e "  Select Project Bit Depth:\n"
    echo -e "  1. 16-bit fp"
    echo -e "  2. 32-bit fp"
    echo -e "  3. 12-bit"
    echo -e "  4. 10-bit"
    echo -e "  5. 8-bit"
    echo -e "\n$separator\n"

    # Read user's depth_choice
    read -p "  Enter your choice (1 - 5): " depth_choice
    echo -e "\n$separator\n"

    # Validate user's depth_choice
    if validate_depth_choice "$depth_choice"; then
        break  # Break out of the loop if the choice is valid
    fi
done

# Handle user's depth_choice
case $depth_choice in
    1)
        proj_color_depth="16-bit fp"
        ;;
    2)
        proj_color_depth="32-bit fp"
        ;;
    3)
        proj_color_depth="12-bit"
        ;;
    4)
        proj_color_depth="10-bit"
        ;;
    5)
        proj_color_depth="8-bit"
        ;;
esac

# Display the selected project bit depth
echo -e "  Selected Project Bit Depth: $proj_color_depth"
# Further actions with the selected project bit depth can be added here
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #
