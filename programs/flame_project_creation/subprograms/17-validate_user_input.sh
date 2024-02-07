
# ========================================================================== #
# This section creates functions that validate user_input.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Function to validate input (letters or numbers only)
validate_input() {
    local input=$1
    if [[ "$input" =~ ^[a-zA-Z0-9]+$ ]]; then
        return 0  # Input is valid
    else
        return 1  # Input is invalid
    fi
}

# -------------------------------------------------------------------------- #

# Function to check if a given string is a number
is_number() {
  re='^[0-9]+$'
  if [[ $1 =~ $re ]]; then
    return 0  # It's a number
  else
    return 1  # It's not a number
  fi
}

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #
