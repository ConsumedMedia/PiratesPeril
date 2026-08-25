event_inherited();
global.pp_progression.settings.sfx_enabled = !global.pp_progression.settings.sfx_enabled;
if (instance_exists(obj_btn_sound_fx)) obj_btn_sound_fx.sound_fx_off = !global.pp_progression.settings.sfx_enabled;
SaveGame();
