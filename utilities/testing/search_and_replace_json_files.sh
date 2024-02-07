#!/bin/bash

set -ex

# Define the path to the current script in a variable called 'path_to_here'
path_to_here=$(cd $(dirname "$0") && pwd)

# change directory to path_to_here
cd $path_to_here

# Set the target job directory
# tgt_job_dir="$jobs_dir/$nickname"
tgt_job_dir="/JOBS/TEST_PROJECT"
name="TEST_PROJECT_2025_delta"

# Set the source and target files for copying
status_bookmarks_src="setups/status/cf_bookmarks.json"
status_bookmarks_tgt="test_bookmarks.json"

# Copy nodes to the batch Projects bin
cp $status_bookmarks_src $status_bookmarks_tgt

# Set the search and replace strings
search_string_01="/JOBS/PROJECT_NAME"
replace_string_01="$tgt_job_dir"
search_string_02="PROJECT_NAME_BOOKMARK"
replace_string_02="$name"
search_string_03="PROJECT_PATH_BOOKMARK"
replace_string_03="$name"
search_string_04="PROJECT_PRIVATEDATA_BOOKMARK"
replace_string_04="$name"
search_string_04="PROJECT_PRIVATEDATA_BOOKMARK"
replace_string_04="$name"

# Use sed to replace the strings in the JSON file
sed -i "s|$search_string_01|$replace_string_01|g" "$status_bookmarks_tgt"
sed -i "s|$search_string_02|$replace_string_02|g" "$status_bookmarks_tgt"
sed -i "s|$search_string_03|$replace_string_03|g" "$status_bookmarks_tgt"
sed -i "s|$search_string_04|$replace_string_04|g" "$status_bookmarks_tgt"

echo -e "  Project bookmarks created."
echo -e "\n$separator\n"
