import flame
import datetime

# Get the current project
current_project = flame.projects.current_project

# Print the name of the current project
print(f"Current project: {current_project.name}")

# Get the current workspace of the current project
current_workspace = current_project.current_workspace

# Print the name of the current workspace
print(f"Current workspace: {current_workspace.name}")

# List of library names to create
library_names = ['assets', 'reference', 'shots', 'editorial', 'work', 'deliverables']

# Create or retrieve libraries
for library_name in library_names:
    # Check if the library already exists in the current workspace
    library_exists = False
    for library in current_workspace.libraries:
        if library.name == library_name:
            library_exists = True
            this_library = library
            break
    
    # If the library doesn't exist, create it
    if not library_exists:
        this_library = current_workspace.create_library(name=library_name)
        print(f"New library '{library_name}' created successfully in the current workspace.")
    else:
        print(f"Library '{library_name}' already exists in the current workspace.")

    # Check if the library is not 'deliverables' to create dated folders
    if library_name != 'deliverables':
        # Get today's date in YYYY-MM-DD format
        today_date = datetime.date.today().strftime("%Y-%m-%d")
        
        # Check if today's dated folder already exists in the library
        dated_folder_exists = False
        for folder in this_library.folders:
            if folder.name == today_date:
                dated_folder_exists = True
                break

        # If today's dated folder doesn't exist, create it
        if not dated_folder_exists:
            try:
                new_folder = this_library.create_folder(name=today_date)
                print(f"New dated folder '{today_date}' created successfully in '{library_name}' library.")
            except Exception as e:
                print(f"Error creating dated folder in '{library_name}' library:")
                print(e)
        else:
            print(f"Dated folder '{today_date}' already exists in '{library_name}' library.")

# Check if the 'deliverables' library exists
deliverables_library_exists = False
for library in current_workspace.libraries:
    if library.name == 'deliverables':
        deliverables_library_exists = True
        deliverables_library = library
        break

# If the 'deliverables' library doesn't exist, create it
if not deliverables_library_exists:
    deliverables_library = current_workspace.create_library(name='deliverables')
    print("New library 'deliverables' created successfully in the current workspace.")
else:
    print("Library 'deliverables' already exists in the current workspace.")

# Check if the 'deliverables' library is successfully created
if deliverables_library:
    # Check if 'work-in-progress' exists in the 'deliverables' library
    work_in_progress_exists = False
    for folder in deliverables_library.folders:
        if folder.name == 'work-in-progress':
            work_in_progress_exists = True
            break

    # If 'work-in-progress' doesn't exist, create it
    if not work_in_progress_exists:
        try:
            new_folder1 = deliverables_library.create_folder(name='work-in-progress')
            print("New folder 'work-in-progress' created successfully in 'deliverables' library.")
        except Exception as e:
            print("Error creating 'work-in-progress' folder:")
            print(e)
    else:
        print("Folder 'work-in-progress' already exists in 'deliverables' library.")

    # Check if 'finals' exists in the 'deliverables' library
    finals_exists = False
    for folder in deliverables_library.folders:
        if folder.name == 'finals':
            finals_exists = True
            break

    # If 'finals' doesn't exist, create it
    if not finals_exists:
        try:
            new_folder2 = deliverables_library.create_folder(name='finals')
            print("New folder 'finals' created successfully in 'deliverables' library.")
        except Exception as e:
            print("Error creating 'finals' folder:")
            print(e)
    else:
        print("Folder 'finals' already exists in 'deliverables' library.")
