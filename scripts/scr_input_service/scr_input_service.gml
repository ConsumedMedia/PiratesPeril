/// Named input actions used by gameplay and menus.

function PPInputDefaults()
{
    return {
        move_left : ord("A"),
        move_right : ord("D"),
        move_up : ord("W"),
        move_down : ord("S"),
        fire : vk_space,
        pause : vk_escape,
        confirm : vk_enter,
        back : vk_escape,
    };
}

function PPInputInit()
{
    global.pp_bindings = PPInputDefaults();
    if (variable_global_exists("pp_progression"))
    {
        var _saved = global.pp_progression.settings.bindings;
        if (is_struct(_saved))
        {
            var _defaults = PPInputDefaults();
            var _names = variable_struct_get_names(_defaults);
            for (var i = 0; i < array_length(_names); i++)
            {
                var _name = _names[i];
                if (variable_struct_exists(_saved, _name))
                {
                    variable_struct_set(global.pp_bindings, _name, variable_struct_get(_saved, _name));
                }
            }
        }
    }
    global.gamepad = -1;
    global.pp_rebind_action = "";
    global.pp_rebind_message = "";
    PPInputUpdateDevice();
}

function PPInputUpdateDevice()
{
    var _found = -1;
    var _count = gamepad_get_device_count();
    for (var i = 0; i < _count; i++)
    {
        if (gamepad_is_connected(i))
        {
            _found = i;
            break;
        }
    }
    global.gamepad = _found;
    return _found;
}

function PPInputHasGamepad()
{
    return (global.gamepad >= 0 && gamepad_is_connected(global.gamepad));
}

function PPInputMoveX()
{
    if (PPInputHasGamepad())
    {
        var _axis = gamepad_axis_value(global.gamepad, gp_axislh);
        if (abs(_axis) >= 0.25) return _axis;
        return gamepad_button_check(global.gamepad, gp_padr) - gamepad_button_check(global.gamepad, gp_padl);
    }
    return (keyboard_check(global.pp_bindings.move_right) || keyboard_check(vk_right))
         - (keyboard_check(global.pp_bindings.move_left) || keyboard_check(vk_left));
}

function PPInputMoveY()
{
    if (PPInputHasGamepad())
    {
        var _axis = gamepad_axis_value(global.gamepad, gp_axislv);
        if (abs(_axis) >= 0.25) return _axis;
        return gamepad_button_check(global.gamepad, gp_padd) - gamepad_button_check(global.gamepad, gp_padu);
    }
    return (keyboard_check(global.pp_bindings.move_down) || keyboard_check(vk_down))
         - (keyboard_check(global.pp_bindings.move_up) || keyboard_check(vk_up));
}

function PPInputFirePressed()
{
    return mouse_check_button_pressed(mb_left)
        || keyboard_check_pressed(global.pp_bindings.fire)
        || (PPInputHasGamepad() && gamepad_button_check_pressed(global.gamepad, gp_face1));
}

function PPInputPausePressed()
{
    return keyboard_check_pressed(global.pp_bindings.pause)
        || (PPInputHasGamepad() && gamepad_button_check_pressed(global.gamepad, gp_start));
}

function PPInputConfirmPressed()
{
    return keyboard_check_pressed(global.pp_bindings.confirm)
        || (PPInputHasGamepad() && gamepad_button_check_pressed(global.gamepad, gp_face1));
}

function PPInputBackPressed()
{
    return keyboard_check_pressed(global.pp_bindings.back)
        || (PPInputHasGamepad() && gamepad_button_check_pressed(global.gamepad, gp_face2));
}

function PPInputRebind(_action, _key)
{
    if (!variable_struct_exists(global.pp_bindings, _action)) return false;
    variable_struct_set(global.pp_bindings, _action, _key);
    global.pp_progression.settings.bindings = global.pp_bindings;
    SaveGame();
    return true;
}

function PPInputKeyName(_key)
{
    switch (_key)
    {
        case vk_space: return "SPACE";
        case vk_escape: return "ESCAPE";
        case vk_enter: return "ENTER";
        case vk_left: return "LEFT";
        case vk_right: return "RIGHT";
        case vk_up: return "UP";
        case vk_down: return "DOWN";
    }
    if (_key >= ord("A") && _key <= ord("Z")) return chr(_key);
    if (_key >= ord("0") && _key <= ord("9")) return chr(_key);
    return "KEY " + string(_key);
}

function PPInputBeginRebind(_action)
{
    if (!variable_struct_exists(global.pp_bindings, _action)) return false;
    global.pp_rebind_action = _action;
    global.pp_rebind_message = "PRESS A KEY FOR " + string_upper(_action);
    keyboard_clear(vk_anykey);
    return true;
}

function PPInputUpdateRebind()
{
    if (global.pp_rebind_action == "") return false;
    if (!keyboard_check_pressed(vk_anykey)) return false;

    var _key = keyboard_lastkey;
    if (_key == vk_escape)
    {
        global.pp_rebind_action = "";
        global.pp_rebind_message = "REBIND CANCELLED";
        return false;
    }

    var _action = global.pp_rebind_action;
    global.pp_rebind_action = "";
    PPInputRebind(_action, _key);
    global.pp_rebind_message = string_upper(_action) + " = " + PPInputKeyName(_key);
    return true;
}

function PPDisplayApply()
{
    display_set_gui_size(800, 800);
    if (surface_exists(application_surface)) surface_resize(application_surface, 800, 800);
    window_set_fullscreen(global.pp_progression.settings.fullscreen);
    if (!global.pp_progression.settings.fullscreen)
    {
        window_set_size(800, 800);
        window_center();
    }
}

function PPPauseSet(_paused)
{
    if (!instance_exists(obj_game) || room != rm_game) return false;
    if (obj_game.paused == _paused) return true;

    obj_game.paused = _paused;
    if (_paused)
    {
        instance_deactivate_all(true);
        instance_activate_object(input_controller_object);
        instance_activate_object(obj_btn_sound);
        instance_activate_object(obj_btn_sound_fx);
        instance_activate_object(obj_mouse_cursor);
        audio_pause_all();
    }
    else
    {
        instance_activate_all();
        audio_resume_all();
    }
    return true;
}

function PPPauseToggle()
{
    return PPPauseSet(!obj_game.paused);
}
