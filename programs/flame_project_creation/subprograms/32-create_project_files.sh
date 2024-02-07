
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

tgt_rsync_dir="$tgt_job_dir/backup_scripts"
mkdir -p "$tgt_rsync_dir"

# Set the source and target files for copying
src_rsync_script="setups/job_backup_script_body.txt"
tgt_rsync_script="$tgt_rsync_dir/backup_$name.sh"

echo -e "  Creating flame project backup script.\n"

# Copy the default job backup text to a new backup shell script
cp $src_rsync_script $tgt_rsync_script

# Add execution permissions to new backup shell script
chmod +x $tgt_rsync_script

# Set the search and replace strings
search_string_01="BACKUP_SCRIPT_NAME"
replace_string_01="backup_$name.sh"
search_string_02="BACKUP_SCRIPT_PROJECT"
replace_string_02="$nickname"
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

# Use sed to replace the strings in the backup script
if [ "$operating_system" == "Linux" ]; then
    sed -i "s|$search_string_01|$replace_string_01|g" "$tgt_rsync_script"
    sed -i "s|$search_string_02|$replace_string_02|g" "$tgt_rsync_script"
    sed -i "s|$search_string_03|$replace_string_03|g" "$tgt_rsync_script"
    sed -i "s|$search_string_04|$replace_string_04|g" "$tgt_rsync_script"
    sed -i "s|$search_string_05|$replace_string_05|g" "$tgt_rsync_script"
    sed -i "s|$search_string_06|$replace_string_06|g" "$tgt_rsync_script"
    sed -i "s|$search_string_07|$replace_string_07|g" "$tgt_rsync_script"
    sed -i "s|$search_string_08|$replace_string_08|g" "$tgt_rsync_script"
elif [ "$operating_system" == "macOS" ]; then
    sed -i '' "s|$search_string_01|$replace_string_01|g" "$tgt_rsync_script"
    sed -i '' "s|$search_string_02|$replace_string_02|g" "$tgt_rsync_script"
    sed -i '' "s|$search_string_03|$replace_string_03|g" "$tgt_rsync_script"
    sed -i '' "s|$search_string_04|$replace_string_04|g" "$tgt_rsync_script"
    sed -i '' "s|$search_string_05|$replace_string_05|g" "$tgt_rsync_script"
    sed -i '' "s|$search_string_06|$replace_string_06|g" "$tgt_rsync_script"
    sed -i '' "s|$search_string_07|$replace_string_07|g" "$tgt_rsync_script"
    sed -i '' "s|$search_string_08|$replace_string_08|g" "$tgt_rsync_script"
else
    echo "Unsupported operating system."
    exit 1
fi

echo -e "\n  Flame project backup script created."
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #
