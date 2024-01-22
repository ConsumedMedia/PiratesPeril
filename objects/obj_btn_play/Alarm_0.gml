/// @description player goes to rm_game
event_inherited();
// go to game
//room_goto(rm_game);
obj_game.points = 0;
TransitionStart(rm_game, sq_fadeout, sq_fadein);