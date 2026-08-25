sound_fx_off = variable_global_exists("pp_progression") ? !global.pp_progression.settings.sfx_enabled : false;
image_index = sound_fx_off ? 1 : 0;
