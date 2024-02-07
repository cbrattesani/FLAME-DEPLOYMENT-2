
# ========================================================================== #
# This section validates or creates the JOBS directory.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Set the umask to 0
umask 0

# -------------------------------------------------------------------------- #

# Set the default for the Jobs Directory
jobs_dir="/JOBS"
echo -e "  Using the default Jobs Directory '/JOBS'."

# -------------------------------------------------------------------------- #

echo -e "\n$separator\n"

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #

# # Function to check if macOS version is 11 or newer
# is_macos_11_or_newer() {
#     version=$(sw_vers -productVersion)
#     major_version=$(echo "$version" | cut -d. -f1)
#     if [ "$major_version" -ge 11 ]; then
#         return 0
#     else
#         return 1
#     fi
# }

# # Function to prompt for admin password
# prompt_for_admin_password() {
#     read -sp "Please enter your admin password: " admin_password
#     echo
# }

# # 1. Set up path_to_here variable
# path_to_here=$(dirname "$(readlink -f "$0")")

# # 2. Change directory to path_to_here
# cd "$path_to_here"

# # 3. Create variable called uname_result where linux = 1, macos = 2, macos11ornewer = 3
# uname_result=0

# # 4. Check operating system
# if [ "$(uname -s)" == "Linux" ]; then
#     uname_result=1
#     echo "Running on Linux"
# elif [ "$(uname -s)" == "Darwin" ]; then
#     uname_result=2
#     echo "Running on macOS"
    
#     # 5. Check for macOS 11 or newer
#     if is_macos_11_or_newer; then
#         uname_result=3
#         echo "macOS 11 or newer detected"
#     else
#         echo "macOS version is not 11 or newer"
#     fi
# else
#     echo "Unsupported operating system"
# fi

# # 5. Check for /JOBS
# jobs_directory="/JOBS"
# if [ -d "$jobs_directory" ]; then
#     echo "Directory '$jobs_directory' exists"
# else
#     echo "Directory '$jobs_directory' does not exist"

#     # 6. Actions based on uname_result
#     case $uname_result in
#         1)  # Linux
#             # Prompt for admin password
#             prompt_for_admin_password
            
#             # Create /JOBS
#             mkdir "$jobs_directory"
#             if [ $? -eq 0 ]; then
#                 echo "Directory '$jobs_directory' created successfully"

#                 # Prompt user to choose folder from file browser
#                 # Link chosen folder to /JOBS or provide option to keep /JOBS as a directory not a link
#                 # Additional Linux-specific logic here...

#                 echo "All tasks completed successfully"
#             else
#                 echo "Failed to create directory '$jobs_directory'"
#             fi
#             ;;

#         2)  # macOS
#             # Prompt for admin password
#             prompt_for_admin_password
            
#             # Create /JOBS
#             mkdir "$jobs_directory"
#             if [ $? -eq 0 ]; then
#                 echo "Directory '$jobs_directory' created successfully"

#                 # Prompt user to choose folder from file browser
#                 # Link chosen folder to /JOBS
#                 # Additional macOS-specific logic here...

#                 echo "All tasks completed successfully"
#             else
#                 echo "Failed to create directory '$jobs_directory'"
#             fi
#             ;;

#         3)  # macOS 11 or newer
#             # Prompt for admin password
#             prompt_for_admin_password
            
#             # Check for /etc/synthetic.conf
#             synthetic_conf="/etc/synthetic.conf"
#             if [ -f "$synthetic_conf" ]; then
#                 echo "/etc/synthetic.conf exists"
#             else
#                 echo "/etc/synthetic.conf does not exist"
#                 # Create /etc/synthetic.conf
#                 touch "$synthetic_conf"
#             fi

#             # Check for /JOBS entry in /etc/synthetic.conf
#             grep -q "/JOBS" "$synthetic_conf"
#             if [ $? -ne 0 ]; then
#                 # Add an entry for /JOBS
#                 echo "/JOBS" | sudo tee -a "$synthetic_conf" > /dev/null
#             fi

#             # Prompt user to choose folder from file browser
#             # Link chosen folder to /JOBS
#             # Additional macOS 11-specific logic here...

#             echo "All tasks completed successfully"
#             ;;
#     esac
# fi

# # 9. Only exit the script if the user does not have administration privileges
# if [ "$uname_result" -ne 1 ]; then
#     echo "Press Enter to quit the script."
#     read -r
# fi
