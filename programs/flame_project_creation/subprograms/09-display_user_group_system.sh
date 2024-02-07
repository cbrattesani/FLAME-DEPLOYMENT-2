
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
