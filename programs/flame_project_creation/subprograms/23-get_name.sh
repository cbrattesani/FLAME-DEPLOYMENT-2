
# ========================================================================== #
# This section gathers name information to create a new flame project.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Prompt user for $client
echo -e "  Please enter the client name for this project:\n"
echo -e " (The format should be lower case letters / numbers only):"
echo -e "  e.g. apple, bmw, chevron, delta, edison, 23andme"
echo -e "\n$separator\n"
read -p "  client name: " client
echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# Validate $client
if validate_input "$client"; then
    # Prompt user for $campaign
    echo -e "  Please enter the campaign name for this project:\n"
    echo -e " (The format should be lower case letters / numbers only):"
    echo -e "  e.g. iphone16, x5offroad, carwash, airmiles, rebate, dnatest"
    echo -e "\n$separator\n"
    read -p "  campaign name: " campaign
    echo -e "\n$separator\n"

    # ---------------------------------------------------------------------- #

    # Validate $campaign
    if validate_input "$campaign"; then
        # Construct $proj_nick
        proj_nick="$client"_"$campaign"

        # ------------------------------------------------------------------ #

        # Print the entered values
        echo -e "  client name: $client"
        echo -e "  campaign name: $campaign"
        # echo -e "  project nickname: $proj_nick"
        echo -e "\n$separator\n"
    else
        echo -e "Error: Invalid entry. Please enter letters or numbers only."
    fi
else
    echo -e "Error: Invalid entry. Please enter letters or numbers only."
fi

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #
