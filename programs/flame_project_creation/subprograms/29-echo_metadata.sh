
# ========================================================================== #
# This section prints a summary of the new flame project metadata parameters.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Display summary for the flame project.
echo -e "  Flame Project Summary\n"
echo -e "  Project Name:        $name"
echo -e "  Project NickName:    $nickname"
echo -e "  Project Description: $description"
echo -e "  Shotgrid Name:       $shotgun_name"
echo -e "  Setup Directory:     $setup_dir"
echo -e "  Flame Framestore:    $partition"
echo -e "  Software Version:    $version"
echo -e "  Frame Width:         $frame_width"
echo -e "  Frame Height:        $frame_height"
echo -e "  Color Depth:         $frame_depth"
echo -e "  Aspect Ratio:        $aspect_ratio"
echo -e "  Field Dominance:     $field_dominance"
echo -e "  Frame Rate:          $frame_rate"
echo -e "  Start Frame:         $default_start_frame"
echo -e "  Color Policy:        $proj_color_science"
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# Make dated folders if necessary
mkdir -p "xml/$YYYY"
mkdir -p "xml/$YYYY/$MM"
mkdir -p "xml/$YYYY/$MM/$DD"

# Make a customized flame_proj_file file
flame_proj_file="xml/$YYYY/$MM/$DD/project_metadata_$name.xml"

# Check if flame_proj_file exists, create if not
if [ ! -e "$flame_proj_file" ]; then
    touch "$flame_proj_file"
fi

# Create or truncate flame_proj_file
echo -n '' > "$flame_proj_file"

# -------------------------------------------------------------------------- #

# Add metadata content to flame_proj_file
echo -n "<Project>" \
    >> "$flame_proj_file"

# Define an array with the key-value pairs
declare -a ProjectParameters=(
    "Name:$name"
    "Nickname:$nickname"
    "Description:$description"
    "ShotgunProjectName:$shotgun_name"
    "SetupDir:$setup_dir"
    "Partition:$partition"
    "Version:$version"
    "FrameWidth:$frame_width"
    "FrameHeight:$frame_height"
    "FrameDepth:$frame_depth"
    "AspectRatio:$aspect_ratio"
    "FieldDominance:$field_dominance"
    # "ProxyWidth:$proxy_width"
    # "ProxyWidthHint:$proxy_width_hint"
    # "ProxyMinFrameSize:$proxy_min_frame_size"
    # "ProxyAbove8bits:$proxy_above_8bits"
    # "ProxyQuality:$proxy_quality"
    # "ProxyRegenState:$proxy_regen_state"
    # "ProxyDepthMode:$proxy_depth_mode"
    # "ProxyDepth:$proxy_depth"
    # "BatchShaderPath:$matchbox_path"
    # "ActionLightOperatorPath:$lightbox_path"
    # "ActionShaderPath:$action_shader_path"
    # "HdrMode:$hdr_mode"
    # "HdrCmuType:$hdr_cmu_type"
    # "HdrMasteringId:$hdr_mastering_id"
    # "ProcessMode:$process_mode"
    # "IntermediatesProfile:$intermediates_profile"
    "FrameRate:$frame_rate"
    "DefaultStartFrame:$default_start_frame"
)

# Loop through the array and append each key-value pair to the file
for ProjectParameter in "${ProjectParameters[@]}"; do
    IFS=':' read -r key value <<< "$ProjectParameter"
    echo -n "<$key>$value</$key>" \
        >> "$flame_proj_file"
done

echo -n "</Project>" \
    >> "$flame_proj_file"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #
