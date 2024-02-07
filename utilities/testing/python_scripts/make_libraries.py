import flame

def create_libraries(library_names):
    # Get the current project and workspace
    current_project = flame.projects.current_project
    print(f"Project:   '{current_project.name}'.")

    current_workspace = current_project.current_workspace
    print(f"Workspace: '{current_workspace.name}'.")

    for library_name in library_names:
        # Check if the library already exists
        existing_libraries = current_workspace.libraries
        if library_name in existing_libraries:
            print(f"Library:   '{library_name}' already exists.")
        else:
            # Create a new library
            new_library = current_workspace.create_library(name=library_name)
            print(f"Library:   '{library_name}' created successfully.")

# List of library names
library_names = ["assets", "reference", "shots", "editorial", "deliverables"]

# Create libraries
create_libraries(library_names)
