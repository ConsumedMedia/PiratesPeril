if (obj_game.paused) exit;
if (invulnerability > 0) invulnerability -= 1;

var _move_x = PPInputMoveX();
var _move_y = PPInputMoveY();
var _magnitude = point_distance(0, 0, _move_x, _move_y);
if (_magnitude > 1)
{
    _move_x /= _magnitude;
    _move_y /= _magnitude;
}

move_and_collide(_move_x * my_speed, _move_y * my_speed, obj_wall, 1, 1, 1);

if (PPInputHasGamepad())
{
    if (_magnitude > 0.25) image_angle = point_direction(0, 0, _move_x, _move_y);
}
else
{
    var _target_angle = point_direction(x, y, mouse_x, mouse_y);
    image_angle += angle_difference(_target_angle, image_angle) * 0.2;
}
image_angle = (image_angle + 360) mod 360;

if (PPInputFirePressed() && !cooldown)
{
    var _shot = instance_create_layer(x, y, "Instances", obj_bullet);
    _shot.direction = image_angle;

    if (powerup == 1 || powerup == 7)
    {
        _shot = instance_create_layer(x, y, "Instances", obj_bullet);
        _shot.direction = image_angle + 10;
        _shot = instance_create_layer(x, y, "Instances", obj_bullet);
        _shot.direction = image_angle - 10;
    }
    if (powerup == 3)
    {
        var _angles = [90, -90, 180];
        for (var i = 0; i < array_length(_angles); i++)
        {
            _shot = instance_create_layer(x, y, "Instances", obj_bullet);
            _shot.direction = image_angle + _angles[i];
        }
    }

    if (!obj_btn_sound_fx.sound_fx_off)
    {
        audio_play_sound(snd_cannon_fire, 0, false, 1, 0, random_range(0.8, 1.2));
    }
    cooldown = true;
    alarm[1] = ((powerup == 4 || powerup == 7) ? 10 : 30);
}

if (obj_game.player_health <= 0)
{
    ProgressionCompleteRun(obj_game.points, obj_game.run_coins);
    effect_create_above(ef_explosion, x, y, 1, c_orange);
    if (PPInputHasGamepad()) gamepad_set_vibration(global.gamepad, 1, 1);
    if (!obj_btn_sound_fx.sound_fx_off) audio_play_sound(snd_lose, 0, false);
    instance_destroy(obj_wake);
    instance_destroy();
    TransitionStart(rm_menu_died, sq_fadeout, sq_fadein);
    exit;
}

if (obj_game.player_health >= 3) image_index = 0;
else if (obj_game.player_health == 2) image_index = 1;
else image_index = 2;

image_alpha = (invulnerability > 0 && ((invulnerability div 4) mod 2 == 0)) ? 0.45 : ((powerup == 2) ? 0.4 : 1);
