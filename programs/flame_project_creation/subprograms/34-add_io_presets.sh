
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
