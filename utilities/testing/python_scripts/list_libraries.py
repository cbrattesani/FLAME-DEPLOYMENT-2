import flame

# Function to list libraries in the current workspace
def list_libraries(workspace):
    libraries = workspace.libraries
    if libraries:
        print("Libraries in the current workspace:")
        for library in libraries:
            print(f"- {library.name}")
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
        
        # List libraries in the current workspace
        list_libraries(current_workspace)
    else:
        print("No workspace found in the current project.")
else:
    print("No project is currently open.")
