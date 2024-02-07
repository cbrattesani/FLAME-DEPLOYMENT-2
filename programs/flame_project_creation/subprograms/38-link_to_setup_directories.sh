
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
tgt_rsync_dir="$tgt_job_dir/backup_scripts"
tgt_config_dir="$tgt_job_dir/config"
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
mkdir -p "$tgt_rsync_dir"
mkdir -p "$tgt_config_dir"
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
