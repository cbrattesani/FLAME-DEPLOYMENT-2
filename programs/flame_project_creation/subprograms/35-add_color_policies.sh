
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
