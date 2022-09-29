/// @function twine_links_get(text)
/// @description Searches a piece of passage text for links and places them into an array (returns array)
/// @param {string} text The passage text to search for links
function twine_links_get() {

	var txt = argument[0]; // String to search
	var links = string_count("[[", argument[0]);
	var arr = array_create(links);

	for (var l = 0; l < links; l++) {
		var pos_start = string_pos("[[", txt);
		var pos_end = string_pos("]]", txt) + string_length("]]");
		var length = pos_end - pos_start;
	
		// Copy string to list
		arr[l] = string_copy(txt, pos_start, length);
		txt = string_delete(txt, pos_start, length);
	
		// Remove symbols from array
		arr[l] = string_replace_all(arr[l], "[[", "");
		arr[l] = string_replace_all(arr[l], "]]", "");
	}

	return arr;


}
