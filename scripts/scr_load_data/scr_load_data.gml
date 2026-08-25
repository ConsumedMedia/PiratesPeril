/// Load current saves and migrate the original array-based save format.

function PPLoadSaveStruct(_data)
{
    var _result = ProgressionDefaults();

    _result.high_score = max(0, PPStructGet(_data, "high_score", PPStructGet(_data, "highscore", 0)));
    _result.banked_coins = max(0, PPStructGet(_data, "banked_coins", PPStructGet(_data, "saved_coins", 0)));

    var _upgrades = PPStructGet(_data, "upgrades", {});
    _result.upgrades.health_tier = clamp(PPStructGet(_upgrades, "health_tier", 0), 0, 3);
    _result.upgrades.speed_tier = clamp(PPStructGet(_upgrades, "speed_tier", 0), 0, 3);
    _result.upgrades.powerup_tier = clamp(PPStructGet(_upgrades, "powerup_tier", 0), 0, 3);

    var _cosmetics = PPStructGet(_data, "cosmetics", {});
    var _owned = PPStructGet(_cosmetics, "owned", [true, false, false, false, false]);
    if (is_array(_owned))
    {
        for (var i = 0; i < min(5, array_length(_owned)); i++) _result.cosmetics.owned[i] = _owned[i];
    }
    _result.cosmetics.owned[0] = true;
    _result.cosmetics.selected = clamp(PPStructGet(_cosmetics, "selected", 0), 0, 4);
    _result.cosmetics.ferret_unlocked = PPStructGet(_cosmetics, "ferret_unlocked", false);
    if (!_result.cosmetics.owned[_result.cosmetics.selected]) _result.cosmetics.selected = 0;

    var _quest = PPStructGet(_data, "quest", {});
    _result.quest.thor_met = PPStructGet(_quest, "thor_met", false);
    _result.quest.active = PPStructGet(_quest, "active", false);
    _result.quest.rescued = clamp(PPStructGet(_quest, "rescued", 0), 0, PP_FERRET_TARGET);
    _result.quest.complete = PPStructGet(_quest, "complete", false);
    _result.quest.reward_claimed = PPStructGet(_quest, "reward_claimed", false);
    if (_result.quest.reward_claimed)
    {
        _result.quest.complete = true;
        _result.quest.active = false;
        _result.quest.rescued = PP_FERRET_TARGET;
        _result.cosmetics.ferret_unlocked = true;
        _result.cosmetics.owned[4] = true;
    }
    else if (_result.quest.complete || _result.quest.rescued >= PP_FERRET_TARGET)
    {
        _result.quest.complete = true;
        _result.quest.active = false;
        _result.quest.rescued = PP_FERRET_TARGET;
    }

    var _settings = PPStructGet(_data, "settings", {});
    _result.settings.music_enabled = PPStructGet(_settings, "music_enabled", true);
    _result.settings.sfx_enabled = PPStructGet(_settings, "sfx_enabled", true);
    _result.settings.fullscreen = PPStructGet(_settings, "fullscreen", false);
    _result.settings.language = "en";
    _result.settings.bindings = PPStructGet(_settings, "bindings", {});
    return _result;
}

function PPLoadFile(_filename)
{
    if (!file_exists(_filename)) return undefined;
    var _buffer = buffer_load(_filename);
    var _json = buffer_read(_buffer, buffer_string);
    buffer_delete(_buffer);
    return json_parse(_json);
}

function LoadGame()
{
    var _loaded = undefined;
    var _used_backup = false;

    try { _loaded = PPLoadFile(PP_SAVE_FILE); }
    catch (_exception)
    {
        show_debug_message("Pirates Peril: primary save is invalid; trying backup.");
    }

    if (is_undefined(_loaded))
    {
        try
        {
            _loaded = PPLoadFile(PP_SAVE_BACKUP);
            _used_backup = !is_undefined(_loaded);
        }
        catch (_exception)
        {
            show_debug_message("Pirates Peril: backup save is also invalid; using defaults.");
        }
    }

    if (is_undefined(_loaded)) return false;

    var _legacy = false;
    if (is_array(_loaded))
    {
        _legacy = true;
        if (array_length(_loaded) > 0) _loaded = _loaded[0];
    }

    if (!is_struct(_loaded)) return false;
    global.pp_progression = PPLoadSaveStruct(_loaded);

    if (_legacy || _used_backup || PPStructGet(_loaded, "schema_version", 0) < PP_SAVE_SCHEMA)
    {
        SaveGame();
    }
    return true;
}
