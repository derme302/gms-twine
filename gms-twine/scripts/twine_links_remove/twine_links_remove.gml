/// @function twine_links_remove(text)
/// @description Searches a piece of passage text for links and removes them (returns string)
/// @param {string} text The passage text to remove links from
function twine_links_remove() {


	var txt = argument[0]; // String to search
	var txt_end = string_pos("[[", txt) - 1;

	if (txt_end == NULL)
		return txt;
	
	return string_copy(txt, 0, txt_end);


}
