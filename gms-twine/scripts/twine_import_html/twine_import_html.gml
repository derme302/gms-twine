/// @function twine_import_html(filename)
/// @description Imports a Twine 2 file into an array (returns array)
/// @param {string} filename The name of the Twine 2 file to import
function twine_import_html() {

	// Settings
	var filename = argument[0];
	var data = "";
	var nodes = 0;
	var arr;
	var i = 0;
	var j = 0;
	var max_id = 9999;

	// Open File
	file = file_text_open_read(working_directory + filename);

	while (true) {
		// Check for end of file
	    if (file_text_eof(file))
	        break;	
		
		// Read data line by line
		data += file_text_readln(file);
	}

	// Close the file
	file_text_close(file);

	// Clean up string
	data = string_replace_all(data, "\r", ""); // Remove line breaks
	nodes = string_count("/tw-passagedata", data); // Count nodes 
	trace("Nodes = " + string(nodes));

	// Place into array
	for (var n = 0; n < nodes; n++) {
		var pos_start = string_pos("<tw-passagedata", data);
		var pos_end = string_pos("</tw-passagedata>", data) + string_length("</tw-passagedata>");
		var length = pos_end - pos_start;
	
		arr[i, PASSAGE_DATA] = string_copy(data, pos_start, length);
		data = string_delete(data, pos_start, length);
	
		// Extract ID
		for (j = 1; j <= PASSAGE_TEXT; j++) {
			var var_head = "";
			var var_end = "";
			
			switch (j) {
				case PASSAGE_ID: var_head = "pid=\""; var_end = "\""; break;
				case PASSAGE_NAME: var_head = "name=\""; var_end = "\""; break;
				case PASSAGE_POSITION: var_head = "position=\""; var_end = "\"";  break;
				case PASSAGE_TAGS: var_head = "tags=\""; var_end = "\"";  break;
				case PASSAGE_TEXT: var_head = ">"; var_end = "<";  break;
			}
	
			pos_start = string_pos(var_head, arr[i, PASSAGE_DATA]) + string_length(var_head);
			pos_end = 1;
			while (true) {
				if (string_char_at(arr[i, PASSAGE_DATA], pos_start + pos_end) == var_end) {
					pos_end = pos_start + pos_end;
					break;
				}
				pos_end++;
		
				// Loop Protection
				if (pos_end > max_id)
					break;
			}
	
			length = pos_end - pos_start;
	
			arr[i, j] = string_copy(arr[i, PASSAGE_DATA], pos_start, length);
		}
	
		// Debug Log
		trace("ROW: " + string(i));
		trace("DATA: " + string(arr[i, PASSAGE_DATA]));
		trace( "ID:" + string(arr[i, PASSAGE_ID]) + " NAME:" + string(arr[i, PASSAGE_NAME]) + " TAGS:" + string(arr[i, PASSAGE_TAGS]) + " POSITION:" + string(arr[i, PASSAGE_POSITION]) + " TEXT:" + string(arr[i, PASSAGE_TEXT]));
		trace("ROW END");	
	
		i++;
	}



	// Log remaining data
	trace(data);
	// We still need to pull a couple details from this (File hash, start node, version, format) - rest can go in the bin


	// Return the array
	return arr;


}
