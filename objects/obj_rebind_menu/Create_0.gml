actions = ["move_up", "move_down", "move_left", "move_right", "fire", "pause", "confirm", "back"];
labels = ["MOVE UP", "MOVE DOWN", "MOVE LEFT", "MOVE RIGHT", "FIRE", "PAUSE", "CONFIRM", "BACK"];
selected = 0;
global.pp_rebind_message = "SELECT AN ACTION AND PRESS CONFIRM";

with (obj_blank_key_up) instance_destroy();
with (obj_blank_key_down) instance_destroy();
with (obj_blank_key_left) instance_destroy();
with (obj_blank_key_right) instance_destroy();
