/// @description player change IF powerup_spread
powerup = 7;
alarm[0] = (10 + obj_store.powerup_time) * 60;
image_blend = c_yellow;
instance_destroy(other);