import flame

# --------------------------------------------------------------------------- #
def get_action_by_name(name):
    """
    Retrieves an action by its name using the Action object.

    Args:
        name: The name of the action to retrieve.

    Returns:
        The retrieved action object or None if not found.
    """
    return Action.get_action_by_name(name)
def get_actions():
    """
    Retrieves a list of all available actions using the Action object.

    Returns:
        A list of available action objects.
    """
    return Action.get_actions()
def get_built_in_actions():
    """
    Retrieves a list of built-in actions using the Action object.

    Returns:
        A list of built-in action objects.
    """
    return Action.get_built_in_actions()
def run_action(action_name, options={}):
    """
    Runs a specific action identified by its name.

    Args:
        action_name: The name of the action to run.
        options: An optional dictionary of options to pass to the action.

    Returns:
        None
    """
    Action.run_action(action_name, options=options)

# --------------------------------------------------------------------------- #
def batch_go_to():
    """
    Applies the "Go To" action to all reels in the active batch group.

    Returns:
        None
    """
    Batch.batch_go_to()
def batch_is_valid_input(input_value):
    """
    Checks if the provided input value is valid for use with the active batch action.

    Args:
        input_value: The value to be validated.

    Returns:
        True if the value is valid, False otherwise.
    """
    return Batch.batch_is_valid_input(input_value)
def batch_organize():
    """
    Organizes the reels in the active batch group according to their order in the group.

    Returns:
        None
    """
    Batch.batch_organize()
def clear_groups():
    """
    Clears all groups from the current project.

    Returns:
        None
    """
    Batch.clear_groups()
def clear_reels():
    """
    Clears all reels from the current project.

    Returns:
        None
    """
    Batch.clear_reels()
def create_batch_group(name, start_frame, duration, reels, shelf_reels, user_data=None):
    """
    Creates a new batch group with the specified name, start frame, duration, reels, shelf reels, and optional user data.

    Args:
        name: The name of the new batch group.
        start_frame: The starting frame of the batch group.
        duration: The duration of the batch group in frames.
        reels: A list of reels to include in the batch group.
        shelf_reels: A list of shelf reels to include in the batch group.
        user_data: Optional dictionary of user-defined data to attach to the batch group.

    Returns:
        The newly created batch group object.
    """
    return Batch.create_batch_group(name, start_frame, duration, reels, shelf_reels, user_data)
def create_group(name, duration=100):
    """
    Creates a new group with the specified name and duration.

    Args:
        name: The name of the new group.
        duration: The duration of the group in frames (defaults to 100).

    Returns:
        The newly created group object.
    """
    return Batch.create_group(name, duration)
def create_reel(name, user_data=None):
    """
    Creates a new reel with the specified name and optional user data.

    Args:
        name: The name of the new reel.
        user_data: Optional dictionary of user-defined data to attach to the reel.

    Returns:
        The newly created reel object.
    """
    return Batch.create_reel(name, user_data)
def delete_group(group):
    """
    Deletes the specified group from the project.

    Args:
        group: The group to delete.

    Returns:
        None
    """
    Batch.delete_group(group)
def delete_reel(reel):
    """
    Deletes the specified reel from the project.

    Args:
        reel: The reel to delete.

    Returns:
        None
    """
    Batch.delete_reel(reel)
def export_clips(clips, path, start_frame=1, format="DPX", codec="DPX", range_type="Custom", options={}):
    """
    Exports the specified clips to the given path with optional start frame, format, codec, range type, and options.

    Args:
        clips: A list of clips to export.
        path: The path to export the clips to.
        start_frame: The starting frame to export from (defaults to 1).
        format: The file format to export the clips to (defaults to "DPX").
        codec: The video codec to use for export (defaults to "DPX").
        range_type: The range type to use for export (defaults to "Custom").
        options: A dictionary of optional export settings.

    Returns:
        None
    """
    Batch.export_clips(clips, path, start_frame, format, codec, range_type, options)
def get_active_batch_group():
    """
    Retrieves the currently active batch group.

    Returns:
        The active batch group object, or None if no batch group is active.
    """
    return Batch.get_active_batch_group()
def get_active_group():
    """
    Retrieves the currently active group.

    Returns:
        The active group object, or None if no group is active.
    """
    return Batch.get_active_group()
def get_active_reel():
    """
    Retrieves the currently active reel.

    Returns:
        The active reel object, or None if no reel is active.
    """
    return Batch.get_active_reel()
def get_batch_group(name=None):
    """
    Retrieves a batch group by its name.

    Args:
        name: The name of the batch group to retrieve (optional, defaults to the active batch group).

    Returns:
        The requested batch group object, or None if not found.
    """
    return Batch.get_batch_group(name)
def get_group(name):
    """
    Retrieves a group by its name.

    Args:
        name: The name of the group to retrieve.

    Returns:
        The requested group object, or None if not found.
    """
    return Batch.get_group(name)
def get_reel(name):
    """
    Retrieves a reel by its name.

    Args:
        name: The name of the reel to retrieve.

    Returns:
        The requested reel object, or None if not found.
    """
    return Batch.get_reel(name)
def get_reels():
    """
    Retrieves a list of all reels in the current project.

    Returns:
        A list of reel objects.
    """
    return Batch.get_reels()
def go_to():
    """
    Applies the "Go To" action to the currently active reel.

    Returns:
        None
    """
    Batch.go_to()
def import_clips(path, destination, start_frame=1, overwrite=False):
    """
    Imports clips from the specified path and adds them to the project.

    Args:
        path: The path to the clips to import.
        destination: The destination folder to import the clips to.
        start_frame: The starting frame for the imported clips (defaults to 1).
        overwrite: Whether to overwrite existing clips with the same name (defaults to False).

    Returns:
        A list of imported clip objects.
    """
    return Batch.import_clips(path, destination, start_frame, overwrite)
def set_group_duration(group, duration):
    """
    Sets the duration of the specified group.

    Args:
        group: The group to set the duration for.
        duration: The new duration of the group in frames.

    Returns:
        None
    """
    Batch.set_group_duration(group, duration)
def set_reel_order(reels):
    """
    Sets the order of the reels in the active batch group.

    Args:
        reels: A list of reels in the desired order.

    Returns:
        None
    """
    Batch.set_reel_order(reels)
def get_batch_action_parameters(action_name):
    """
    Retrieves the parameters for a specific batch action.

    Args:
        action_name: The name of the batch action.

    Returns:
        A dictionary containing information about the action's parameters.
    """
    return flame.batch.actions.get_batch_action_parameters(action_name)
def get_built_in_batch_action_parameter_attributes(action_name, parameter_name):
    """
    Retrieves the attributes for a specific parameter of a built-in batch action.

    Args:
        action_name: The name of the batch action.
        parameter_name: The name of the parameter to get attributes for.

    Returns:
        A dictionary containing information about the parameter's attributes.
    """
    return flame.batch.actions.get_built_in_batch_action_parameter_attributes(action_name, parameter_name)
def run_built_in_batch_action(action_name, options={}):
    """
    Runs a built-in batch action with the specified name and optional settings.

    Args:
        action_name: The name of the built-in batch action to run.
        options: A dictionary of key-value pairs representing the options to be passed to the action.

    Returns:
        None
    """
    flame.batch.actions.run_built_in_batch_action(action_name, options=options)
def create_render_job(comp, path, format="DPX", codec="DPX", range_type="Custom", options={}):
    """
    Creates a new render job for the specified comp and saves it to the given path.

    Args:
        comp: The Flame composition to render.
        path: The path to save the rendered output.
        format: The file format to use for the rendered output (defaults to "DPX").
        codec: The video codec to use for the rendered output (defaults to "DPX").
        range_type: The range type to use for the render (defaults to "Custom").
        options: A dictionary of optional render settings.

    Returns:
        The newly created render job object.
    """
    return flame.batch.render.create_render_job(
        comp, path, format=format, codec=codec, range_type=range_type, options=options
    )
def get_render_job_by_name(name):
    """
    Retrieves a render job by its name.

    Args:
        name: The name of the render job to retrieve.

    Returns:
        The render job object or None if not found.
    """
    return flame.batch.render.get_render_job_by_name(name)
def get_render_jobs():
    """
    Retrieves a list of all existing render jobs.

    Returns:
        A list of render job objects.
    """
    return flame.batch.render.get_render_jobs()
def monitor_render_job(job):
    """
    Monitors the progress of a render job.

    Args:
        job: The render job to monitor.

    Returns:
        None
    """
    flame.batch.render.monitor_render_job(job)
def remove_render_job(job):
    """
    Removes a render job from the Flame batch system.

    Args:
        job: The render job to remove.

    Returns:
        None
    """
    flame.batch.render.remove_render_job(job)

# --------------------------------------------------------------------------- #
def get_clip_by_sequence(sequence, name):
    """
    Retrieves a clip by its sequence number and name.

    Args:
        sequence: The sequence number of the clip to retrieve.
        name: The name of the clip to retrieve.

    Returns:
        The clip object or None if not found.
    """
    return Clip.get_clip_by_sequence(sequence, name)
def get_clips_by_name(name):
    """
    Retrieves all clips with the specified name.

    Args:
        name: The name of the clip to retrieve.

    Returns:
        A list of clip objects.
    """
    return Clip.get_clips_by_name(name)
def get_clips_by_path(path):
    """
    Retrieves all clips that are located at the specified path.

    Args:
        path: The path to search for clips.

    Returns:
        A list of clip objects.
    """
    return Clip.get_clips_by_path(path)
def get_segments_by_clip(clip):
    """
    Retrieves all segments associated with the specified clip.

    Args:
        clip: The clip to get segments for.

    Returns:
        A list of segment objects.
    """
    return Clip.get_segments_by_clip(clip)
def get_source_clip(clip):
    """
    Retrieves the source clip of a subclip.

    Args:
        clip: The subclip to get the source clip of.

    Returns:
        The source clip object or None if the clip is not a subclip.
    """
    return Clip.get_source_clip(clip)

# --------------------------------------------------------------------------- #
def convert_color_space(image, input_color_space, output_color_space):
    """
    Converts the color space of an image.

    Args:
        image: The image to convert.
        input_color_space: The current color space of the image.
        output_color_space: The desired color space to convert to.

    Returns:
        A new image with the converted color space.
    """
    return Color.convert_color_space(image, input_color_space, output_color_space)
def get_color_space_by_name(name):
    """
    Retrieves a color space by its name.

    Args:
        name: The name of the color space to retrieve.

    Returns:
        The color space object or None if not found.
    """
    return Color.get_color_space_by_name(name)
def get_color_spaces():
    """
    Retrieves a list of all available color spaces.

    Returns:
        A list of color space objects.
    """
    return Color.get_color_spaces()
def set_color_space_of_node(node, color_space):
    """
    Sets the color space of a node in the Flame composition.

    Args:
        node: The node to set the color space for.
        color_space: The color space to set.

    Returns:
        None
    """
    return Color.set_color_space_of_node(node, color_space)

# --------------------------------------------------------------------------- #
def add_timeline_fx(timeline_fx, track_index, group_index=None):
    """
    Adds a timeline FX to the specified track and group in the current composition.

    Args:
        timeline_fx: The timeline FX to add.
        track_index: The index of the track to add the FX to.
        group_index: The optional index of the group within the track to add the FX to.

    Returns:
        None
    """
    Comp.add_timeline_fx(timeline_fx, track_index, group_index)
def create_comp(name, user_data=None):
    """
    Creates a new composition with the specified name and optional user data.

    Args:
        name: The name of the new composition.
        user_data: Optional dictionary of user-defined data to attach to the composition.

    Returns:
        The newly created composition object.
    """
    return Comp.create_comp(name, user_data)
def delete_comp(comp):
    """
    Deletes the specified composition.

    Args:
        comp: The composition to delete.

    Returns:
        None
    """
    Comp.delete_comp(comp)
def get_all_comps():
    """
    Retrieves a list of all existing compositions.

    Returns:
        A list of composition objects.
    """
    return Comp.get_all_comps()
def get_comp(name):
    """
    Retrieves a composition by its name.

    Args:
        name: The name of the composition to retrieve.

    Returns:
        The composition object or None if not found.
    """
    return Comp.get_comp(name)
def get_current_comp():
    """
    Retrieves the currently active composition.

    Returns:
        The active composition object or None if no composition is open.
    """
    return Comp.get_current_comp()
def get_output_media(comp):
    """
    Retrieves the output media settings for the specified composition.

    Args:
        comp: The composition to get the output media for.

    Returns:
        A dictionary containing the output media settings.
    """
    return Comp.get_output_media(comp)
def get_render_settings(comp):
    """
    Retrieves the render settings for the specified composition.

    Args:
        comp: The composition to get the render settings for.

    Returns:
        A dictionary containing the render settings.
    """
    return Comp.get_render_settings(comp)
def get_sequence_reels(comp):
    """
    Retrieves a list of all sequence reels associated with the specified composition.

    Args:
        comp: The composition to get the sequence reels for.

    Returns:
        A list of sequence reel objects.
    """
    return Comp.get_sequence_reels(comp)
def open_comp(name):
    """
    Opens an existing composition by its name.

    Args:
        name: The name of the composition to open.

    Returns:
        The opened composition object or None if not found.
    """
    return Comp.open_comp(name)
def remove_timeline_fx(timeline_fx):
    """
    Removes a timeline FX from the current composition.

    Args:
        timeline_fx: The timeline FX to remove.

    Returns:
        None
    """
    Comp.remove_timeline_fx(timeline_fx)
def render_comp(comp, path, format="DPX", codec="DPX", range_type="Custom", options={}):
    """
    Renders the specified composition to the given path with optional settings.

    Args:
        comp: The composition to render.
        path: The path to save the rendered output.
        format: The file format to use for the rendered output (defaults to "DPX").
        codec: The video codec to use for the rendered output (defaults to "DPX").
        range_type: The range type to use for the render (defaults to "Custom").
        options: A dictionary of optional render settings.

    Returns:
        None
    """
    Comp.render_comp(comp, path, format=format, codec=codec, range_type=range_type, options=options)
def save_comp(comp, path):
    """
    Saves the specified composition to the given path.

    Args:
        comp: The composition to save.
        path: The path to save the composition file.

    Returns:
        None
    """
    Comp.save_comp(comp, path)
def set_current_comp(comp):
    """
    Sets the specified composition as the active composition.

    Args:
        comp: The composition to set as the current composition.

    Returns:
        None
    """
    Comp.set_current_comp(comp)
def set_output_media(comp, media):
    """
    Sets the output media settings for the specified composition.

    Args:
        comp: The composition to set the output media for.
        media: A dictionary containing the output media settings.

    Returns:
        None
    """
    Comp.set_output_media(comp, media)
def set_render_settings(comp, settings):
    """
    Sets the render settings for the specified composition.

    Args:
        comp: The composition to set the render settings for.
        settings: A dictionary containing the render settings.

    Returns:
        None
    """
    Comp.set_render_settings(comp, settings)

# --------------------------------------------------------------------------- #
def add_media_to_group(media_group, media):
    """
    Adds the specified media item to the given media group.

    Args:
        media_group: The media group to add the media to.
        media: The media item to add.

    Returns:
        None
    """
    Media.add_media_to_group(media_group, media)
def create_media_group(name, user_data=None):
    """
    Creates a new media group with the specified name and optional user data.

    Args:
        name: The name of the new media group.
        user_data: Optional dictionary of user-defined data to attach to the group.

    Returns:
        The newly created media group object.
    """
    return Media.create_media_group(name, user_data)
def delete_media_group(media_group):
    """
    Deletes the specified media group.

    Args:
        media_group: The media group to delete.

    Returns:
        None
    """
    Media.delete_media_group(media_group)
def get_media_by_name(name):
    """
    Retrieves a media item by its name.

    Args:
        name: The name of the media item to retrieve.

    Returns:
        The media item object or None if not found.
    """
    return Media.get_media_by_name(name)
def get_media_by_path(path):
    """
    Retrieves a media item by its path.

    Args:
        path: The path to the media item.

    Returns:
        The media item object or None if not found.
    """
    return Media.get_media_by_path(path)
def get_media_group_by_name(name):
    """
    Retrieves a media group by its name.

    Args:
        name: The name of the media group to retrieve.

    Returns:
        The media group object or None if not found.
    """
    return Media.get_media_group_by_name(name)
def get_media_groups():
    """
    Retrieves a list of all existing media groups.

    Returns:
        A list of media group objects.
    """
    return Media.get_media_groups()
def get_media(name):
    """
    Retrieves a media item by its name. (Alias of `get_media_by_name`)

    Args:
        name: The name of the media item to retrieve.

    Returns:
        The media item object or None if not found.
    """
    return Media.get_media(name)
def remove_media_from_group(media_group, media):
    """
    Removes the specified media item from the given media group.

    Args:
        media_group: The media group to remove the media from.
        media: The media item to remove.

    Returns:
        None
    """
    Media.remove_media_from_group(media_group, media)
def read_image(path):
    """
    Reads an image file from disk and returns it as a Flame image object.

    Args:
        path: The path to the image file.

    Returns:
        The image object or None if the file cannot be read.
    """
    return flame.media.image_io.read_image(path)
def write_image(image, path):
    """
    Writes a Flame image object to a file on disk.

    Args:
        image: The image object to write.
        path: The path to save the image file.

    Returns:
        None
    """
    return flame.media.image_io.write_image(image, path)
def get_image_sequence_frame_count(path):
    """
    Retrieves the total number of frames in an image sequence.

    Args:
        path: The path to the image sequence.

    Returns:
        The number of frames in the sequence.
    """
    return flame.media.image_sequence.get_image_sequence_frame_count(path)
def read_image_sequence(path, start_frame=1, end_frame=-1):
    """
    Reads a range of frames from an image sequence and returns them as a list of Flame image objects.

    Args:
        path: The path to the image sequence.
        start_frame: The first frame to read (inclusive). Defaults to 1.
        end_frame: The last frame to read (inclusive). Defaults to -1 (all frames).

    Returns:
        A list of image objects representing the selected frames.
    """
    return flame.media.image_sequence.read_image_sequence(path, start_frame, end_frame)
def write_image_sequence(image_frames, path, start_frame=1, format="DPX", codec="DPX"):
    """
    Writes a sequence of Flame image objects to a file on disk as an image sequence.

    Args:
        image_frames: A list of image objects to write.
        path: The path to save the image sequence.
        start_frame: The first frame number to use in the sequence. Defaults to 1.
        format: The file format to use for the image sequence (defaults to "DPX").
        codec: The video codec to use for the image sequence (defaults to "DPX").

    Returns:
        None
    """
    return flame.media.image_sequence.write_image_sequence(image_frames, path, start_frame, format, codec)

# --------------------------------------------------------------------------- #
def connect_nodes(node1, output_name1, node2, input_name2):
    """
    Connects the specified output of `node1` to the specified input of `node2`.

    Args:
        node1: The node with the output to connect.
        output_name1: The name of the output on `node1` to connect.
        node2: The node with the input to connect.
        input_name2: The name of the input on `node2` to connect.

    Returns:
        None
    """
    Nodes.connect_nodes(node1, output_name1, node2, input_name2)
def create_node(node_type, name=None, user_data=None):
    """
    Creates a new node of the specified type with optional name and user data.

    Args:
        node_type: The type of node to create.
        name: The optional name to assign to the node.
        user_data: An optional dictionary of user-defined data to attach to the node.

    Returns:
        The newly created node object.
    """
    return Nodes.create_node(node_type, name, user_data)
def delete_node(node):
    """
    Deletes the specified node.

    Args:
        node: The node to delete.

    Returns:
        None
    """
    Nodes.delete_node(node)
def disconnect_nodes(node1, output_name1, node2, input_name2):
    """
    Disconnects the specified output of `node1` from the specified input of `node2`.

    Args:
        node1: The node with the output to disconnect.
        output_name1: The name of the output on `node1` to disconnect.
        node2: The node with the input to disconnect.
        input_name2: The name of the input on `node2` to disconnect.

    Returns:
        None
    """
    Nodes.disconnect_nodes(node1, output_name1, node2, input_name2)
def get_node_attributes(node):
    """
    Retrieves a dictionary containing the attributes of the specified node.

    Args:
        node: The node to get attributes for.

    Returns:
        A dictionary containing the node attributes.
    """
    return Nodes.get_node_attributes(node)
def get_node(name):
    """
    Retrieves a node by its name.

    Args:
        name: The name of the node to retrieve.

    Returns:
        The node object or None if not found.
    """
    return Nodes.get_node(name)
def set_node_attribute(node, attribute_name, value):
    """
    Sets the value of a specific attribute on the specified node.

    Args:
        node: The node to set the attribute on.
        attribute_name: The name of the attribute to set.
        value: The value to set the attribute to.

    Returns:
        None
    """
    Nodes.set_node_attribute(node, attribute_name, value)
def connect_nodes(node1, output_name1, node2, input_name2):
    """
    Connects the specified output of `node1` to the specified input of `node2`.

    Args:
        node1: The node with the output to connect.
        output_name1: The name of the output on `node1` to connect.
        node2: The node with the input to connect.
        input_name2: The name of the input on `node2` to connect.

    Returns:
        None
    """
    flame.nodes.node_connections.connect_nodes(node1, output_name1, node2, input_name2)
def disconnect_nodes(node1, output_name1, node2, input_name2):
    """
    Disconnects the specified output of `node1` from the specified input of `node2`.

    Args:
        node1: The node with the output to disconnect.
        output_name1: The name of the output on `node1` to disconnect.
        node2: The node with the input to disconnect.
        input_name2: The name of the input on `node2` to disconnect.

    Returns:
        None
    """
    flame.nodes.node_connections.disconnect_nodes(node1, output_name1, node2, input_name2)
def get_node_connections():
    """
    Retrieves a list of all node connections in the current composition.

    Returns:
        A list of dictionaries containing information about each connection.
    """
    return flame.nodes.node_connections.get_node_connections()
def get_node_input_connections(node):
    """
    Retrieves a list of all input connections for the specified node.

    Args:
        node: The node to get input connections for.

    Returns:
        A list of dictionaries containing information about each input connection.
    """
    return flame.nodes.node_connections.get_node_input_connections(node)
def get_node_output_connections(node):
    """
    Retrieves a list of all output connections for the specified node.

    Args:
        node: The node to get output connections for.

    Returns:
        A list of dictionaries containing information about each output connection.
    """
    return flame.nodes.node_connections.get_node_output_connections(node)
def get_built_in_node_types():
    """
    Retrieves a list of all built-in node types available in Flame.

    Returns:
        A list of strings representing the names of the built-in node types.
    """
    return flame.nodes.node_types.get_built_in_node_types()
def get_node_type_attributes(node_type):
    """
    Retrieves a dictionary containing the attributes for the specified node type.

    Args:
        node_type: The name of the node type to get attributes for.

    Returns:
        A dictionary containing the node type attributes or None if the type is not found.
    """
    return flame.nodes.node_types.get_node_type_attributes(node_type)
def get_node_type_by_name(name):
    """
    Retrieves the node type object for the specified node type name.

    Args:
        name: The name of the node type to retrieve.

    Returns:
        The node type object or None if the type is not found.
    """
    return flame.nodes.node_types.get_node_type_by_name(name)
def get_node_type_category(node_type):
    """
    Retrieves the category of the specified node type.

    Args:
        node_type: The name of the node type to get the category for.

    Returns:
        The category of the node type as a string or None if the type is not found.
    """
    return flame.nodes.node_types.get_node_type_category(node_type)
def get_node_type_description(node_type):
    """
    Retrieves a description of the specified node type.

    Args:
        node_type: The name of the node type to get the description for.

    Returns:
        The description of the node type as a string or None if the type is not found.
    """
    return flame.nodes.node_types.get_node_type_description(node_type)
def get_node_type_input_names(node_type):
    """
    Retrieves a list of the names of all input connections supported by the specified node type.

    Args:
        node_type: The name of the node type to get input names for.

    Returns:
        A list of strings representing the input connection names or None if the type is not found.
    """
    return flame.nodes.node_types.get_node_type_input_names(node_type)
def get_node_type_output_names(node_type):
    """
    Retrieves a list of the names of all output connections supported by the specified node type.

    Args:
        node_type: The name of the node type to get output names for.

    Returns:
        A list of strings representing the output connection names or None if the type is not found.
    """
    return flame.nodes.node_types.get_node_type_output_names(node_type)

# --------------------------------------------------------------------------- #
def read_audio(path):
    """
    Reads an audio file from disk and returns it as a Flame audio object.

    Args:
        path: The path to the audio file.

    Returns:
        The audio object or None if the file cannot be read.
    """
    return flame.media.audio_io.read_audio(path)
def write_audio(audio, path):
    """
    Writes a Flame audio object to a file on disk.

    Args:
        audio: The audio object to write.
        path: The path to save the audio file.

    Returns:
        None
    """
    return flame.media.audio_io.write_audio(audio, path)

# --------------------------------------------------------------------------- #
def add_media_to_sequence(sequence_reel, media, start_frame=1):
    """
    Adds the specified media item to the given sequence reel at the specified starting frame.

    Args:
        sequence_reel: The sequence reel to add the media to.
        media: The media item to add.
        start_frame: The frame number to insert the media at (defaults to 1).

    Returns:
        None
    """
    Sequence.add_media_to_sequence(sequence_reel, media, start_frame)
def create_sequence_reel(name, duration):
    """
    Creates a new sequence reel with the specified name and duration.

    Args:
        name: The name of the new sequence reel.
        duration: The duration of the sequence reel in frames.

    Returns:
        The newly created sequence reel object.
    """
    return Sequence.create_sequence_reel(name, duration)
def delete_media_from_sequence(sequence_reel, media):
    """
    Removes the specified media item from the given sequence reel.

    Args:
        sequence_reel: The sequence reel to remove the media from.
        media: The media item to remove.

    Returns:
        None
    """
    Sequence.delete_media_from_sequence(sequence_reel, media)
def get_sequence_reel_by_name(name):
    """
    Retrieves a sequence reel by its name.

    Args:
        name: The name of the sequence reel to retrieve.

    Returns:
        The sequence reel object or None if not found.
    """
    return Sequence.get_sequence_reel_by_name(name)
def get_sequence_reel_length(sequence_reel):
    """
    Retrieves the total duration of the specified sequence reel in frames.

    Args:
        sequence_reel: The sequence reel to get the length of.

    Returns:
        The duration of the sequence reel as an integer.
    """
    return Sequence.get_sequence_reel_length(sequence_reel)
def get_sequence_reels():
    """
    Retrieves a list of all existing sequence reels.

    Returns:
        A list of sequence reel objects.
    """
    return Sequence.get_sequence_reels()
def set_sequence_reel_duration(sequence_reel, duration):
    """
    Changes the duration of the specified sequence reel.

    Args:
        sequence_reel: The sequence reel to modify the duration of.
        duration: The new duration of the sequence reel in frames.

    Returns:
        None
    """
    Sequence.set_sequence_reel_duration(sequence_reel, duration)
def add_media_to_sequence_reel(sequence_reel, media, start_frame=1):
    """
    Adds the specified media item to the given sequence reel at the specified starting frame.

    Args:
        sequence_reel: The sequence reel to add the media to.
        media: The media item to add.
        start_frame: The frame number to insert the media at (defaults to 1).

    Returns:
        None
    """
    flame.sequence.sequence_reels.add_media_to_sequence_reel(sequence_reel, media, start_frame)
def get_media_from_sequence_reel(sequence_reel, name):
    """
    Retrieves a specific media item from the given sequence reel by its name.

    Args:
        sequence_reel: The sequence reel to search for the media in.
        name: The name of the media item to retrieve.

    Returns:
        The media object or None if not found.
    """
    return flame.sequence.sequence_reels.get_media_from_sequence_reel(sequence_reel, name)
def get_sequence_reel_media(sequence_reel):
    """
    Retrieves a list of all media items included in the specified sequence reel.

    Args:
        sequence_reel: The sequence reel to get the media from.

    Returns:
        A list of media objects.
    """
    return flame.sequence.sequence_reels.get_sequence_reel_media(sequence_reel)
def remove_media_from_sequence_reel(sequence_reel, media):
    """
    Removes the specified media item from the given sequence reel.

    Args:
        sequence_reel: The sequence reel to remove the media from.
        media: The media item to remove.

    Returns:
        None
    """
    flame.sequence.sequence_reels.remove_media_from_sequence_reel(sequence_reel, media)

# --------------------------------------------------------------------------- #
def get_current_time():
    """
    Retrieves the current playback position in the timeline as a frame number.

    Returns:
        The current frame number.
    """
    return Timeline.get_current_time()
def get_current_timecode():
    """
    Retrieves the current playback position in the timeline as a timecode string.

    Returns:
        The current timecode string.
    """
    return Timeline.get_current_timecode()
def get_selection_range():
    """
    Retrieves the current selection range in the timeline as a tuple of start and end frame numbers.

    Returns:
        A tuple of two integers representing the selection start and end frames.
    """
    return Timeline.get_selection_range()
def get_timeline_frame_range():
    """
    Retrieves the frame range of the entire timeline as a tuple of start and end frame numbers.

    Returns:
        A tuple of two integers representing the start and end frames of the timeline.
    """
    return Timeline.get_timeline_frame_range()
def pause():
    """
    Pauses playback in the timeline.
    """
    Timeline.pause()
def play():
    """
    Starts playback from the current position in the timeline.
    """
    Timeline.play()
def set_current_time(time):
    """
    Sets the current playback position in the timeline to the specified frame number.

    Args:
        time: The frame number to set the current time to.
    """
    Timeline.set_current_time(time)
def set_current_timecode(timecode):
    """
    Sets the current playback position in the timeline to the specified timecode.

    Args:
        timecode: The timecode string to set the current time to.
    """
    Timeline.set_current_timecode(timecode)
def set_selection_range(start_frame, end_frame):
    """
    Sets the current selection range in the timeline to the specified range of frames.

    Args:
        start_frame: The frame number to set the selection start to.
        end_frame: The frame number to set the selection end to.
    """
    Timeline.set_selection_range(start_frame, end_frame)
def set_timeline_frame_range(start_frame, end_frame):
    """
    Sets the frame range of the entire timeline to the specified range of frames.

    Args:
        start_frame: The frame number to set the timeline start to.
        end_frame: The frame number to set the timeline end to.
    """
    Timeline.set_timeline_frame_range(start_frame, end_frame)
def create_marker(timecode, text=""):
    """
    Creates a new marker at the specified timecode with optional text.

    Args:
        timecode: The timecode string to place the marker at.
        text: (Optional) The text to display with the marker.
    """
    flame.timeline.markers.create_marker(timecode, text)
def delete_marker(marker):
    """
    Deletes the specified marker from the timeline.

    Args:
        marker: The marker object to delete.
    """
    flame.timeline.markers.delete_marker(marker)
def get_all_markers():
    """
    Retrieves a list of all markers currently placed on the timeline.

    Returns:
        A list of marker objects.
    """
    return flame.timeline.markers.get_all_markers()
def get_marker_by_timecode(timecode):
    """
    Retrieves the marker at the specified timecode.

    Args:
        timecode: The timecode string to search for.

    Returns:
        The marker object or None if not found.
    """
    return flame.timeline.markers.get_marker_by_timecode(timecode)
def get_marker_position(marker):
    """
    Retrieves the timecode position of the specified marker.

    Args:
        marker: The marker object to get the position of.

    Returns:
        The timecode string of the marker.
    """
    return flame.timeline.markers.get_marker_position(marker)
def get_marker_text(marker):
    """
    Retrieves the text associated with the specified marker.

    Args:
        marker: The marker object to get the text of.

    Returns:
        The text string attached to the marker.
    """
    return flame.timeline.markers.get_marker_text(marker)
def remove_marker(marker):
    """
    Deletes the specified marker from the timeline.

    Args:
        marker: The marker object to delete.
    """
    flame.timeline.markers.remove_marker(marker)
def set_marker_position(marker, timecode):
    """
    Changes the position of the specified marker to the given timecode.

    Args:
        marker: The marker object to modify the position of.
        timecode: The new timecode string for the marker.
    """
    flame.timeline.markers.set_marker_position(marker, timecode)
def set_marker_text(marker, text):
    """
    Changes the text associated with the specified marker.

    Args:
        marker: The marker object to modify the text of.
        text: The new text string for the marker.
    """
    flame.timeline.markers.set_marker_text(marker, text)
def create_subclip(clip, start_frame, end_frame):
    """
    Creates a new subclip from the specified clip within the given frame range.

    Args:
        clip: The clip to create the subclip from.
        start_frame: The frame number to start the subclip at.
        end_frame: The frame number to end the subclip at.

    Returns:
        The newly created subclip object.
    """
    return flame.timeline.subclips.create_subclip(clip, start_frame, end_frame)
def get_clip_subclips(clip):
    """
    Retrieves a list of all subclips created from the specified clip.

    Args:
        clip: The clip to get subclips from.

    Returns:
        A list of subclip objects.
    """
    return flame.timeline.subclips.get_clip_subclips(clip)
def get_subclip_by_name(clip, name):
    """
    Retrieves a specific subclip from the given clip by its name.

    Args:
        clip: The clip to search for the subclip in.
        name: The name of the subclip to retrieve.

    Returns:
        The subclip object or None if not found.
    """
    return flame.timeline.subclips.get_subclip_by_name(clip, name)
def get_subclip_range(subclip):
    """
    Retrieves the frame range of the specified subclip.

    Args:
        subclip: The subclip object to get the range of.

    Returns:
        A tuple of two integers representing the start and end frames of the subclip.
    """
    return flame.timeline.subclips.get_subclip_range(subclip)
def remove_subclip(subclip):
    """
    Deletes the specified subclip from the timeline.

    Args:
        subclip: The subclip object to delete.
    """
    flame.timeline.subclips.remove_subclip(subclip)
def add_timeline_fx_to_group(timeline_fx, group):
    """
    Adds the specified timeline FX object to the given group.

    Args:
        timeline_fx: The timeline FX object to add to the group.
        group: The group to add the timeline FX to.
    """
    flame.timeline.timeline_fx_groups.add_timeline_fx_to_group(timeline_fx, group)
def get_all_timeline_fx_groups():
    """
    Retrieves a list of all existing timeline FX groups.

    Returns:
        A list of group objects.
    """
    return flame.timeline.timeline_fx_groups.get_all_timeline_fx_groups()
def get_timeline_fx_group_by_name(name):
    """
    Retrieves a specific timeline FX group by its name.

    Args:
        name: The name of the group to retrieve.

    Returns:
        The group object or None if not found.
    """
    return flame.timeline.timeline_fx_groups.get_timeline_fx_group_by_name(name)
def remove_timeline_fx_from_group(timeline_fx, group):
    """
    Removes the specified timeline FX object from the given group.

    Args:
        timeline_fx: The timeline FX object to remove from the group.
        group: The group to remove the timeline FX from.
    """
    flame.timeline.timeline_fx_groups.remove_timeline_fx_from_group(timeline_fx, group)
def set_timeline_fx_group_color(group, color):
    """
    Changes the color of the specified timeline FX group.

    Args:
        group: The group to change the color of.
        color: The new color to set the group to.
    """
    flame.timeline.timeline_fx_groups.set_timeline_fx_group_color(group, color)
def set_timeline_fx_group_name(group, name):
    """
    Changes the name of the specified timeline FX group.

    Args:
        group: The group to change the name of.
        name: The new name to set the group to.
    """
    flame.timeline.timeline_fx_groups.set_timeline_fx_group_name(group, name)
def add_timeline_fx_group(name, color=None):
    """
    Creates a new timeline FX group with the specified name and optional color.

    Args:
        name: The name of the new group.
        color: (Optional) The color to set the group to. Defaults to None.

    Returns:
        The newly created group object.
    """
    return flame.timeline.timeline_fx.add_timeline_fx_group(name, color)
def delete_timeline_fx_group(group):
    """
    Deletes the specified timeline FX group.

    Args:
        group: The group to delete.
    """
    flame.timeline.timeline_fx.delete_timeline_fx_group(group)
def get_all_timeline_fx():
    """
    Retrieves a list of all existing timeline FX objects.

    Returns:
        A list of timeline FX objects.
    """
    return flame.timeline.timeline_fx.get_all_timeline_fx()
def get_timeline_fx_by_name(name):
    """
    Retrieves a specific timeline FX object by its name.

    Args:
        name: The name of the timeline FX to retrieve.

    Returns:
        The timeline FX object or None if not found.
    """
    return flame.timeline.timeline_fx.get_timeline_fx_by_name(name)
def get_timeline_fx_group_by_name(name):
    """
    Retrieves a specific timeline FX group by its name.

    Args:
        name: The name of the group to retrieve.

    Returns:
        The group object or None if not found.
    """
    return flame.timeline.timeline_fx.get_timeline_fx_group_by_name(name)
def get_timeline_fx_parameters(timeline_fx):
    """
    Retrieves a dictionary containing all parameters and their values for the specified timeline FX.

    Args:
        timeline_fx: The timeline FX object to get parameters for.

    Returns:
        A dictionary mapping parameter names to their current values.
    """
    return flame.timeline.timeline_fx.get_timeline_fx_parameters(timeline_fx)
def remove_timeline_fx_from_group(timeline_fx, group):
    """
    Removes the specified timeline FX object from the given group.

    Args:
        timeline_fx: The timeline FX object to remove from the group.
        group: The group to remove the timeline FX from.
    """
    flame.timeline.timeline_fx.remove_timeline_fx_from_group(timeline_fx, group)
def remove_timeline_fx(timeline_fx):
    """
    Deletes the specified timeline FX object.

    Args:
        timeline_fx: The timeline FX object to delete.
    """
    flame.timeline.timeline_fx.remove_timeline_fx(timeline_fx)
def set_timeline_fx_group_color(group, color):
    """
    Changes the color of the specified timeline FX group.

    Args:
        group: The group to change the color of.
        color: The new color to set the group to.
    """
    flame.timeline.timeline_fx.set_timeline_fx_group_color(group, color)
def set_timeline_fx_group_name(group, name):
    """
    Changes the name of the specified timeline FX group.

    Args:
        group: The group to change the name of.
        name: The new name to set the group to.
    """
    flame.timeline.timeline_fx.set_timeline_fx_group_name(group, name)
def set_timeline_fx_parameter(timeline_fx, parameter_name, value):
    """
    Sets the value of a specific parameter for the given timeline FX object.

    Args:
        timeline_fx: The timeline FX object to modify the parameter of.
        parameter_name: The name of the parameter to set.
        value: The new value to set the parameter to.
    """
    flame.timeline.timeline_fx.set_timeline_fx_parameter(timeline_fx, parameter_name, value)

# --------------------------------------------------------------------------- #
def show_dialog(dialog_type, options={}):
    """
    Displays a modal dialog on the screen.

    Args:
        dialog_type: The type of dialog to show (e.g., "open_file", "save_file").
        options: (Optional) A dictionary containing additional options for the dialog.

    Returns:
        The result of the dialog, or None if the dialog was cancelled.
    """
    return Ui.show_dialog(dialog_type, options)
def show_message(message, title="Message", buttons=["OK"]):
    """
    Displays a simple message dialog with the given message, title, and buttons.

    Args:
        message: The text message to display in the dialog.
        title: (Optional) The title of the dialog. Defaults to "Message".
        buttons: (Optional) A list of button labels for the dialog. Defaults to ["OK"].

    Returns:
        The index of the button clicked, or None if the dialog was closed without clicking a button.
    """
    return Ui.show_message(message, title, buttons)
def show_popup_menu(items, x, y):
    """
    Displays a context menu with the given list of items at the specified screen coordinates.

    Args:
        items: A list of menu items, each represented as a dictionary with "text" and "action" keys.
        x: The horizontal screen coordinate to display the menu at.
        y: The vertical screen coordinate to display the menu at.

    Returns:
        The index of the selected item, or None if no item was selected.
    """
    return Ui.show_popup_menu(items, x, y)
def show_preferences_dialog(dialog_type):
    """
    Displays a preferences dialog of the specified type.

    Args:
        dialog_type: The type of preferences dialog to show.

    Returns:
        True if the dialog was confirmed, False if cancelled.
    """
    return Ui.show_preferences_dialog(dialog_type)

# --------------------------------------------------------------------------- #
def get_environment_variable(name):
    """
    Retrieves the value of the specified environment variable.

    Args:
        name: The name of the environment variable to retrieve.

    Returns:
        The value of the environment variable, or None if it is not set.
    """
    return Utilities.get_environment_variable(name)
def get_hostname():
    """
    Retrieves the hostname of the computer running Flame.

    Returns:
        The hostname string.
    """
    return Utilities.get_hostname()
def get_path_to_flame_root():
    """
    Retrieves the installation path of the Flame application.

    Returns:
        The path to the Flame root directory.
    """
    return Utilities.get_path_to_flame_root()
def get_user_name():
    """
    Retrieves the username of the current user.

    Returns:
        The username string.
    """
    return Utilities.get_user_name()
def get_version():
    """
    Retrieves the version number of the currently running Flame installation.

    Returns:
        The Flame version string.
    """
    return Utilities.get_version()
def set_environment_variable(name, value):
    """
    Sets the value of the specified environment variable.

    Args:
        name: The name of the environment variable to set.
        value: The new value to set the environment variable to.
    """
    Utilities.set_environment_variable(name, value)
def show_message(message, title="Message", buttons=["OK"]):
    """
    Displays a simple message dialog with the given message, title, and buttons.

    Args:
        message: The text message to display in the dialog.
        title: (Optional) The title of the dialog. Defaults to "Message".
        buttons: (Optional) A list of button labels for the dialog. Defaults to ["OK"].

    Returns:
        The index of the button clicked, or None if the dialog was closed without clicking a button.
    """
    return Utilities.show_message(message, title, buttons)
