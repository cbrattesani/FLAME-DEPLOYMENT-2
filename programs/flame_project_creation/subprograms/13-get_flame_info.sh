
# ========================================================================== #
# This section loops through dir_names and populates variables.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Iterate through each directory name in the array
# for dir_path in "${dir_names[@]}"; do
for dir_path in "${dir_names[@]:-}"; do

    # ---------------------------------------------------------------------- #

    # Use the basename command to get only the directory name
    app_dir_name=$(basename "$dir_path")

    # ---------------------------------------------------------------------- #

    # Split the directory name using '_' as the delimiter
    IFS='_' read -ra app_dir_name_parts <<< "$app_dir_name"
    # Extract the app_name from the split app_dir_name_parts
    app_name="${app_dir_name_parts[0]}"
    # Extract the app_ver part from the split app_dir_name_parts
    app_ver="${app_dir_name_parts[1]}"

    # ---------------------------------------------------------------------- #

    # Split the app_ver part using '.' as the delimiter
    IFS='.' read -ra app_ver_parts <<< "$app_ver"
    # Extract the app_maj
    app_maj="${app_ver_parts[0]}"
    # Extract the app_min or set to "0" if not present
    app_min="${app_ver_parts[1]:-0}"
    # Extract the app_dot or set to "0" if not present
    app_dot="${app_ver_parts[2]:-0}"

    # ---------------------------------------------------------------------- #

    # Sanitize the Software Version by replacing "." with "x"
    # sanitized_sw_ver="${app_maj}x${app_min}x${app_dot}"

    # ---------------------------------------------------------------------- #

    # Extract the app_pr_ver and set app_pr_val using a regular expression
    if [[ $app_ver =~ pr([0-9]{3}) ]]; then
        app_pr_ver="${app_ver##*.pr}"
        app_pr_val="${BASH_REMATCH[1]}"
        beta_sw=true
    else
        app_pr_ver="pr999"
        app_pr_val="999"
        beta_sw=false
    fi

    # ---------------------------------------------------------------------- #

    # Set app_val based on the app_name
    case $app_name in
        "flame")
            app_val="5"
            ;;
        "flare")
            app_val="4"
            ;;
        "flameassist")
            app_val="3"
            ;;
        "lustre")
            app_val="2"
            ;;
        "smoke")
            app_val="1"
            ;;
        *)
            app_val="0"
            ;;
    esac

    # ---------------------------------------------------------------------- #

    # Validate and set to "0" if necessary
    [[ $app_min == "pr"* ]] && app_min="0"
    [[ $app_dot == "pr"* ]] && app_dot="0"

    # ---------------------------------------------------------------------- #

    # Combine extracted values to form the calc_app_val
    calc_app_val="${app_maj}${app_min}${app_dot}${app_pr_val}${app_val}"

    # ---------------------------------------------------------------------- #

    # Check conditions and set Calculated Software Versions
    if [[ "${app_min}" == "0" && "${app_dot}" == "0" ]]; then
        calc_app_ver="${app_maj}"
        sw_ver="${app_maj}"
        sanitized_sw_ver="${app_maj}"
    elif [[ "${app_min}" -gt "0" && "${app_dot}" == "0" ]]; then
        calc_app_ver="${app_maj}.${app_min}"
        sw_ver="${app_maj}.${app_min}"
        sanitized_sw_ver="${app_maj}x${app_min}"
    elif [[ "${app_min}" == "0" && "${app_dot}" -gt "0" ]]; then
        calc_app_ver="${app_maj}.${app_min}.${app_dot}"
        sw_ver="${app_maj}.${app_min}.${app_dot}"
        sanitized_sw_ver="${app_maj}x${app_min}x${app_dot}"
    else
        calc_app_ver="${app_maj}.${app_min}.${app_dot}"
        sw_ver="${calc_app_val}"
        sanitized_sw_ver="${app_maj}x${app_min}x${app_dot}"
    fi

    # ---------------------------------------------------------------------- #

    # Check if calc_app_ver requires Beta Software Suffix
    if [ "$beta_sw" = true ]; then
        calc_app_ver="$calc_app_ver.pr$app_pr_ver"
    fi

    # ---------------------------------------------------------------------- #

    # Append current app_dir_name & calc_app_val to sorted_dir_names
    sorted_dir_names+=("$app_dir_name:$calc_app_val")

    # ---------------------------------------------------------------------- #

    # Update max_dir_val if the current calc_app_val is higher
    if [[ "$calc_app_val" > "$max_dir_val" ]]; then
        max_dir_val="$calc_app_val"
        max_dir_ver="$calc_app_ver"
        max_dir_name="$app_dir_name"
        max_sw_ver="$sw_ver"
        max_sanitized_sw_ver="$sanitized_sw_ver"
    fi

    # ---------------------------------------------------------------------- #

    # Print the details of each directory
    echo -e "  Directory Name:           $app_dir_name"
    echo -e "  App Name:                 $app_name"
    echo -e "  App Version:              $app_ver"
    echo -e "  App Value:                $app_val"
    echo -e "  Major Version:            $app_maj"
    echo -e "  Minor Version:            $app_min"
    echo -e "  Dot Version:              $app_dot"
    echo -e "  PR Version:               $app_pr_ver"
    echo -e "  PR Value:                 $app_pr_val"
    echo -e "  Calculated Value:         $calc_app_val"
    echo -e "  Calculated Version:       $calc_app_ver"
    echo -e "  Beta Software:            $beta_sw"
    echo -e "  Highest SW Ver:           $max_sw_ver"
    echo -e "  Highest Sanitized SW Ver: $max_sanitized_sw_ver"
    echo -e "\n$separator\n"

    # ---------------------------------------------------------------------- #

done

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #
