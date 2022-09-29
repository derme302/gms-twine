/// @description Game Setup
node_start = 1; // In future this should be loaded from Twine file
node_current = node_start;
node_text = NONE;
show_current_passage = false;

// Import Twine
twine_constants(); // Import Twine Constants
global.Story = twine_import_html("demoData.txt");

// Init
event_user(0);