/// @description Draw Game UI
draw_set_color(c_white);

// Draw body text
if (show_current_passage) {
	draw_text_ext(96, 128, node_text, NULL, 448);
}

// Draw path selection options
for (var i = 0; i < array_length_1d(node_paths); i++) {
	draw_text(96, 480 + (i * 24), string(i + 1) + ". " + string(node_paths[i]));
}
