import flame
import datetime

# Get today's date in YYYY-MM-DD format
today_date = datetime.date.today().strftime("%Y-%m-%d")

# Get the current project
current_project = flame.projects.current_project

# Print the name of the current project
print(f"Current project: {current_project.name}")

# Get the current workspace of the current project
current_workspace = current_project.current_workspace

# Print the name of the current workspace
print(f"Current workspace: {current_workspace.name}")

# Get the current desktop
current_desktop = current_workspace.desktop

# Function to create or validate a reel in a library
def create_or_validate_reel(library, reel_name):
    # Check if the reel exists in the library
    for reel in library.reels:
        if reel.name == reel_name:
            print(f"Reel '{reel_name}' already exists in library '{library.name}'.")
            return reel
    
    # If the reel doesn't exist, create it
    new_reel = library.create_reel(name=reel_name)
    print(f"New reel '{reel_name}' created successfully in library '{library.name}'.")
    return new_reel

# Function to create or validate a folder in a library
def create_or_validate_folder(library, folder_name):
    # Check if the folder exists in the library
    for folder in library.folders:
        if folder.name == folder_name:
            print(f"Folder '{folder_name}' already exists in library '{library.name}'.")
            return folder
    
    # If the folder doesn't exist, create it
    new_folder = library.create_folder(name=folder_name)
    print(f"New folder '{folder_name}' created successfully in library '{library.name}'.")
    return new_folder

# Function to create or validate a library
def create_or_validate_library(workspace, library_name):
    # Check if the library exists in the workspace
    for library in workspace.libraries:
        if library.name == library_name:
            print(f"Library '{library_name}' already exists in workspace '{workspace.name}'.")
            return library
    
    # If the library doesn't exist, create it
    new_library = workspace.create_library(name=library_name)
    print(f"New library '{library_name}' created successfully in workspace '{workspace.name}'.")
    return new_library

# Validate or create 'playground' library
playground_library = create_or_validate_library(current_workspace, 'playground')

# Validate or create reel with today's date in 'playground' library
create_or_validate_folder(playground_library, 'scratchpad')

# Validate or create 'assets' library
assets_library = create_or_validate_library(current_workspace, 'assets')

# Validate or create reels in 'assets' library
create_or_validate_reel(assets_library, 'video')
create_or_validate_reel(assets_library, 'audio')
create_or_validate_reel(assets_library, 'cgi')
create_or_validate_reel(assets_library, 'graphics')
create_or_validate_reel(assets_library, 'slates')
create_or_validate_reel(assets_library, 'subtitles')

# Validate or create 'reference' library
reference_library = create_or_validate_library(current_workspace, 'reference')

# Validate or create reel with today's date in 'reference' library
create_or_validate_reel(reference_library, today_date)

# Validate or create 'shots' library
shots_library = create_or_validate_library(current_workspace, 'shots')

# Validate or create folder 'batch_groups' in 'shots' library
batch_groups_folder = create_or_validate_folder(shots_library, 'batch_groups')

# Validate or create 'editorial' library
editorial_library = create_or_validate_library(current_workspace, 'editorial')

# Validate or create folder 'decision_lists' in 'editorial' library
decision_lists_folder = create_or_validate_folder(editorial_library, 'decision_lists')

# Validate or create reels in 'decision_lists' folder
create_or_validate_reel(decision_lists_folder, today_date)

# Validate or create folder 'workprints' in 'editorial' library
workprints_folder = create_or_validate_folder(editorial_library, 'workprints')

# Validate or create reels in 'workprints' folder
create_or_validate_reel(workprints_folder, today_date)

# Validate or create 'deliverables' library
deliverables_library = create_or_validate_library(current_workspace, 'deliverables')

# Validate or create folder 'work-in-progress' in 'deliverables' library
work_in_progress_folder = create_or_validate_folder(deliverables_library, 'work-in-progress')

# Validate or create reel with today's date in 'work-in-progress' folder
create_or_validate_reel(work_in_progress_folder, today_date)

# Validate or create folder 'finals' in 'deliverables' library
finals_folder = create_or_validate_folder(deliverables_library, 'finals')

# Validate or create reel with today's date in 'finals' folder
create_or_validate_reel(finals_folder, today_date)

# Change the current desktop name to 'MyDesktopName'
current_desktop.name = today_date + '-playground'

# Print the name of the current desktop
print(f"Current desktop: {current_desktop.name}")
