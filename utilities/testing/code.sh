#!/bin/bash

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Program Name:     create_flame_projects.sh
# Version:          1.0
# Language:         bash script
# Flame Version:    2025.x
# Author:           Phil MAN - phil_man@mac.com
# Toolset:          MAN_MADE_MATERIAL
# Created:          2024-01-19
# Modified:         2024-02-03
# Modifier:         Phil MAN - phil_man@mac.com

# Changelist:       Fixed Syncolor policies.

# -------------------------------------------------------------------------- #

# Description:      This program determines system information and collects
#                   user input to create new flame projects.

# Installation:     Copy the 'FLAME-DEPLOYMENT' repo to your home directory,

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section defines a variable for the path to the running program.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Define the path to the current script in a variable called 'path_to_here'
path_to_here=$(cd $(dirname "$0") && pwd)

# change directory to path_to_here
cd $path_to_here

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section creates decorative separators for blocks of text.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Define a variable called 'separator'
separator=$(printf '+ %s +' "$(printf -- '-%.0s' {1..75})")

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

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
    local title_line=$(printf "# %s %s %s #\n" \
        "$(repeat_char "=" "$title_pad_length")" \
        "$title" \
        "$(repeat_char "=" "$title_pad_length")")

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

DELIMITER

# ========================================================================== #
# This section collects username, group memberships, & system info.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Get username, primary group and group memberships.
current_user="$USER"
primary_group="$(id -gn)"
all_groups="$(groups | tr ' ' ',' | sed 's/,/, /g')"

# -------------------------------------------------------------------------- #

# Determine the operating system
if [[ "$(uname)" == "Darwin" ]]; then
    # macOS
    operating_system="macOS"

elif [[ "$(uname)" == "Linux" ]]; then
    # Linux
    operating_system="Linux"

else
    # Default to a common directory if the OS is not recognized
    echo -e "\n$separator\n"
    echo -e "  Unsupported operating system."
    echo -e "\n$separator\n"
    exit 1
fi

# -------------------------------------------------------------------------- #

# Get the workstation name
if [[ "$operating_system" == "macOS" ]]; then
    # For macOS
    workstation_name=$(scutil --get ComputerName)
elif [[ "$operating_system" == "Linux" ]]; then
    # For Linux
    workstation_name=$(hostname)
else
    # Default to a generic name if the OS is not recognized
    workstation_name="UnknownWorkstation"
fi

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section defines variables based on the date.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Current Date & Time Options
current_datetime=$(date "+%Y-%m-%d %H:%M:%S")
today=$(date "+%Y-%m-%d")
yesterday=$(date -v -1d "+%Y-%m-%d" 2>/dev/null \
    || date -d "yesterday" "+%Y-%m-%d")
tomorrow=$(date -v +1d "+%Y-%m-%d" 2>/dev/null \
    || date -d "tomorrow" "+%Y-%m-%d")

# -------------------------------------------------------------------------- #

# Custom Date & Time Options
now_h_m_s=$(date "+%H:%M:%S")
now_h_m=$(date "+%H-%M")
today_now=$(date "+%F_%H-%M")
TODAY="$today"
NOW="$now_h_m_s"

# -------------------------------------------------------------------------- #

# Year Options
year_with_century=$(date "+%Y")
year_without_century=$(date "+%y")
YYYY=$year_with_century

# -------------------------------------------------------------------------- #

# Month Options
month=$(date "+%m")
month_full=$(date "+%B")
month_abbrev=$(date "+%b")
MM=$month

# -------------------------------------------------------------------------- #

# Day Options
day=$(date "+%d")
day_of_year=$(date "+%j")
day_of_week=$(date "+%w")
DD=$day

# -------------------------------------------------------------------------- #

# Time Options
hour_24=$(date "+%H")
hour_12=$(date "+%I")
minute=$(date "+%M")
second=$(date "+%S")

# -------------------------------------------------------------------------- #

# Other Options
weekday_full=$(date "+%A")
weekday_abbrev=$(date "+%a")
week_number_sunday=$(date "+%U")
week_number_monday=$(date "+%W")
timezone_name=$(date "+%Z")
timezone_offset=$(date "+%z")
unix_timestamp=$(date "+%s")
nanoseconds=$(date "+%N")

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section defines paths for activity logging.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Make dated folders if necessary
mkdir -p "logs/$YYYY"
mkdir -p "logs/$YYYY/$MM"
mkdir -p "logs/$YYYY/$MM/$DD"

# -------------------------------------------------------------------------- #

# Make a flame project creation log
proj_creation_log_file=\
"logs/$YYYY/$MM/$DD/$YYYY-$MM-$DD-$now_h_m-proj_creation_log"

# Redirect stdout and stderr to the log file
exec > >(tee -a "$proj_creation_log_file") 2>&1

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section defines title_01 and banner_01.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Define variables for the decorative lines that get printed to the shell.
title_01="PROJECT CONFIGURATION SCRIPT"
banner_01="$title_01 STARTED"
end_title_01="$title_01 COMPLETED"
end_banner_01=$(generate_end_title_line "$end_title_01")

# -------------------------------------------------------------------------- #

# Display banner_01 and a separator.
echo -e "\n\n$(generate_title_line "$banner_01")\n"
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section displays date, username, group memberships, & system info.
# ========================================================================== #

# Display date and time.
echo -e "  Current Date:     $today"
echo -e "  Current Time:     $now_h_m_s"
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# Check if there are other groups
if [ -n "$all_groups" ]; then
    other_groups="$(echo "$all_groups" \
        | sed "s/$primary_group, //")"
    echo -e "  Current User:     $current_user"
    echo -e "  Primary Group:    $primary_group"
    echo -e "  Other Groups:     $other_groups"
else
    echo -e "  Current User:     $current_user"
    echo -e "  Primary Group:    $primary_group"
    echo -e "  Other Groups:     None"
fi

echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# Display operating system and workstation name.
echo -e "  Operating System: $operating_system"
echo -e "\n$separator\n"
echo -e "  Workstation Name: $workstation_name"
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section defines title_02 and banner_02.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Define variables for the decorative lines that get printed to the shell.
title_02="OS & FLAME INSTALLATIONS"
banner_02="CHECK $title_02"
end_title_02="$title_02 CHECK COMPLETED"
end_banner_02=$(generate_end_title_line "$end_title_02")

# -------------------------------------------------------------------------- #

# Display banner_02 and a separator.
echo -e "\n\n$(generate_title_line "$banner_02")\n"
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

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

DELIMITER

# ========================================================================== #
# This section initializes variables.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Initialize variables
sorted_dir_names=()
max_dir_val="0000000000"
max_dir_name=""
max_dir_ver=""
max_sw_ver=""
max_sanitized_sw_ver=""
beta_sw=false

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

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

DELIMITER

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

DELIMITER

# ========================================================================== #
# This section echoes several values to the shell.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Print the highest directory value outside the loop
echo -e "  Highest Directory Value is:   $max_dir_val"

# Print the highest directory name outside the loop
echo -e "  Highest Directory Version is: $max_dir_ver"

# Print the highest directory name outside the loop
echo -e "  Highest Directory Name is:    $max_dir_name"

# Print the highest software app_ver outside the loop
echo -e "  Highest Software Version is:  $max_sw_ver"

# Print the highest software app_ver outside the loop
echo -e "  Sanitized SW Version is:      $max_sanitized_sw_ver"

# -------------------------------------------------------------------------- #

echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section echoes end_banner_02.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Display the end_title line.
echo -e "$end_banner_02\n"
echo -e "\n\n$separator\n$separator\n$separator\n\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section creates functions that validate user_input.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Function to validate input (letters or numbers only)
validate_input() {
    local input=$1
    if [[ "$input" =~ ^[a-zA-Z0-9]+$ ]]; then
        return 0  # Input is valid
    else
        return 1  # Input is invalid
    fi
}

# -------------------------------------------------------------------------- #

# Function to check if a given string is a number
is_number() {
  re='^[0-9]+$'
  if [[ $1 =~ $re ]]; then
    return 0  # It's a number
  else
    return 1  # It's not a number
  fi
}

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section creates a variable to store rsync options.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# The following command is too long:
# 'rsync -av --no-group --no-perms --no-times --size-only --ignore-existing '

# Wrap the rsync options as an array into the variable 'sync_opts'
sync_opts=(-av --no-group --no-perms --no-times --size-only --ignore-existing)

# To use the variable in your rsync command
# rsync "${sync_opts[@]}" source_directory/ destination_directory/

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section defines title_03 and banner_03.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Define variables for the decorative lines that get printed to the shell.
title_03="JOBS DIRECTORY"
banner_03="CONFIRM THE $title_03"
end_title_03="$title_03 CONFIRMED"
end_banner_03=$(generate_end_title_line "$end_title_03")

# -------------------------------------------------------------------------- #

# Display the title line and a separator.
echo -e "\n$(generate_title_line "$banner_03")\n"
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section validates or creates the JOBS directory.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Set the umask to 0
umask 0

# -------------------------------------------------------------------------- #

# Set the default for the Jobs Directory
jobs_dir="/JOBS"
echo -e "  Using the default Jobs Directory '/JOBS'."

# -------------------------------------------------------------------------- #

echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section prints end_banner_03.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Display the end_title line.
echo -e "$end_banner_03\n"
echo -e "\n\n$separator\n$separator\n$separator\n\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section defines title_04 and banner_04.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Define variables for the decorative lines that get printed to the shell.
title_04="NEW FLAME PROJECT"
banner_04="CREATE A $title_04"
end_title_04="$title_04 CREATION COMPLETED"
end_banner_04=$(generate_end_title_line "$end_title_04")

# -------------------------------------------------------------------------- #

# Display the title line and a separator.
echo -e "\n$(generate_title_line "$banner_04")\n"
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section gathers name information to create a new flame project.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Prompt user for $client
echo -e "  Please enter the client name for this project:\n"
echo -e " (The format should be lower case letters / numbers only):"
echo -e "  e.g. apple, bmw, chevron, delta, edison, 23andme"
echo -e "\n$separator\n"
read -p "  client name: " client
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# Validate $client
if validate_input "$client"; then
    # Prompt user for $campaign
    echo -e "  Please enter the campaign name for this project:\n"
    echo -e " (The format should be lower case letters / numbers only):"
    echo -e "  e.g. iphone16, x5offroad, carwash, airmiles, rebate, dnatest"
    echo -e "\n$separator\n"
    read -p "  campaign name: " campaign
    echo -e "\n$separator\n"

    # ---------------------------------------------------------------------- #

    # Validate $campaign
    if validate_input "$campaign"; then
        # Construct $proj_nick
        proj_nick="$client"_"$campaign"

        # ------------------------------------------------------------------ #

        # Print the entered values
        echo -e "  client name: $client"
        echo -e "  campaign name: $campaign"
        # echo -e "  project nickname: $proj_nick"
        echo -e "\n$separator\n"
    else
        echo -e "Error: Invalid entry. Please enter letters or numbers only."
    fi
else
    echo -e "Error: Invalid entry. Please enter letters or numbers only."
fi

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

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

DELIMITER

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

DELIMITER

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

DELIMITER

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

DELIMITER

# ========================================================================== #
# This section sets initial metadata parameters.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# These variables represent metadata for a flame node of type project
# (Items that are commented out are no longer necessary for flame 2025+)
name="$client"_"$campaign"_"$max_sanitized_sw_ver"_"$workstation_name"
nickname="$client"_"$campaign"
description="flame $max_sanitized_sw_ver project for $client $campaign"
shotgun_name="$nickname"
# creation_date="$(date +%F %T)"
setup_dir="$name"
partition="stonefs"
version="$max_dir_ver"
frame_width="$proj_res_h"
frame_height="$proj_res_v"
frame_depth="$proj_color_depth"
aspect_ratio="$proj_aspect_ratio"
field_dominance="PROGRESSIVE"
# proxy_width="$ProxyWidth"
# proxy_width_hint="$ProxyWidthHint"
# proxy_min_frame_size="$ProxyMinFrameSize"
# proxy_above_8bits="$ProxyAbove8bits"
# proxy_quality="$ProxyQuality"
# proxy_regen_state="$ProxyRegenState"
# proxy_depth_mode="$ProxyDepthMode"
# proxy_depth="$ProxyDepth"
# matchbox_path="/opt/Autodesk/presets/$version/matchbox/shaders/"
# lightbox_path="/opt/Autodesk/presets/$version/action/lightbox/"
# action_shader_path="/opt/Autodesk/presets/$version/matchbox/shaders/"
# hdr_mode="Dolby Vision 2.9"
# hdr_cmu_type="iCMU"
# hdr_mastering_id="7"
# process_mode="2"
# intermediates_profile="0"
frame_rate="$proj_fcm"
default_start_frame="1001"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section prints a summary of the new flame project metadata parameters.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Display summary for the flame project.
echo -e "  Flame Project Summary\n"
echo -e "  Project Name:        $name"
echo -e "  Project NickName:    $nickname"
echo -e "  Project Description: $description"
echo -e "  Shotgrid Name:       $shotgun_name"
echo -e "  Setup Directory:     $setup_dir"
echo -e "  Flame Framestore:    $partition"
echo -e "  Software Version:    $version"
echo -e "  Frame Width:         $frame_width"
echo -e "  Frame Height:        $frame_height"
echo -e "  Color Depth:         $frame_depth"
echo -e "  Aspect Ratio:        $aspect_ratio"
echo -e "  Field Dominance:     $field_dominance"
echo -e "  Frame Rate:          $frame_rate"
echo -e "  Start Frame:         $default_start_frame"
echo -e "  Color Policy:        $proj_color_science"
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# Make dated folders if necessary
mkdir -p "xml/$YYYY"
mkdir -p "xml/$YYYY/$MM"
mkdir -p "xml/$YYYY/$MM/$DD"

# Make a customized flame_proj_file file
flame_proj_file="xml/$YYYY/$MM/$DD/project_metadata_$name.xml"

# Check if flame_proj_file exists, create if not
if [ ! -e "$flame_proj_file" ]; then
    touch "$flame_proj_file"
fi

# Create or truncate flame_proj_file
echo -n '' > "$flame_proj_file"

# -------------------------------------------------------------------------- #

# Add metadata content to flame_proj_file
echo -n "<Project>" \
    >> "$flame_proj_file"

# Define an array with the key-value pairs
declare -a ProjectParameters=(
    "Name:$name"
    "Nickname:$nickname"
    "Description:$description"
    "ShotgunProjectName:$shotgun_name"
    "SetupDir:$setup_dir"
    "Partition:$partition"
    "Version:$version"
    "FrameWidth:$frame_width"
    "FrameHeight:$frame_height"
    "FrameDepth:$frame_depth"
    "AspectRatio:$aspect_ratio"
    "FieldDominance:$field_dominance"
    # "ProxyWidth:$proxy_width"
    # "ProxyWidthHint:$proxy_width_hint"
    # "ProxyMinFrameSize:$proxy_min_frame_size"
    # "ProxyAbove8bits:$proxy_above_8bits"
    # "ProxyQuality:$proxy_quality"
    # "ProxyRegenState:$proxy_regen_state"
    # "ProxyDepthMode:$proxy_depth_mode"
    # "ProxyDepth:$proxy_depth"
    # "BatchShaderPath:$matchbox_path"
    # "ActionLightOperatorPath:$lightbox_path"
    # "ActionShaderPath:$action_shader_path"
    # "HdrMode:$hdr_mode"
    # "HdrCmuType:$hdr_cmu_type"
    # "HdrMasteringId:$hdr_mastering_id"
    # "ProcessMode:$process_mode"
    # "IntermediatesProfile:$intermediates_profile"
    "FrameRate:$frame_rate"
    "DefaultStartFrame:$default_start_frame"
)

# Loop through the array and append each key-value pair to the file
for ProjectParameter in "${ProjectParameters[@]}"; do
    IFS=':' read -r key value <<< "$ProjectParameter"
    echo -n "<$key>$value</$key>" \
        >> "$flame_proj_file"
done

echo -n "</Project>" \
    >> "$flame_proj_file"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section creates the new flame project.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Set the umask to 0
umask 0

# -------------------------------------------------------------------------- #

# Create the project node using wiretap
# -n <parent node ID>
# -d <display name>
# -t <server-specific node type string (default = NODE)>
# [-h <host name or IP address> (default = 127.0.0.1)]
# [-s <metadata stream name> (default = none]
# [-f <file containing metadata> (default = none)]
# [-g <effective group>] (assumes super-user privileges)
/opt/Autodesk/wiretap/tools/current/wiretap_create_node \
-n /volumes/stonefs \
-d "$name" \
-s XML \
-f "$flame_proj_file" | sed 's/^/  /'
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section creates directories in a new flame project.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Set the umask to 0
umask 0

# -------------------------------------------------------------------------- #

# Create the flame project directory
flame_proj_dir="/opt/Autodesk/project/$name"

if [ ! -d "$flame_proj_dir" ]; then
    mkdir -p -m 2777 "$flame_proj_dir"
fi

echo -e "  Flame project directory created."
echo -e "\n$separator\n"

