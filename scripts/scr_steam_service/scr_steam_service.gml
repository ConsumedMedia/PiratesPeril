/// Offline-safe Steam integration boundary.

#macro PP_STEAM_LEADERBOARD "PP_HIGH_SCORE"

function SteamServiceInit()
{
    global.pp_steam = {
        available : false,
        upload_request : -1,
        leaderboard_request : -1,
        leaderboard_entries : [],
        player_rank : -1,
    };

    try
    {
        global.pp_steam.available = steam_initialised();
    }
    catch (_exception)
    {
        global.pp_steam.available = false;
    }
    return global.pp_steam.available;
}

function SteamServiceTick()
{
    if (!variable_global_exists("pp_steam")) return;
    if (!global.pp_steam.available) return;
    try { steam_update(); }
    catch (_exception) { global.pp_steam.available = false; }
}

function SteamServiceUnlock(_achievement_id)
{
    if (!variable_global_exists("pp_steam") || !global.pp_steam.available) return false;
    try
    {
        if (!steam_get_achievement(_achievement_id)) steam_set_achievement(_achievement_id);
        return true;
    }
    catch (_exception)
    {
        global.pp_steam.available = false;
        return false;
    }
}

function SteamServiceSubmitRun(_score)
{
    if (_score <= 0) return false;
    if (!variable_global_exists("pp_steam") || !global.pp_steam.available) return false;
    try
    {
        global.pp_steam.upload_request = steam_upload_score(PP_STEAM_LEADERBOARD, floor(_score));
        return true;
    }
    catch (_exception)
    {
        global.pp_steam.available = false;
        return false;
    }
}

function SteamServiceRequestLeaderboard()
{
    if (!variable_global_exists("pp_steam") || !global.pp_steam.available) return false;
    try
    {
        global.pp_steam.leaderboard_request = steam_download_scores(PP_STEAM_LEADERBOARD, 1, 10);
        return true;
    }
    catch (_exception)
    {
        global.pp_steam.available = false;
        return false;
    }
}

function SteamServiceHandleAsync(_async)
{
    if (!variable_global_exists("pp_steam") || !ds_exists(_async, ds_type_map)) return;
    if (!ds_map_exists(_async, "event_type")) return;

    var _event_type = _async[? "event_type"];
    if (_event_type != "leaderboard_download") return;
    if (!ds_map_exists(_async, "id") || _async[? "id"] != global.pp_steam.leaderboard_request) return;

    global.pp_steam.leaderboard_entries = [];
    global.pp_steam.player_rank = -1;
    if (!ds_map_exists(_async, "num_entries") || _async[? "num_entries"] <= 0) return;

    var _decoded = json_decode(_async[? "entries"]);
    if (!ds_exists(_decoded, ds_type_map) || !ds_map_exists(_decoded, "entries"))
    {
        if (ds_exists(_decoded, ds_type_map)) ds_map_destroy(_decoded);
        return;
    }

    var _entries = _decoded[? "entries"];
    for (var i = 0; i < ds_list_size(_entries); i++)
    {
        var _entry = _entries[| i];
        var _row = {
            rank : _entry[? "rank"],
            score : _entry[? "score"],
            player_name : _entry[? "name"],
            user_id : _entry[? "userID"],
        };
        array_push(global.pp_steam.leaderboard_entries, _row);
        if (global.pp_steam.available && _row.user_id == steam_get_user_steam_id())
        {
            global.pp_steam.player_rank = _row.rank;
        }
    }
    ds_map_destroy(_decoded);
}
