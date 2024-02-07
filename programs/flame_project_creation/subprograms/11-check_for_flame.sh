
# ========================================================================== #
# This section checks for '/opt/Autodesk' & flame family software.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Common search directory
search_dir="/opt/Autodesk"

# Check if the directory exists
if [ ! -d "$search_dir" ]; then
    echo -e "\n$separator\n"
    echo -e "  '$search_dir' does not exist."
    echo -e "\n$separator\n"
    exit 1
fi

# -------------------------------------------------------------------------- #

# Display information
echo -e "  Searching '$search_dir' for flame family applications."
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# Search for directories named "fla*", "smoke*", or "lustre*"
dir_names=($(find "$search_dir" -maxdepth 1 \
    \( -name "fla*" -o -name "smoke*" -o -name "lustre*" \)))

# Validate if dir_names is not empty
if [ ${#dir_names[@]} -eq 0 ]; then
    echo -e "\n$separator\n"
    echo -e "No directories found in $search_dir starting with 'fla'."
    echo -e "\n$separator\n"
    exit 1
fi

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #
