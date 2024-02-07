import flame

# Function to list reels in a reel group
def list_reels_in_reel_group(reel_group):
    reels = reel_group.reels
    if reels:
        print(f"Reels in reel group '{reel_group.name}':")
        for reel in reels:
            print(f"- {reel.name}")
    else:
        print(f"No reels found in reel group '{reel_group.name}'.")

# Function to list reel groups in a desktop
def list_reel_groups_in_desktop(desktop):
    reel_groups = desktop.reel_groups
    if reel_groups:
        print(f"Reel Groups in desktop '{desktop.name}':")
        for reel_group in reel_groups:
            print(f"- {reel_group.name}")
            # List reels in the current reel group
            list_reels_in_reel_group(reel_group)
    else:
        print(f"No reel groups found in desktop '{desktop.name}'.")

# Function to list desktops in a library
def list_desktops_in_library(library):
    desktops = library.desktops
    if desktops:
        print(f"Desktops in library '{library.name}':")
        for desktop in desktops:
            print(f"- {desktop.name}")
            # List reel groups in the current desktop
            list_reel_groups_in_desktop(desktop)
    else:
        print(f"No desktops found in library '{library.name}'.")

# Function to list libraries in the current workspace
def list_libraries(workspace):
    libraries = workspace.libraries
    if libraries:
        print("Libraries in the current workspace:")
        for library in libraries:
            print(f"- {library.name}")
            # List desktops and reel groups in the current library
            list_desktops_in_library(library)
    else:
        print("No libraries found in the current workspace.")

# Get the current project
current_project = flame.projects.current_project

# Check if a project is open
if current_project:
    print(f"Project: '{current_project.name}'")

    # Get the current workspace
    current_workspace = current_project.current_workspace
    if current_workspace:
        print(f"Workspace: '{current_workspace.name}'")
        
        # List libraries, desktops, reel groups, and reels in the current workspace
        list_libraries(current_workspace)
    else:
        print("No workspace found in the current project.")
else:
    print("No project is currently open.")
