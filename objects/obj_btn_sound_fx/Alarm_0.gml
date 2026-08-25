y = ystart;
sound_fx_off = !sound_fx_off;
image_index = sound_fx_off ? 1 : 0;
global.pp_progression.settings.sfx_enabled = !sound_fx_off;
SaveGame();
