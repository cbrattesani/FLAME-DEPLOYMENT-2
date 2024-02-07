import inspect
import flame

# Get all attributes of the autodesk flame package
attributes = dir(flame)

# Filter for classes
classes = [a for a in attributes if inspect.isclass(getattr(flame, a))]

# Create dictionary to store methods, functions, and attributes
class_info = {}

# Define the output file
output_file = "/home/pman/workspace/GitHub/FLAME-PYTHON/man_made/deployment_tools/query_flame_results.txt"

# Open the output file
with open(output_file, "w") as f:
    # Loop through each class
    for cls in classes:
        # Get class object
        class_obj = getattr(flame, cls)

        # Filter methods, functions, and attributes
        methods = [a for a in dir(class_obj) if inspect.ismethod(getattr(class_obj, a))]
        functions = [a for a in dir(class_obj) if not inspect.isfunction(getattr(class_obj, a))]
        attributes = [a for a in dir(class_obj) if not inspect.ismethod(getattr(class_obj, a)) and not inspect.isfunction(getattr(class_obj, a))]

        # Store information in dictionary
        class_info[cls] = {"methods": methods, "functions": functions, "attributes": attributes}

    # Write information to file
    for cls, info in class_info.items():
        f.write(f"{cls} - class\n")

        for method in info["methods"]:
            f.write(f"\t- {method} - class method\n")

        # for attribute in info["attributes"]:
        #     f.write(f"\t- {attribute} - attribute\n")

        for function in info["functions"]:
            f.write(f"\t- {function} - function\n")

    # Write the completion message
    f.write(f"Class information written to: {output_file}")
