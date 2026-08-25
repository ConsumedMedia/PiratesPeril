if (global.pp_rebind_action != "")
{
    PPInputUpdateRebind();
    exit;
}

if (keyboard_check_pressed(vk_up) || (PPInputHasGamepad() && gamepad_button_check_pressed(global.gamepad, gp_padu)))
    selected = (selected + array_length(actions) - 1) mod array_length(actions);
if (keyboard_check_pressed(vk_down) || (PPInputHasGamepad() && gamepad_button_check_pressed(global.gamepad, gp_padd)))
    selected = (selected + 1) mod array_length(actions);

if (mouse_check_button_pressed(mb_left))
{
    var _row = floor((device_mouse_y_to_gui(0) - 190) / 52);
    if (_row >= 0 && _row < array_length(actions))
    {
        selected = _row;
        PPInputBeginRebind(actions[selected]);
    }
}

if (PPInputConfirmPressed()) PPInputBeginRebind(actions[selected]);
if (PPInputBackPressed()) room_goto(rm_languages);
