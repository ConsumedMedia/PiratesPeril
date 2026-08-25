/// Endless difficulty and spawning rules.

function RunDirectorReputation(_score)
{
    return clamp(floor(max(0, _score) / 1000) + 1, 1, 5);
}

function RunDirectorEndlessTier(_score)
{
    return max(0, floor(max(0, _score) / 1000) - 5);
}

function RunDirectorSpawnDelay(_score)
{
    var _phase = RunDirectorReputation(_score);
    var _base_delays = [360, 320, 280, 250, 240];
    var _delay = _base_delays[_phase - 1];
    if (_phase >= 5)
    {
        _delay = round(_delay * power(0.95, RunDirectorEndlessTier(_score)));
    }
    return max(60, _delay);
}

function RunDirectorEnemyCap(_score)
{
    return min(12, 5 + floor(RunDirectorEndlessTier(_score) / 2));
}

function RunDirectorEnemyCount()
{
    return instance_number(obj_enemy)
         + instance_number(obj_enemy2)
         + instance_number(obj_enemy3)
         + instance_number(obj_enemy4)
         + instance_number(obj_enemy_treasure);
}

function RunDirectorChooseEnemy(_phase)
{
    switch (_phase)
    {
        case 1: return obj_enemy;
        case 2: return choose(obj_enemy, obj_enemy, obj_enemy2);
        case 3: return choose(obj_enemy, obj_enemy2, obj_enemy3);
        default: return choose(obj_enemy2, obj_enemy3, obj_enemy4);
    }
}

function RunDirectorSpawn(_spawn_x, _spawn_y, _heading)
{
    if (!instance_exists(obj_game) || !instance_exists(obj_player)) return noone;
    if (RunDirectorEnemyCount() >= RunDirectorEnemyCap(obj_game.points)) return noone;

    var _phase = RunDirectorReputation(obj_game.points);
    var _enemy_type = RunDirectorChooseEnemy(_phase);
    if (_phase >= 2 && irandom(9) == 0) _enemy_type = obj_enemy_treasure;

    var _enemy = instance_create_layer(_spawn_x, _spawn_y, "Instances", _enemy_type);
    _enemy.direction = _heading;
    _enemy.image_angle = _heading;
    _enemy.yspeed = 1;
    return _enemy;
}

function RunDirectorDropLoot(_drop_x, _drop_y, _quantity)
{
    var _phase = RunDirectorReputation(obj_game.points);
    for (var i = 0; i < _quantity; i++)
    {
        var _loot = obj_coin_silver;
        var _roll = irandom(99);
        if (_phase == 2 && _roll < 20) _loot = obj_coin_gold;
        if (_phase == 3)
        {
            if (_roll < 15) _loot = obj_emerald;
            else if (_roll < 40) _loot = obj_coin_gold;
        }
        if (_phase >= 4)
        {
            if (_roll < 10) _loot = obj_diamond;
            else if (_roll < 30) _loot = obj_emerald;
            else if (_roll < 60) _loot = obj_coin_gold;
        }
        instance_create_layer(_drop_x + irandom_range(-12, 12), _drop_y + irandom_range(-12, 12), "Instances", _loot);
    }
}

function RunDirectorMaybeDropPowerup(_drop_x, _drop_y)
{
    if (obj_game.powerup_time >= 0) return;
    var _powerup = choose(
        obj_powerup_spread,
        obj_powerup_ghost,
        obj_powerup_side_spread,
        obj_powerup_fast_shot,
        obj_powerup_x2,
        obj_powerup_stop_enemy,
        obj_powerup_spread_fast
    );
    instance_create_layer(_drop_x, _drop_y, "Instances", _powerup);
    obj_game.powerup_time = 20;
}

function EnemyTakeBullet(_enemy, _bullet, _damage_sprites, _treasure_ship)
{
    if (!instance_exists(_enemy)) return false;

    RunDirectorMaybeDropPowerup(_enemy.x, _enemy.y);
    var _score = 50;
    if (instance_exists(obj_player) && obj_player.powerup == 5) _score *= 2;
    obj_game.points += _score;

    _enemy.enemy_life -= 1;
    instance_destroy(_bullet);
    effect_create_above(ef_explosion, _enemy.x, _enemy.y, 1, c_orange);
    if (!obj_btn_sound_fx.sound_fx_off)
    {
        audio_play_sound(snd_rockdestroy, 0, false, 1, 0, random_range(0.6, 1.1));
    }

    if (_enemy.enemy_life <= 0)
    {
        SteamServiceUnlock("ACH_FIRST_SINK");
        var _drop_x = _enemy.x;
        var _drop_y = _enemy.y;
        if (_treasure_ship)
        {
            SteamServiceUnlock("ACH_TREASURE_SHIP");
            if (global.pp_progression.quest.active)
            {
                instance_create_layer(_drop_x, _drop_y, "Instances", obj_ferret);
            }
            RunDirectorDropLoot(_drop_x, _drop_y, 3);
        }
        else
        {
            RunDirectorDropLoot(_drop_x, _drop_y, 1);
        }
        instance_destroy(_enemy);
        return true;
    }

    if (is_array(_damage_sprites) && array_length(_damage_sprites) > 0)
    {
        var _damage_index = clamp(array_length(_damage_sprites) - _enemy.enemy_life, 0, array_length(_damage_sprites) - 1);
        _enemy.sprite_index = _damage_sprites[_damage_index];
    }
    _enemy.direction = irandom(359);
    return false;
}
