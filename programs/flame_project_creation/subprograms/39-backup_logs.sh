
# ========================================================================== #
# This section copies files to the flame setups directory.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Copy $proj_creation_log_file to $flame_proj_dir/cfg.
cp "${proj_creation_log_file}" "${flame_proj_dir}/cfg"

# Move $proj_creation_log_file to $tgt_config_dir.
mv "${proj_creation_log_file}" "${tgt_config_dir}"

echo -e "  Project creation log backed up to config directory."
echo -e "\n$separator\n"

# Copy $flame_proj_file to $flame_proj_dir/cfg.
cp "${flame_proj_file}" "${flame_proj_dir}/cfg"

# Move $flame_proj_file to $tgt_config_dir.
mv "${flame_proj_file}" "${tgt_config_dir}"

echo -e "  Project metadata xml backed up to config directory."
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #
