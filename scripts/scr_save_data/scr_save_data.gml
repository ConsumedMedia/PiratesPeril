/// Versioned, atomic local save. Steam Auto-Cloud should sync savedgame.save.

#macro PP_SAVE_FILE "savedgame.save"
#macro PP_SAVE_TEMP "savedgame.tmp"
#macro PP_SAVE_BACKUP "savedgame.bak"

function SaveGame()
{
    if (!variable_global_exists("pp_progression")) return false;

    global.pp_progression.schema_version = PP_SAVE_SCHEMA;
    var _json = json_stringify(global.pp_progression);
    var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
    buffer_write(_buffer, buffer_string, _json);
    buffer_save(_buffer, PP_SAVE_TEMP);
    buffer_delete(_buffer);

    if (file_exists(PP_SAVE_BACKUP)) file_delete(PP_SAVE_BACKUP);
    if (file_exists(PP_SAVE_FILE)) file_copy(PP_SAVE_FILE, PP_SAVE_BACKUP);
    if (file_exists(PP_SAVE_FILE)) file_delete(PP_SAVE_FILE);
    file_rename(PP_SAVE_TEMP, PP_SAVE_FILE);
    return file_exists(PP_SAVE_FILE);
}

function DeleteSaveGame()
{
    if (file_exists(PP_SAVE_FILE)) file_delete(PP_SAVE_FILE);
    if (file_exists(PP_SAVE_TEMP)) file_delete(PP_SAVE_TEMP);
    if (file_exists(PP_SAVE_BACKUP)) file_delete(PP_SAVE_BACKUP);
    global.pp_progression = ProgressionDefaults();
    ProgressionApplyToInstances();
    return true;
}
