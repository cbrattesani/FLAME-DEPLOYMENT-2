
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
