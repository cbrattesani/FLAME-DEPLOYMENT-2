#!/bin/bash

# Define the list of libraries
libraries=("assets" "reference" "shots" "editorial" "deliverables")

# Create libraries using wiretap
for library in "${libraries[@]}"; do
    echo "Creating library: $library"
    /opt/Autodesk/wiretap/tools/current/wiretap_create_node \
        -n "/volumes/stonefs/$name" \
        -d "$library" \
        -s XML \
        | sed 's/^/  /'
    echo -e "\n$separator\n"
done

# Add Shared colorsync policy to the project node using wiretap
/opt/Autodesk/wiretap/tools/current/wiretap_duplicate_node \
-s "/syncolor/policies/Shared/$proj_color_science" \
-n "/projects/$name/syncolor" | sed 's/^/  /'
echo -e "\n$separator\n"
