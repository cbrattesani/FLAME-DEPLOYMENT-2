
# ========================================================================== #
# This section gathers framerate information to create a new flame project.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Function to validate user input
validate_choice() {
    local choice=$1
    if [[ $choice =~ ^[1-7]$ ]]; then
        return 0  # Valid choice
    else
        echo -e "  Invalid input. Please enter a number between 1 and 7."
        echo -e "\n$separator\n"
        return 1  # Invalid choice
    fi
}

# -------------------------------------------------------------------------- #

while true; do
    # Display menu for project frame rate options
    echo -e "  Select Project Frame Rate:\n"
    echo -e "  1. 23.976 fps"
    echo -e "  2. 24 fps"
    echo -e "  3. 25 fps"
    echo -e "  4. 29.97 fps"
    echo -e "  5. 30 fps"
    echo -e "  6. 50 fps"
    echo -e "  7. 60 fps"
    echo -e "\n$separator\n"

    # Read user's choice
    read -p "  Enter your choice (1 to 7): " choice
    echo -e "\n$separator\n"

    # Validate user's choice
    if validate_choice "$choice"; then
        break  # Break out of the loop if the choice is valid
    fi
done

# Handle user's choice
case $choice in
    1)
        proj_fcm="23.976 fps"
        ;;
    2)
        proj_fcm="24 fps"
        ;;
    3)
        proj_fcm="25 fps"
        ;;
    4)
        proj_fcm="29.97 fps"
        ;;
    5)
        proj_fcm="30 fps"
        ;;
    6)
        proj_fcm="50 fps"
        ;;
    7)
        proj_fcm="60 fps"
        ;;
esac

# Display the selected project frame rate
echo -e "  Selected Project Frame Rate: $proj_fcm"
# Further actions with the selected project frame rate can be added here
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #
