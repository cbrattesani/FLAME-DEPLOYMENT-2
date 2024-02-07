
# ========================================================================== #
# This section gathers color science infor to create a new flame project.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Function to validate user input for color science
validate_color_choice() {
    local choice=$1
    if [[ $choice =~ ^[1-9]|1[0-1]$ ]]; then
        return 0  # Valid choice
    else
        echo -e "  Invalid input. Please enter a number between 1 and 11."
        echo -e "\n$separator\n"
        return 1  # Invalid choice
    fi
}

# -------------------------------------------------------------------------- #

while true; do
    # Display menu for project color science
    echo -e "  Select Project Color Policy:\n"
    echo -e "   1. Autodesk ACES 1.0"
    echo -e "   2. Autodesk ACES 1.1"
    echo -e "   3. Autodesk Legacy Workflow"
    echo -e "   4. Autodesk Simple Linear Workflow"
    echo -e "   5. ARRI Alexa LogC V3 (K1S1)"
    echo -e "   6. ARRI Alexa LogC v4"
    echo -e "   7. R3D Log3g10 Red Wide Gamut RGB (Do Not Use)"
    echo -e "   8. Sony Cine+ 709"
    echo -e "   9. Sony Low Contrast 709"
    echo -e "  10. Sony Low Contrast 709 Type A (Alexa Emulation)"
    echo -e "  11. Sony SLog2 709"
    echo -e "\n$separator\n"

    # Read user's choice
    read -p "  Enter your choice (1 to 11): " color_choice
    echo -e "\n$separator\n"

    # Validate user's choice
    if validate_color_choice "$color_choice"; then
        break  # Break out of the loop if the choice is valid
    fi
done

# Handle user's choice
case $color_choice in
    1)
        proj_color_science="adsk_aces_1"
        ;;
    2)
        proj_color_science="adsk_aces_11"
        ;;
    3)
        proj_color_science="adsk_legacy"
        ;;
    4)
        proj_color_science="adsk_linear"
        ;;
    5)
        proj_color_science="arri_logc_v3"
        ;;
    6)
        proj_color_science="arri_logc_v4"
        ;;
    7)
        proj_color_science="aces_11_sdr"
        ;;
    8)
        proj_color_science="sony_cine_709"
        ;;
    9)
        proj_color_science="sony_lc_709"
        ;;
    10)
        proj_color_science="sony_lca_709"
        ;;
    11)
        proj_color_science="sony_slog2_709"
        ;;
esac

# Display the selected project color science
echo -e "  Selected Project Color Policy: $proj_color_science"
# Further actions with the selected project color science can be added here
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #
