
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