# Define the default flame project subdirectories
flame_proj_setup_dirs=(
    "2dtransform"
    "2dtransform/flame"
    "2dtransform/pref"
    "2dtransform/presets"
    "3dblur"
    "3dblur/flame"
    "3dblur/pref"
    "3dblur/presets"
    "aaf"
    "action"
    "action/contextmenu"
    "action/flame"
    "action/ibl"
    "action/presets"
    "action/transitions"
    "audio"
    "audio/pref"
    "audio/pref/ALSA"
    "automatte"
    "automatte/flame"
    "automatte/pref"
    "automatte/presets"
    "autostabilize"
    "autostabilize/flame"
    "autostabilize/pref"
    "autostabilize/presets"
    "average"
    "average/flame"
    "average/pref"
    "average/presets"
    "axis"
    "batch"
    "batch/flame"
    "batch/log"
    "batch/pref"
    "batchclip"
    "batchclip/flame"
    "batchclip/pref"
    "batchclip/presets"
    "blendComp"
    "blendComp/flame"
    "blendComp/pref"
    "blendComp/presets"
    "blur"
    "blur/flame"
    "blur/pref"
    "blur/presets"
    "blur/presets/DEFOCUS"
    "bumpDisplace"
    "bumpDisplace/flame"
    "bumpDisplace/pref"
    "bumpDisplace/presets"
    "burn_letterbox"
    "burn_letterbox/flame"
    "burn_letterbox/pref"
    "burn_letterbox/presets"
    "burnmetadata"
    "burnmetadata/flame"
    "burnmetadata/overlay"
    "burnmetadata/overlay/presets"
    "burnmetadata/pref"
    "burnmetadata/presets"
    "ccurves"
    "ccurves/flame"
    "ccurves/pref"
    "ccurves/presets"
    "cfg"
    "cfg/linux"
    "cfg/linux/template"
    "check"
    "check/flame"
    "check/pref"
    "check/presets"
    "clamp"
    "clamp/flame"
    "clamp/pref"
    "clamp/presets"
    "colour_correct"
    "colour_correct/flame"
    "colour_correct/pref"
    "colour_correct/presets"
    "colourwarper"
    "colourwarper/flame"
    "colourwarper/pref"
    "colourwarper/presets"
    "combine"
    "combine/flame"
    "combine/pref"
    "combine/presets"
    "comp"
    "comp/flame"
    "compound"
    "compound/flame"
    "compound/pref"
    "compound/presets"
    "comp/pref"
    "comp/presets"
    "cryptoMatte"
    "cryptoMatte/flame"
    "cryptoMatte/pref"
    "cryptoMatte/presets"
    "damage"
    "damage/flame"
    "damage/pref"
    "damage/presets"
    "damage/presets/ANALOG"
    "damage/presets/DIGITAL"
    "damage/presets/FILM"
    "deal"
    "deal/flame"
    "deal/pref"
    "deal/presets"
    "deform"
    "deform/flame"
    "deform/pref"
    "deform/presets"
    "degrain"
    "degrain/flame"
    "degrain/pref"
    "degrain/presets"
    "deinterlace"
    "deinterlace/flame"
    "deinterlace/pref"
    "deinterlace/presets"
    "denoise"
    "denoise/flame"
    "denoise/pref"
    "denoise/presets"
    "depthOfField"
    "depthOfField/flame"
    "depthOfField/pref"
    "depthOfField/presets"
    "difference"
    "difference/flame"
    "difference/pref"
    "difference/presets"
    "dissolve"
    "dissolve/flame"
    "dissolve/pref"
    "dissolve/presets"
    "distort"
    "distort/flame"
    "distort/pref"
    "distort/presets"
    "edge"
    "edgeDetect"
    "edgeDetect/flame"
    "edgeDetect/pref"
    "edgeDetect/presets"
    "edge/flame"
    "edge/pref"
    "edge/presets"
    "edl"
    "export"
    "export/flame"
    "export/pref"
    "export/presets"
    "export/presets/flame"
    "export/presets/flame/audio_file"
    "export/presets/flame/audio_file/AIFF"
    "export/presets/flame/audio_file/AIFF-C"
    "export/presets/flame/audio_file/AVR"
    "export/presets/flame/audio_file/BICSF"
    "export/presets/flame/audio_file/MP3"
    "export/presets/flame/audio_file/NEXTSND"
    "export/presets/flame/audio_file/WAVE"
    "export/presets/flame/distribution_package"
    "export/presets/flame/distribution_package/Dolby Vision"
    "export/presets/flame/file_sequence"
    "export/presets/flame/file_sequence/Alias"
    "export/presets/flame/file_sequence/Cineon"
    "export/presets/flame/file_sequence/DPX"
    "export/presets/flame/file_sequence/Jpeg"
    "export/presets/flame/file_sequence/Maya"
    "export/presets/flame/file_sequence/OpenEXR"
    "export/presets/flame/file_sequence/Pict"
    "export/presets/flame/file_sequence/Pixar"
    "export/presets/flame/file_sequence/Png"
    "export/presets/flame/file_sequence/SGI"
    "export/presets/flame/file_sequence/Softimage"
    "export/presets/flame/file_sequence/Targa"
    "export/presets/flame/file_sequence/Tiff"
    "export/presets/flame/file_sequence/Wavefront"
    "export/presets/flame/movie_file"
    "export/presets/flame/movie_file/Apple Final Cut Pro"
    "export/presets/flame/movie_file/AVC-Intra"
    "export/presets/flame/movie_file/Avid Media Composer"
    "export/presets/flame/movie_file/Cinedeck"
    "export/presets/flame/movie_file/DVCPro HD"
    "export/presets/flame/movie_file/H.264"
    "export/presets/flame/movie_file/MP4"
    "export/presets/flame/movie_file/Panasonic"
    "export/presets/flame/movie_file/QuickTime"
    "export/presets/flame/movie_file/Sony XAVC"
    "export/presets/flame/movie_file/Sony XDCAM"
    "export/presets/flame/sequence_publish"
    "export/presets/flame/sequence_publish/Apple Final Cut Pro"
    "export/presets/flame/sequence_publish/Avid Media Composer"
    "export/presets/flame/sequence_publish/Avid Pro Tools"
    "export/presets/flame/sequence_publish/DaVinci Resolve"
    "export/presets/flame/sequence_publish/EDL Publish"
    "export/presets/flame/sequence_publish/Filmlight Baselight"
    "export/presets/flame/sequence_publish/Shot Publish"
    "export/presets/flame/sequence_publish/Simple Publish"
    "export/presets/flame/sequence_publish/Source Media Export"
    "export/presets/flame/sequence_publish/Source Media Publish"
    "export/presets/shotgun"
    "export/presets/shotgun/audio_file"
    "export/presets/shotgun/distribution_package"
    "export/presets/shotgun/file_sequence"
    "export/presets/shotgun/movie_file"
    "export/presets/shotgun/sequence_publish"
    "exposure"
    "exposure/flame"
    "exposure/pref"
    "exposure/presets"
    "expressions"
    "fieldmerge"
    "fieldmerge/flame"
    "fieldmerge/pref"
    "fieldmerge/presets"
    "filmrestore"
    "filmrestore/pref"
    "filmrestore/presets"
    "filter"
    "filter/flame"
    "filter/pref"
    "filter/presets"
    "flip"
    "flip/flame"
    "flip/pref"
    "flip/presets"
    "gateway_import"
    "gateway_import/flame"
    "gateway_import/pref"
    "gateway_import/presets"
    "glow"
    "glow/flame"
    "glow/pref"
    "glow/presets"
    "gmask"
    "gmask/default"
    "gmask/flame"
    "gmask/pref"
    "gmask/presets"
    "gmask/transitions"
    "gmask/transitions/SMPTE"
    "gradient"
    "gradient/flame"
    "gradient/pref"
    "gradient/presets"
    "hdr"
    "hdr/flame"
    "hdr/pref"
    "hdr/presets"
    "histo2d"
    "histo2d/flame"
    "histo2d/pref"
    "histo2d/presets"
    "hub"
    "hub/flame"
    "hub/pref"
    "hub/presets"
    "image"
    "image/flame"
    "image/presets"
    "images"
    "import"
    "import/flame"
    "import/pref"
    "import/presets"
    "interlace"
    "interlace/flame"
    "interlace/pref"
    "interlace/presets"
    "key"
    "keyer3d"
    "keyer3d/flame"
    "keyer3d/pref"
    "keyer3d/presets"
    "keyerChannel"
    "keyerChannel/flame"
    "keyerChannel/pref"
    "keyerChannel/presets"
    "keyerHLS"
    "keyerHLS/flame"
    "keyerHLS/pref"
    "keyerHLS/presets"
    "keyerRGB"
    "keyerRGBCMYL"
    "keyerRGBCMYL/flame"
    "keyerRGBCMYL/pref"
    "keyerRGBCMYL/presets"
    "keyerRGB/flame"
    "keyerRGB/pref"
    "keyerRGB/presets"
    "keyerYUV"
    "keyerYUV/flame"
    "keyerYUV/pref"
    "keyerYUV/presets"
    "key/flame"
    "key/pref"
    "key/presets"
    "lensDistort"
    "lensDistort/flame"
    "lens_distortion"
    "lens_distortion/flame"
    "lens_distortion/pref"
    "lens_distortion/presets"
    "lensDistort/pref"
    "lensDistort/presets"
    "look"
    "look/flame"
    "look/pref"
    "look/presets"
    "lut"
    "lutfloat"
    "lut/pref"
    "lut/presets"
    "mapConvert"
    "mapConvert/flame"
    "mapConvert/pref"
    "mapConvert/presets"
    "mask"
    "mask/flame"
    "mask/pref"
    "mask/presets"
    "masterkey"
    "masterkey/flame"
    "masterkey/pref"
    "masterkey/presets"
    "matchbox"
    "matchbox/flame"
    "matchbox/pref"
    "matchGrain"
    "matchGrain/flame"
    "matchGrain/pref"
    "matchGrain/presets"
    "mattecurves"
    "mattecurves/flame"
    "mattecurves/pref"
    "mattecurves/presets"
    "mediaImport"
    "mediaImport/pref"
    "mediaImport/presets"
    "mix"
    "mix/flame"
    "mix/pref"
    "mix/presets"
    "modularKeyer"
    "modularKeyer/flame"
    "modularKeyer/pref"
    "modularKeyer/presets"
    "mono"
    "mono/flame"
    "mono/pref"
    "mono/presets"
    "motif"
    "motif/flame"
    "motif/pref"
    "motif/presets"
    "motion_analysis"
    "motion_analysis/flame"
    "motion_analysis/pref"
    "motion_analysis/presets"
    "motionBlur"
    "motionBlur/flame"
    "motionBlur/pref"
    "motionBlur/presets"
    "motion_convert"
    "motion_convert/flame"
    "motion_convert/pref"
    "motion_convert/presets"
    "note"
    "note/flame"
    "note/pref"
    "note/presets"
    "openfx"
    "openfx/flame"
    "openfx/pref"
    "openfx/presets"
    "optics"
    "optics/flame"
    "optics/pref"
    "optics/presets"
    "output"
    "output/flame"
    "output/pref"
    "output/presets"
    "overlays"
    "overlays/presets"
    "paint"
    "paint/autopaint"
    "paint/brush"
    "paint/cutout"
    "paint/flame"
    "paint/geometry"
    "paint/mask"
    "paint/palette"
    "paint/picture"
    "paint/pref"
    "paint/presets"
    "paint/set"
    "particules"
    "path"
    "pixelspread"
    "pixelspread/flame"
    "pixelspread/pref"
    "pixelspread/presets"
    "posterize"
    "posterize/flame"
    "posterize/pref"
    "posterize/presets"
    "pulldown"
    "pulldown/flame"
    "pulldown/pref"
    "pulldown/presets"
    "pybox"
    "pybox/flame"
    "pybox/pref"
    "pybox/presets"
    "python"
    "quickcomp"
    "quickcomp/flame"
    "quickcomp/pref"
    "quickcomp/presets"
    "recursiveOps"
    "recursiveOps/flame"
    "recursiveOps/pref"
    "recursiveOps/presets"
    "regrain"
    "regrain/flame"
    "regrain/pref"
    "regrain/presets"
    "repeat"
    "repeat/flame"
    "repeat/pref"
    "repeat/presets"
    "resize"
    "resize/flame"
    "resize/pref"
    "resize/presets"
    "separate"
    "separate/flame"
    "separate/pref"
    "separate/presets"
    "sparks"
    "sparks/flame"
    "stabilizer"
    "stabilizer/pref"
    "stabilizer/presets"
    "status"
    "stereo"
    "stereoAnaglyph"
    "stereoAnaglyph/flame"
    "stereoAnaglyph/pref"
    "stereoAnaglyph/presets"
    "stereo/flame"
    "stereoInterlace"
    "stereoInterlace/flame"
    "stereoInterlace/pref"
    "stereoInterlace/presets"
    "stereo/pref"
    "stereo/presets"
    "stereoToolbox"
    "stereoToolbox/flame"
    "stereoToolbox/pref"
    "stereoToolbox/presets"
    "stmap"
    "stmap/flame"
    "stmap/pref"
    "stmap/presets"
    "stylize"
    "stylize/flame"
    "stylize/pref"
    "stylize/presets"
    "substance"
    "substance/flame"
    "substance/pref"
    "substance/presets"
    "subtitle"
    "subtitle/flame"
    "subtitle/pref"
    "subtitle/presets"
    "synColor"
    "synColor/policy"
    "synColor/policy/user_color_spaces"
    "synColor/transforms"
    "text"
    "text/flame"
    "text/pref"
    "text/presets"
    "timewarp"
    "timewarp/flame"
    "timewarp/pref"
    "timewarp/presets"
    "tmp"
    "viewing"
    "viewing/flame"
    "viewing/pref"
    "viewing/presets"
    "warper"
    "warper/magnet"
    "warper/pref"
    "warper/presets"
    "wipe"
    "xml"
)

