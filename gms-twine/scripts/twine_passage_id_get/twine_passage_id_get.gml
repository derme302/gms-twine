/// @function twine_passage_id_get(TwineArray, passage_name)
/// @description Searches a piece of passage text for links and places them into an array (returns real)
/// @param {array} TwineArray The TwineArray to get passage id for
/// @param {string} passage_name The passage that the ID is needed for
function twine_passage_id_get() {

	// Data
	var arr = argument[0];
	var name = argument[1];
	var pid = -1;

	for (var i = 0; i < array_height_2d(arr); i++) {
		if (arr[i, PASSAGE_NAME] == name) {
			pid = arr[i, PASSAGE_ID];
			return pid;	
		}
	}

	return pid;


}
