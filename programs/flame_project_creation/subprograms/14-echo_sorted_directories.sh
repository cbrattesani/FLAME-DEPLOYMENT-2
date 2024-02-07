
# ========================================================================== #
# This section echoes sorted_dir_names to the shell.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Sort sorted_dir_names in descending order by calc_app_val
IFS=$'\n' sorted_dir_names=($(sort -r -t ':' -k2 \
<<<"${sorted_dir_names[*]}"))

# -------------------------------------------------------------------------- #

# Echo the sorted list
echo -e "  Sorted Directory Names (Descending Order):\n"

# Initialize a counter for numbering entries
count=0

# Iterate through the sorted directory names
for sorted_dir in "${sorted_dir_names[@]}"; do
    count=$((count + 1))  # Increment the counter
    echo -n "$count. "  # Print the entry number

    # Extract and print the directory name
    echo -e "${sorted_dir%%:*}"

    # Limit the output to a maximum of 10 entries
    if [ "$count" -eq 99 ]; then
        break
    fi
done

echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #
