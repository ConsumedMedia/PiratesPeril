/// Pirates Peril permanent progression and run settlement.

#macro PP_SAVE_SCHEMA 2
#macro PP_FERRET_TARGET 10

function PPStructGet(_value, _key, _fallback)
{
    if (is_struct(_value) && variable_struct_exists(_value, _key))
    {
        return variable_struct_get(_value, _key);
    }
    return _fallback;
}

function ProgressionDefaults()
{
    return {
        schema_version : PP_SAVE_SCHEMA,
        high_score : 0,
        banked_coins : 0,
        upgrades : {
            health_tier : 0,
            speed_tier : 0,
            powerup_tier : 0,
        },
        cosmetics : {
            owned : [true, false, false, false, false],
            selected : 0,
            ferret_unlocked : false,
        },
        quest : {
            thor_met : false,
            active : false,
            rescued : 0,
            complete : false,
            reward_claimed : false,
        },
        settings : {
            music_enabled : true,
            sfx_enabled : true,
            fullscreen : false,
            language : "en",
            bindings : {},
        },
    };
}

function ProgressionInit()
{
    global.pp_progression = ProgressionDefaults();
    global.pp_last_run_score = 0;
    global.pp_last_run_coins = 0;
    global.pp_last_banked_coins = 0;
    global.pp_new_high_score = false;
    LoadGame();
    ProgressionApplyToInstances();
}

function ProgressionApplyToInstances()
{
    if (!variable_global_exists("pp_progression")) return;

    var _progress = global.pp_progression;
    with (obj_game)
    {
        highscore = _progress.high_score;
        coins = _progress.banked_coins;
        saved_coins = _progress.banked_coins;
        selected_lang = "en";
        seen_thor = _progress.quest.thor_met;
        thor = _progress.quest.active || _progress.quest.complete;
        collected_ferrets = _progress.quest.rescued;
    }

    with (obj_store)
    {
        var _health_tier = _progress.upgrades.health_tier;
        var _speed_tier = _progress.upgrades.speed_tier;
        var _power_tier = _progress.upgrades.powerup_tier;
        ship_health = _health_tier;
        ship_speed = _speed_tier;
        ship_health_btn = (_health_tier == 0);
        ship_health_btn_2 = (_health_tier == 1);
        ship_health_btn_3 = (_health_tier == 2);
        ship_speed_btn = (_speed_tier == 0);
        ship_speed_btn_2 = (_speed_tier == 1);
        ship_speed_btn_3 = (_speed_tier == 2);
        powerup_btn = (_power_tier == 0);
        powerup_btn_2 = (_power_tier == 1);
        powerup_btn_3 = (_power_tier == 2);
        switch (_progress.upgrades.powerup_tier)
        {
            case 1: powerup_time = 3; break;
            case 2: powerup_time = 5; break;
            case 3: powerup_time = 10; break;
            default: powerup_time = 0; break;
        }
        player_cursor = _progress.cosmetics.selected;
        player_cursor_0 = _progress.cosmetics.owned[0];
        player_cursor_1 = _progress.cosmetics.owned[1];
        player_cursor_2 = _progress.cosmetics.owned[2];
        player_cursor_3 = _progress.cosmetics.owned[3];
    }
}

function ProgressionStartRun()
{
    if (!instance_exists(obj_game)) return;
    obj_game.points = 0;
    obj_game.run_coins = 0;
    obj_game.level = 1;
    obj_game.player_health = 3 + global.pp_progression.upgrades.health_tier;
    global.pp_new_high_score = false;
}

function ProgressionCompleteRun(_score, _run_coins)
{
    var _progress = global.pp_progression;
    var _score_clean = max(0, floor(_score));
    var _coins_clean = max(0, floor(_run_coins));
    var _banked = floor(_coins_clean * 0.90);

    global.pp_last_run_score = _score_clean;
    global.pp_last_run_coins = _coins_clean;
    global.pp_last_banked_coins = _banked;
    global.pp_new_high_score = (_score_clean > _progress.high_score);

    _progress.high_score = max(_progress.high_score, _score_clean);
    _progress.banked_coins += _banked;
    global.pp_progression = _progress;
    ProgressionApplyToInstances();
    SaveGame();
    SteamServiceSubmitRun(_score_clean);
}

function ProgressionUpgradeCost(_tier)
{
    var _costs = [5, 10, 15];
    if (_tier < 0 || _tier >= array_length(_costs)) return -1;
    return _costs[_tier];
}

function ProgressionBuyUpgrade(_upgrade_name)
{
    var _progress = global.pp_progression;
    var _tier = 0;

    switch (_upgrade_name)
    {
        case "health": _tier = _progress.upgrades.health_tier; break;
        case "speed": _tier = _progress.upgrades.speed_tier; break;
        case "powerup": _tier = _progress.upgrades.powerup_tier; break;
        default: return false;
    }

    var _cost = ProgressionUpgradeCost(_tier);
    if (_cost < 0 || _progress.banked_coins < _cost) return false;

    _progress.banked_coins -= _cost;
    switch (_upgrade_name)
    {
        case "health": _progress.upgrades.health_tier += 1; break;
        case "speed": _progress.upgrades.speed_tier += 1; break;
        case "powerup": _progress.upgrades.powerup_tier += 1; break;
    }

    global.pp_progression = _progress;
    ProgressionApplyToInstances();
    SaveGame();

    if (_progress.upgrades.health_tier >= 3
    && _progress.upgrades.speed_tier >= 3
    && _progress.upgrades.powerup_tier >= 3)
    {
        SteamServiceUnlock("ACH_FULLY_UPGRADED");
    }
    return true;
}

function ProgressionBuyCursor(_cursor_index)
{
    if (_cursor_index < 1 || _cursor_index > 3) return false;
    var _progress = global.pp_progression;

    if (_progress.cosmetics.owned[_cursor_index])
    {
        return ProgressionEquipCursor(_cursor_index);
    }
    if (_progress.banked_coins < 5) return false;

    _progress.banked_coins -= 5;
    _progress.cosmetics.owned[_cursor_index] = true;
    _progress.cosmetics.selected = _cursor_index;
    global.pp_progression = _progress;
    ProgressionApplyToInstances();
    SaveGame();
    return true;
}

function ProgressionEquipCursor(_cursor_index)
{
    var _progress = global.pp_progression;
    if (_cursor_index < 0 || _cursor_index >= array_length(_progress.cosmetics.owned)) return false;
    if (!_progress.cosmetics.owned[_cursor_index]) return false;

    _progress.cosmetics.selected = _cursor_index;
    global.pp_progression = _progress;
    ProgressionApplyToInstances();
    SaveGame();
    return true;
}

function ProgressionAcceptFerretQuest()
{
    var _quest = global.pp_progression.quest;
    if (_quest.thor_met) return false;
    _quest.thor_met = true;
    _quest.active = true;
    global.pp_progression.quest = _quest;
    ProgressionApplyToInstances();
    SaveGame();
    return true;
}

function ProgressionRescueFerret()
{
    var _quest = global.pp_progression.quest;
    if (!_quest.active || _quest.complete) return false;

    _quest.rescued = min(PP_FERRET_TARGET, _quest.rescued + 1);
    if (_quest.rescued >= PP_FERRET_TARGET)
    {
        _quest.active = false;
        _quest.complete = true;
    }
    global.pp_progression.quest = _quest;
    ProgressionApplyToInstances();
    SaveGame();
    return true;
}

function ProgressionClaimFerretReward()
{
    var _progress = global.pp_progression;
    if (!_progress.quest.complete || _progress.quest.reward_claimed) return false;

    _progress.quest.reward_claimed = true;
    _progress.cosmetics.ferret_unlocked = true;
    _progress.cosmetics.owned[4] = true;
    global.pp_progression = _progress;
    ProgressionApplyToInstances();
    SaveGame();
    SteamServiceUnlock("ACH_FERRET_RESCUE");
    return true;
}

function ProgressionStoreDestination()
{
    var _progress = global.pp_progression;
    if (!_progress.quest.thor_met && _progress.high_score >= 3000)
    {
        return rm_thor_help;
    }
    if (_progress.quest.complete && !_progress.quest.reward_claimed)
    {
        ProgressionClaimFerretReward();
    }
    return rm_store;
}

function PlayerTakeDamage(_amount)
{
    if (!instance_exists(obj_player) || !instance_exists(obj_game)) return false;
    if (obj_player.powerup == 2 || obj_player.invulnerability > 0) return false;

    obj_game.player_health = max(0, obj_game.player_health - max(0, _amount));
    obj_player.invulnerability = 60;
    effect_create_above(ef_explosion, obj_player.x, obj_player.y, 1, c_orange);
    return true;
}