# Create the directories
for flame_proj_setup_dir in "${flame_proj_setup_dirs[@]}"; do
  mkdir -p -m 2777 "$flame_proj_dir/$flame_proj_setup_dir"
done

echo -e "  Flame project setup directories created."
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section creates files in a new flame project.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Set the umask to 0
umask 0

# -------------------------------------------------------------------------- #

# Set the source and target directories for copying
src_batch_pref_dir="setups/batch/pref"
tgt_batch_pref_dir="$flame_proj_dir/batch/pref"

echo -e "  Creating batch project bin.\n"

# Use rsync to copy  nodes to the batch Projects bin
rsync "${sync_opts[@]}" "${src_batch_pref_dir}/" "${tgt_batch_pref_dir}/" | sed 's/^/  /'

echo -e "\n  Batch project bin created."
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# # Set the source and target directories for copying
src_mediaimport_dir="setups/mediaImport"
tgt_mediaimport_dir="$flame_proj_dir/mediaImport"
src_mediaimport_pref_dir="$mediaimport_src_dir/pref"
tgt_mediaimport_pref_dir="$mediaimport_tgt_dir/pref"

echo -e "  Synchronizing media import preferences & rules.\n"

# Use rsync to copy the media import rules and files
rsync "${sync_opts[@]}" "${src_mediaimport_dir}/" "${tgt_mediaimport_dir}/" | sed 's/^/  /'
# rsync "${sync_opts[@]}" "${src_mediaimport_pref_dir}/" "${tgt_mediaimport_pref_dir}/"

