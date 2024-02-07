
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
