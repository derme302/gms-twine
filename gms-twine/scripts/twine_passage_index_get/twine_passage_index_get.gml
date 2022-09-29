/// @function twine_passage_id_get(TwineArray, passage_id)
/// @description Searches a piece of passage text for links and places them into an array (returns real)
/// @param {array} TwineArray The TwineArray to get passage id for
/// @param {real} passage_id The passage that the ID is needed for
function twine_passage_index_get() {

	// Data
	var arr = argument[0];
	var pid = argument[1];

	for (var i = 0; i < array_height_2d(arr); i++) {
		if (real(arr[i, PASSAGE_ID]) == real(pid))
			return i;
	}

	return -1;


}
