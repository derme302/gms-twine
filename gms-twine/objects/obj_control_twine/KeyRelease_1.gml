/// @description Move node

var key = keyboard_lastkey;

if (key == NULL)
	return;

trace("NODE MOVE STARTED");

var selection = NULL;

switch (key) {
	case ord("0"): selection = 9999; break;
	case ord("1"): selection = 0; break;
	case ord("2"): selection = 1; break;
	case ord("3"): selection = 2; break;
	case ord("4"): selection = 3; break;
}

trace("Path selection: " + string(selection));

if (selection != NULL) {
	if (selection == 9999) {
		node_current = node_start
		event_user(0);
	}	
	else if (array_length_1d(node_paths) >= selection) {
		var pid_selected = twine_passage_id_get(global.Story, node_paths[selection]);
	
		trace("PID: " + string(pid_selected));
	
		if (pid_selected != -1) {
			node_current = pid_selected;
			event_user(0);
		}
	}
}

keyboard_lastkey = -1;