# # Copy media import rules and files
# cp -r "$mediaimport_src_dir"/*.rule "$mediaimport_tgt_dir"
# cp -r "$mediaimport_pref_src_dir"/* "$mediaimport_pref_tgt_dir"

echo -e "\n  Media import preferences & rules synchronized."
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# Set the target job directory
tgt_job_dir="$jobs_dir/$nickname"

# Create the target job directory if necessary
if [ ! -d "$tgt_job_dir" ]; then
    mkdir -p "$tgt_job_dir"
fi

# Set the source and target files for copying
src_project_bookmarks="setups/status/cf_bookmarks.json"
tgt_project_bookmarks="$flame_proj_dir/status/cf_bookmarks.json"

echo -e "  Creating project bookmarks.\n"

# Copy bookmarks
cp $src_project_bookmarks $tgt_project_bookmarks

# Set the search and replace strings
search_string_01="/JOBS/PROJECT_NAME"
replace_string_01="$tgt_job_dir"
search_string_02="PROJECT_NAME_BOOKMARK"
replace_string_02="$name"
search_string_03="PROJECT_PATH_BOOKMARK"
replace_string_03="$name"
search_string_04="PROJECT_PRIVATEDATA_BOOKMARK"
replace_string_04="$name"

# Use sed to replace the strings in the JSON file
if [ "$operating_system" == "Linux" ]; then
    sed -i "s|$search_string_01|$replace_string_01|g" "$tgt_project_bookmarks"
    sed -i "s|$search_string_02|$replace_string_02|g" "$tgt_project_bookmarks"
    sed -i "s|$search_string_03|$replace_string_03|g" "$tgt_project_bookmarks"
    sed -i "s|$search_string_04|$replace_string_04|g" "$tgt_project_bookmarks"
elif [ "$operating_system" == "macOS" ]; then
    sed -i '' "s|$search_string_01|$replace_string_01|g" "$tgt_project_bookmarks"
    sed -i '' "s|$search_string_02|$replace_string_02|g" "$tgt_project_bookmarks"
    sed -i '' "s|$search_string_03|$replace_string_03|g" "$tgt_project_bookmarks"
    sed -i '' "s|$search_string_04|$replace_string_04|g" "$tgt_project_bookmarks"
else
    echo "Unsupported operating system."
    exit 1
fi

echo -e "\n  Project bookmarks created."
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

tgt_flame_archives_dir="$tgt_job_dir/flame_archives"
mkdir -p "$tgt_flame_archives_dir"

# Set the source and target files for copying
src_flame_archive_script="setups/flame_archives_script_body.txt"
tgt_flame_archive_script="$tgt_flame_archives_dir/$name.sh"

echo -e "  Creating project flame archive script.\n"

# Copy the default archive text to a new archiving shell script
cp $src_flame_archive_script $tgt_flame_archive_script

# Add execution permissions to new archiving shell script
chmod +x $tgt_flame_archive_script

# Set the search and replace strings
search_string_01="ARCHIVE_SCRIPT_NAME"
replace_string_01="$name.sh"
search_string_02="ARCHIVE_SCRIPT_PROJECT"
replace_string_02="$name"
search_string_03="SCRIPT_CREATION_DATE"
replace_string_03="$NOW"
search_string_04="MMM_JOB_NAME_PREFIX"
replace_string_04="$client"
search_string_05="MMM_JOB_NAME_SUFFIX"
replace_string_05="$campaign"
search_string_06="MMM_JOB_NAME"
replace_string_06="$nickname"
search_string_07="FLAME_SOFTWARE_VERSION"
replace_string_07="$max_sanitized_sw_ver"
search_string_08="FLAME_WORKSTATION"
replace_string_08="$workstation_name"

# Use sed to replace the strings in the JSON file
if [ "$operating_system" == "Linux" ]; then
    sed -i "s|$search_string_01|$replace_string_01|g" "$tgt_flame_archive_script"
    sed -i "s|$search_string_02|$replace_string_02|g" "$tgt_flame_archive_script"
    sed -i "s|$search_string_03|$replace_string_03|g" "$tgt_flame_archive_script"
    sed -i "s|$search_string_04|$replace_string_04|g" "$tgt_flame_archive_script"
    sed -i "s|$search_string_05|$replace_string_05|g" "$tgt_flame_archive_script"
    sed -i "s|$search_string_06|$replace_string_06|g" "$tgt_flame_archive_script"
    sed -i "s|$search_string_07|$replace_string_07|g" "$tgt_flame_archive_script"
    sed -i "s|$search_string_08|$replace_string_08|g" "$tgt_flame_archive_script"
elif [ "$operating_system" == "macOS" ]; then
    sed -i '' "s|$search_string_01|$replace_string_01|g" "$tgt_flame_archive_script"
    sed -i '' "s|$search_string_02|$replace_string_02|g" "$tgt_flame_archive_script"
    sed -i '' "s|$search_string_03|$replace_string_03|g" "$tgt_flame_archive_script"
    sed -i '' "s|$search_string_04|$replace_string_04|g" "$tgt_flame_archive_script"
    sed -i '' "s|$search_string_05|$replace_string_05|g" "$tgt_flame_archive_script"
    sed -i '' "s|$search_string_06|$replace_string_06|g" "$tgt_flame_archive_script"
    sed -i '' "s|$search_string_07|$replace_string_07|g" "$tgt_flame_archive_script"
    sed -i '' "s|$search_string_08|$replace_string_08|g" "$tgt_flame_archive_script"
else
    echo "Unsupported operating system."
    exit 1
fi

echo -e "\n  Project flame archive script created."
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section copies the MAN MADE MATERIAL python scripts.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Set the umask to 0
umask 0

# -------------------------------------------------------------------------- #

# Set the source and target man_made_material python directories
src_shared_python_dir="setups/shared/python"
tgt_shared_python_dir="/opt/Autodesk/shared/python"

echo -e "  Synchronizing MAN MADE MATERIAL directories.\n"

# Use rsync to copy the python scripts
rsync "${sync_opts[@]}" "${src_shared_python_dir}/" "${tgt_shared_python_dir}/" | sed 's/^/  /'

# # Loop through subdirectories in the source parent directory
# for subdir in "${src_shared_python_dir}"/*/; do
#     subdir_name=$(basename "${subdir}")
    
#     # Check if the subdir exists in the target parent directory
#     if [ ! -d "${tgt_shared_python_dir}/${subdir_name}" ]; then
#         # If not, recursively copy the subdir
#         cp -r "${subdir}" "${tgt_shared_python_dir}/"
#     fi
# done

echo -e "\n  MAN MADE MATERIAL directories synchronized."
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section copies the shared import and export presets.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Set the umask to 0
umask 0

# -------------------------------------------------------------------------- #

# Set the source and target export presets directories
src_shared_export_presets_dir="setups/shared/export/presets"
tgt_shared_export_presets_dir="/opt/Autodesk/shared/export/presets"

echo -e "  Synchronizing shared export presets directories.\n"

# Use rsync to copy the export presets
rsync "${sync_opts[@]}" "${src_shared_export_presets_dir}/" "${tgt_shared_export_presets_dir}/" | sed 's/^/  /'

# # Loop through subdirectories in the source parent directory
# for subdir in "${src_shared_export_presets_dir}"/*/; do
#     subdir_name=$(basename "${subdir}")
    
#     # Check if the subdir exists in the target parent directory
#     if [ ! -d "${tgt_shared_export_presets_dir}/${subdir_name}" ]; then
#         # If not, recursively copy the subdir
#         # echo "cp -r \"${subdir}\" \"${tgt_shared_export_presets_dir}/\""
#         cp -r "${subdir}" "${tgt_shared_export_presets_dir}/"
#     fi
# done

echo -e "\n  Shared export presets directories synchronized."
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# Set the source and target import directories
src_shared_import_presets_dir="setups/shared/import"
tgt_shared_import_presets_dir="/opt/Autodesk/shared/import"

echo -e "  Synchronizing shared import presets directories.\n"

# Use rsync to copy the import presets
rsync "${sync_opts[@]}" "${src_shared_import_presets_dir}/" "${tgt_shared_import_presets_dir}/" | sed 's/^/  /'

# # Loop through subdirectories in the source parent directory
# for subdir in "${src_shared_import_presets_dir}"/*/; do
#     subdir_name=$(basename "${subdir}")
    
#     # Check if the subdir exists in the target parent directory
#     if [ ! -d "${tgt_shared_import_presets_dir}/${subdir_name}" ]; then
#         # If not, recursively copy the subdir
#         # echo "cp -r \"${subdir}\" \"${tgt_shared_import_presets_dir}/\""
#         cp -r "${subdir}" "${tgt_shared_import_presets_dir}/"
#     fi
# done

echo -e "\n  Shared import presets directories synchronized."
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section validates that the color management policies exist.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Set the umask to 0
umask 0

# -------------------------------------------------------------------------- #

# Set the source parent directories
src_policies_dir="setups/Syncolor/policies"

# Set the target parent directory based on the operating system
if [ "$operating_system" == "Linux" ]; then
    tgt_policies_dir="/opt/Autodesk/Synergy/SynColor/Shared/policies"
elif [ "$operating_system" == "macOS" ]; then
    tgt_policies_dir="/Applications/Autodesk/Synergy/SynColor/Shared/policies"
else
    echo "Unsupported operating system."
    exit 1
fi

echo -e "  Synchronizing Syncolor policies directories.\n"

# Use rsync to copy the policies
rsync "${sync_opts[@]}" "${src_policies_dir}/" "${tgt_policies_dir}/" | sed 's/^/  /'

# # Loop through subdirectories in the source parent directory
# for subdir in "${src_policies_dir}"/*/; do
#     subdir_name=$(basename "${subdir}")
    
#     # Check if the subdir exists in the target parent directory
#     if [ ! -d "${tgt_policies_dir}/${subdir_name}" ]; then
#         # If not, recursively copy the subdir
#         cp -r "${subdir}" "${tgt_policies_dir}/"
#     fi
# done

echo -e "\n  Syncolor policies directories synchronized."
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section validates that the color management transforms exist.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Set the umask to 0
umask 0

# -------------------------------------------------------------------------- #

# Set the source parent directories
src_transforms_dir="setups/Syncolor/transforms"

# Set the target parent directory based on the operating system
if [ "$operating_system" == "Linux" ]; then
    tgt_transforms_dir="/opt/Autodesk/Synergy/SynColor/Shared/transforms"
elif [ "$operating_system" == "macOS" ]; then
    tgt_transforms_dir="/Applications/Autodesk/Synergy/SynColor/Shared/transforms"
else
    echo "Unsupported operating system."
    exit 1
fi

echo -e "  Synchronizing Syncolor transforms directories.\n"

# Use rsync to copy the transforms
rsync "${sync_opts[@]}" "${src_transforms_dir}/" "${tgt_transforms_dir}/" | sed 's/^/  /'

# # Loop through subdirectories in the source parent directory
# for subdir in "${src_transforms_dir}"/*/; do
#     subdir_name=$(basename "${subdir}")
    
#     # Check if the subdir exists in the target parent directory
#     if [ ! -d "${tgt_transforms_dir}/${subdir_name}" ]; then
#         # If not, recursively copy the subdir
#         cp -r "${subdir}" "${tgt_transforms_dir}/"
#     fi
# done

echo -e "\n  Syncolor transforms directories synchronized."
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section adds a color management policy to the new flame project.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Set the umask to 0
umask 0

# -------------------------------------------------------------------------- #

# Add Autodesk colorsync policy to the project node using wiretap
# /opt/Autodesk/wiretap/tools/current/wiretap_duplicate_node \
# -s "/syncolor/policies/Autodesk/$proj_color_science" \
# -n "/projects/$name/syncolor" | sed 's/^/  /'
# echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# Add Shared colorsync policy to the project node using wiretap
/opt/Autodesk/wiretap/tools/current/wiretap_duplicate_node \
-s "/syncolor/policies/Shared/$proj_color_science" \
-n "/projects/$name/syncolor" | sed 's/^/  /'
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section makes links from a flame project to the job directory.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Set the umask to 0
umask 0

# -------------------------------------------------------------------------- #

# Set your new source directory and target job directories
src_dir="$flame_proj_dir"

tgt_job_dir="$jobs_dir/$nickname"
tgt_assets_dir="$tgt_job_dir/assets"
tgt_reference_dir="$tgt_job_dir/reference"
tgt_deliverables_dir="$tgt_job_dir/deliverables"
tgt_editorial_dir="$tgt_job_dir/editorial"
tgt_finals_dir="$tgt_deliverables_dir/finals"
tgt_wip_dir="$tgt_deliverables_dir/wip"
tgt_flame_archives_dir="$tgt_job_dir/flame_archives"
tgt_shots_dir="$tgt_job_dir/shots"
tgt_setups_dir="$tgt_job_dir/flame_setups"
tgt_version_dir="$tgt_setups_dir/$version"
tgt_workstation_dir="$tgt_version_dir/$workstation_name"

# -------------------------------------------------------------------------- #

# Create the target directories
mkdir -p "$tgt_assets_dir"
mkdir -p "$tgt_reference_dir"
mkdir -p "$tgt_deliverables_dir"
mkdir -p "$tgt_editorial_dir"
mkdir -p "$tgt_finals_dir"
mkdir -p "$tgt_wip_dir"
mkdir -p "$tgt_flame_archives_dir"
mkdir -p "$tgt_shots_dir"
mkdir -p "$tgt_setups_dir"
mkdir -p "$tgt_version_dir"
mkdir -p "$tgt_workstation_dir"
# -------------------------------------------------------------------------- #

# Loop through each symbolic link in the target setups directory
for link in "$tgt_workstation_dir"/*; do
    # Check if it is a symbolic link
    if [ -L "$link" ]; then
        # Unlink the symbolic link
        unlink "$link"
        echo -e "  Symbolic link removed: $link"
    fi
done

# -------------------------------------------------------------------------- #

echo -e "  Older symbolic links removed."
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# Loop through each subdir in the new source directory
for subdir in "$src_dir"/*; do
    # Check if it is a directory
    if [ -d "$subdir" ]; then
        # Extract the subdir name
        subdir_name=$(basename "$subdir")
        
        # Create a symbolic link in the target directory
        ln -s \
        "$subdir" "$tgt_workstation_dir/$subdir_name"
        
        # echo -e "  Symbolic link created for: $subdir_name"
    fi
done

# -------------------------------------------------------------------------- #

echo -e "  Symbolic links created."
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section copies files to the flame setups directory.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Copy $proj_creation_log_file to $flame_proj_dir/cfg.
cp "${proj_creation_log_file}" "${flame_proj_dir}/cfg"

# Copy $flame_proj_file to $flame_proj_dir/cfg.
cp "${flame_proj_file}" "${flame_proj_dir}/cfg"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section echoes end_banner04.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Display the end_title line.
echo -e "$end_banner_04\n"
echo -e "\n\n$separator\n$separator\n$separator\n\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

DELIMITER

# ========================================================================== #
# This section echoes end_banner01.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Display the end_title line.
echo -e ""
echo -e "$end_banner_01\n"
echo -e "\n\n$separator\n$separator\n$separator\n\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #
