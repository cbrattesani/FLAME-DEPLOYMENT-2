
# ========================================================================== #
# This section creates decorative separators for titles and banners.
# ========================================================================== #

# Function to repeat a character n times
repeat_char() {
    local char=$1
    local count=$2
    printf "%0.s$char" $(seq 1 "$count")
}

# -------------------------------------------------------------------------- #

# Function to ensure a line is exactly 79 characters
make_line_79_chars() {
    local line=$1
    local current_length=${#line}

    # Calculate the number of additional "=" characters needed
    local pad=$((79 - current_length))

    # Add the required pad before the " #" at the end
    line="${line% #}$(repeat_char "=" "$pad") #"

    echo -e "$line"
}

# -------------------------------------------------------------------------- #

# Function to generate title line
generate_title_line() {
    local title=$1
    local total_length=79

    # Calculate pad on each side of the title
    local title_pad_length=$(( (total_length - ${#title} - 8) / 2 ))

    # Generate the title_line
    local title_line=$(printf "# %s %s %s #
" \n        "$(repeat_char "=" "$title_pad_length")" \n        "$title" \n        "$(repeat_char "=" "$title_pad_length")")

    # Ensure title_line is exactly 79 characters
    title_line=$(make_line_79_chars "$title_line")

    echo -e "$title_line"
}

# -------------------------------------------------------------------------- #

# Function to generate end of title line
generate_end_title_line() {
    local end_title=$1
    local total_length=79

    # Calculate pad on each side of the end_title
    local end_title_pad_length=$(( (total_length - ${#end_title} - 8) / 2 ))

    # Generate the end_title_line
    local end_title_line=$(printf "# %s %s %s #\n" \
        "$(repeat_char "=" "$end_title_pad_length")" \
        "$end_title" \
        "$(repeat_char "=" "$end_title_pad_length")")

    # Ensure end_title_line is exactly 79 characters
    end_title_line=$(make_line_79_chars "$end_title_line")

    echo -e "$end_title_line"
}

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #


