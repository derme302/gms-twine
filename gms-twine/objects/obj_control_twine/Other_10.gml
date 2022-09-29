/// @description Load passage
// You can write your code in this editor
var index = twine_passage_index_get(global.Story, node_current);
trace("TWINE INDEX LOOKUP: " + string(index));

node_text = global.Story[index, PASSAGE_TEXT];
node_paths = twine_links_get(node_text);
node_text = twine_links_remove(node_text);

show_current_passage = true;