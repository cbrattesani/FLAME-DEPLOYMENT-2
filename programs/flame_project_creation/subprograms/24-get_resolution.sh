
# ========================================================================== #
# This section gathers resolution information to create a new flame project.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Set variable defaults
proj_res_h=1920
proj_res_v=1080
proj_res=""
proj_aspect_ratio=1.77778

# -------------------------------------------------------------------------- #

ProxyWidthHint="0.5" # proxy_width_hint="0.500000"
# ProxyWidth=$proj_res_h * $ProxyWidthHint # proxy_width="960"
ProxyWidth=$(( proj_res_h * 1 / 2 )) # proxy_width="960"
ProxyMinFrameSize=$ProxyWidth # proxy_min_frame_size="960"
ProxyAbove8bits="false" # proxy_above_8bits="false"
ProxyQuality="lanczos" # proxy_quality="lanczos"
ProxyRegenState="0" # proxy_regen_state="0"
ProxyDepthMode="SAME_AS_HIRES" # proxy_depth_mode="SAME_AS_HIRES"
ProxyDepth="$proj_color_science" # proxy_depth="$proj_color_science"

# -------------------------------------------------------------------------- #

# Display menu for project resolution options
echo -e "  Select Project Resolution:\n"
echo -e "  1. 1920 x 1080 HD"
echo -e "  2. 3840 x 2160 UHD"
echo -e "  3. Other"
echo -e "\n$separator\n"

# Read user's ResolutionChoice
read -p "  Enter your ResolutionChoice (1, 2, or 3): " ResolutionChoice
echo -e "\n$separator\n"

# Handle user's ResolutionChoice
case $ResolutionChoice in
    1)
        # Option 1: Set resolution to 1920x1080
        proj_res_h=1920
        proj_res_v=1080
        ;;
    2)
        # Option 2: Set resolution to 3840x2160
        proj_res_h=3840
        proj_res_v=2160
        ;;
    3)
        # Option 3: Prompt user for custom resolution with validation
        while true; do
            read -p "  Enter Horizontal Resolution: " proj_res_h
            while ! is_number "$proj_res_h"; do
                echo -e "  Invalid input." \
                && echo -e "  Enter a valid Horizontal Resolution."
                read -p " Enter Horizontal Resolution: " proj_res_h
            done

            read -p "  Enter Vertical Resolution:   " proj_res_v
            while ! is_number "$proj_res_v"; do
                echo -e "  Invalid input." \
                && echo -e "  Enter a valid Vertical Resolution."
                read -p "  Enter Vertical Resolution:   " proj_res_v
            done

            # Break if both Horizontal & Vertical resolutions are valid
            if is_number "$proj_res_h" \
                && is_number "$proj_res_v"; then
                break
            fi
        done
        ;;
    *)
        # Invalid ResolutionChoice, exit with an error
        echo -e "Invalid ResolutionChoice. Exiting."
        exit 1
        ;;
esac

# Calculate proj_aspect_ratio rounded to a maximum of 5 decimal points
proj_aspect_ratio=$(awk "BEGIN {printf \"%.5f\", $proj_res_h / $proj_res_v}")

proj_res="$proj_res_h x $proj_res_v"

echo -e "\n$separator\n"
echo -e "  Selected Project Resolution:    $proj_res"
echo -e "  Selected Project Aspect Ratio:  $proj_aspect_ratio"
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #
