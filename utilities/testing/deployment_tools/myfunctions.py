def batch_clips():
    import flame

    # Get current batch

    self.batch_group = flame.batch

    for clip in self.selection:
        self.x_position = clip.pos_x
        self.y_position = clip.pos_y

        self.get_clip_info(clip)

        self.create_batch_nodes(clip)

    self.batch_group.frame_all()

    print('Done.\n')
