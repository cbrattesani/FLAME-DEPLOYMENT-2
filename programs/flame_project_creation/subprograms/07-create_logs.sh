
# ========================================================================== #
# This section defines paths for activity logging.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Make dated folders if necessary
mkdir -p "logs/$YYYY"
mkdir -p "logs/$YYYY/$MM"
mkdir -p "logs/$YYYY/$MM/$DD"

# -------------------------------------------------------------------------- #

# Make a flame project creation log
proj_creation_log_file=\
"logs/$YYYY/$MM/$DD/$YYYY-$MM-$DD-$now_h_m-proj_creation_log"

# Redirect stdout and stderr to the log file
exec > >(tee -a "$proj_creation_log_file") 2>&1

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #
