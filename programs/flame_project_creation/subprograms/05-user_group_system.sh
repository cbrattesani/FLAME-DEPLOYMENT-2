
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
