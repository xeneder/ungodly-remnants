grass_sprites = [spr_lab_grass_01, spr_lab_grass_02, spr_lab_grass_03, spr_lab_grass_04, spr_lab_grass_05, spr_lab_grass_06, spr_lab_grass_07, spr_lab_grass_08, spr_lab_grass_09, spr_lab_grass_10];
forest_sprites = [spr_lab_forest_01, spr_lab_forest_02, spr_lab_forest_03, spr_lab_forest_04, spr_lab_forest_05];
water_sprites = [spr_lab_water_01, spr_lab_water_02];
unit_sprites = [
    [
        [spr_ecclesian_idle_front, spr_ecclesian_idle_front_right, spr_ecclesian_idle_right, spr_ecclesian_idle_back_right, spr_ecclesian_idle_back, spr_ecclesian_idle_back_left, spr_ecclesian_idle_left, spr_ecclesian_idle_front_left],
        [spr_ecclesian_walk_front, spr_ecclesian_walk_front_right, spr_ecclesian_walk_right, spr_ecclesian_walk_back_right, spr_ecclesian_walk_back, spr_ecclesian_walk_back_left, spr_ecclesian_walk_left, spr_ecclesian_walk_front_left],
        [spr_ecclesian_pray_front, spr_ecclesian_pray_front_right, spr_ecclesian_pray_right, spr_ecclesian_pray_back_right, spr_ecclesian_pray_back, spr_ecclesian_pray_back_left, spr_ecclesian_pray_left, spr_ecclesian_pray_front_left],
        [spr_ecclesian_hit_front, spr_ecclesian_hit_front_right, spr_ecclesian_hit_right, spr_ecclesian_hit_back_right, spr_ecclesian_hit_back, spr_ecclesian_hit_back_left, spr_ecclesian_hit_left, spr_ecclesian_hit_front_left],
        [spr_ecclesian_death_front, spr_ecclesian_death_front_right, spr_ecclesian_death_right, spr_ecclesian_death_back_right, spr_ecclesian_death_back, spr_ecclesian_death_back_left, spr_ecclesian_death_left, spr_ecclesian_death_front_left],
    ],
    [
        [spr_militia_idle_front, spr_militia_idle_front_right, spr_militia_idle_right, spr_militia_idle_back_right, spr_militia_idle_back, spr_militia_idle_back_left, spr_militia_idle_left, spr_militia_idle_front_left],
        [spr_militia_walk_front, spr_militia_walk_front_right, spr_militia_walk_right, spr_militia_walk_back_right, spr_militia_walk_back, spr_militia_walk_back_left, spr_militia_walk_left, spr_militia_walk_front_left],
        [spr_militia_attack_front, spr_militia_attack_front_right, spr_militia_attack_right, spr_militia_attack_back_right, spr_militia_attack_back, spr_militia_attack_back_left, spr_militia_attack_left, spr_militia_attack_front_left],
        [spr_militia_hit_front, spr_militia_hit_front_right, spr_militia_hit_right, spr_militia_hit_back_right, spr_militia_hit_back, spr_militia_hit_back_left, spr_militia_hit_left, spr_militia_hit_front_left],
        [spr_militia_death_front, spr_militia_death_front_right, spr_militia_death_right, spr_militia_death_back_right, spr_militia_death_back, spr_militia_death_back_left, spr_militia_death_left, spr_militia_death_front_left],
    ],
    [
        [spr_scourge_idle_front, spr_scourge_idle_front_right, spr_scourge_idle_right, spr_scourge_idle_back_right, spr_scourge_idle_back, spr_scourge_idle_back_left, spr_scourge_idle_left, spr_scourge_idle_front_left],
        [spr_scourge_walk_front, spr_scourge_walk_front_right, spr_scourge_walk_right, spr_scourge_walk_back_right, spr_scourge_walk_back, spr_scourge_walk_back_left, spr_scourge_walk_left, spr_scourge_walk_front_left],
        [spr_scourge_attack_front, spr_scourge_attack_front_right, spr_scourge_attack_right, spr_scourge_attack_back_right, spr_scourge_attack_back, spr_scourge_attack_back_left, spr_scourge_attack_left, spr_scourge_attack_front_left],
        [spr_scourge_hit_front, spr_scourge_hit_front_right, spr_scourge_hit_right, spr_scourge_hit_back_right, spr_scourge_hit_back, spr_scourge_hit_back_left, spr_scourge_hit_left, spr_scourge_hit_front_left],
        [spr_scourge_death_front, spr_scourge_death_front_right, spr_scourge_death_right, spr_scourge_death_back_right, spr_scourge_death_back, spr_scourge_death_back_left, spr_scourge_death_left, spr_scourge_death_front_left],
    ],
];
corruption_sprites = [spr_corruption_01, spr_corruption_02, spr_corruption_03, spr_corruption_04, spr_corruption_05, spr_corruption_06, spr_corruption_07];
/// Asset Lab: deterministic isometric scene and all-direction animation inspection.
web_layout_test=environment_get_variable("UNGODLY_WEB_LAYOUT_TEST")!="";
web_layout=(os_type==os_operagx) || web_layout_test;
web_camera_owned=-1;
lab_width = 1440;
lab_height = 900;
// The first room also supplies these dimensions before Create runs in GX.
// Configure the native camera explicitly so its layout remains independent.
{
    view_enabled=true;
    for (var _view=0; _view<8; ++_view) view_visible[_view]=(_view==0);
    if (view_camera[0]==-1) {
        web_camera_owned=camera_create_view(0,0,lab_width,lab_height,0,-1,-1,-1,-1,-1);
        view_camera[0]=web_camera_owned;
    }
    camera_set_view_pos(view_camera[0],0,0);
    camera_set_view_size(view_camera[0],lab_width,lab_height);
    view_xport[0]=0; view_yport[0]=0;
    view_wport[0]=web_layout ? lab_width : 1280; view_hport[0]=web_layout ? lab_height : 800;
}
display_set_gui_size(lab_width, lab_height);
if (web_layout_test) window_set_fullscreen(false);
window_set_size(web_layout ? lab_width : 1280,web_layout ? lab_height : 800);
window_set_caption("Ungodly Remnants | Asset Lab");

lab_mode = 0;
av_test_mode=environment_get_variable("UNGODLY_AV_TEST")!="";
player_test_mode=environment_get_variable("UNGODLY_PLAYER_TEST")!="";
player_test_stage=0; player_test_frame=0; player_test_capture="";
aspect_test_mode=environment_get_variable("UNGODLY_ASPECT_TEST")!="";
aspect_test_index=0; aspect_test_frame=0;
aspect_test_sizes=[[1280,720],[1024,768],[1280,800],[0,0]];
av_test_frame=0;
startup_fixture = av_test_mode || environment_get_variable("UNGODLY_UNIT_TEST")!="" || environment_get_variable("UNGODLY_GUI_TEST")!="";
startup_test_mode = startup_fixture || environment_get_variable("UNGODLY_BLOCK5_TEST")!="" || environment_get_variable("UNGODLY_WORLD_TEST")!="";
map_test_mode=environment_get_variable("UNGODLY_MAP_TEST")!="";
map_presets=[{name:"Small",side:48,ally_limit:30},{name:"Standard",side:64,ally_limit:40},
    {name:"Huge",side:80,ally_limit:60}];
if (!variable_global_exists("map_preset")) global.map_preset=1;
menu_map_preset=startup_test_mode ? 1 : clamp(global.map_preset,0,2);
map_size=map_presets[menu_map_preset].side;
start_offset = (map_size-1)*0.5-4;
// Logical placement pitch; source tiles stay 128x64 and overlap the soft edges.
cell_width = 124;
cell_height = 60;
camera_x = 0;
camera_y = cell_height * ((map_size-1)*0.5+2);
map_zoom = 0.60;
gallery_scale = 0.85;
paused = false;
show_grid = false;
show_anchors = false;
show_bounds = false;
show_labels = false;
auto_cycle = false;
anim_action = 0;
anim_time = 0;
cycle_time = 0;
facing_index = 0;
selected_prop = -1;
mouse_gui_x = 0;
mouse_gui_y = 0;
last_mouse_x = 0;
last_mouse_y = 0;
hover_gx = -1;
hover_gy = -1;
capture_root = environment_get_variable("UNGODLY_ASSET_LAB_CAPTURE");
if (capture_root != "") {
    capture_root = working_directory + "asset_lab_qa";
    directory_create(capture_root);
    show_debug_message("ASSET_LAB_CAPTURE_DIR:" + capture_root);
}
capture_tick = 0;
direction_labels = ["front", "front_right", "right", "back_right", "back", "back_left", "left", "front_left"];
unit_labels = ["ECCLESIAN / Solar Oracle", "MILITIA / Bronze Sentinel", "SCOURGE / Stoneclaw Behemoth"];
action_labels = ["IDLE", "WALK", "PRAY / ATTACK", "HIT", "DEATH"];

// All runtime particles and audio belong to this controller. Nothing survives
// a match reset or its Clean Up event. Asset particle types remain engine-owned.
av_particles=[];
av_particle_keys={};
av_loops={};
av_voices=[];
av_music_voice=-1;
av_music_asset=-1;
av_particle_clock=0;
av_sfx_cooldowns={};
av_visible=function(_gx,_gy) {
    if (!fog_can_see(_gx,_gy)) return false;
    var _w=iso_to_world(_gx,_gy), _s=world_to_gui(_w[0],_w[1]);
    return _s[0]>=-128*map_zoom && _s[0]<=lab_width+128*map_zoom
        && _s[1]>=gui_top-128*map_zoom && _s[1]<=gui_bottom+160*map_zoom;
};
av_live=function() {
    return variable_instance_exists(id,"app_state") && app_state=="playing" && lab_mode==0 && !sim_over;
};
av_sound=function(_sound,_gain=0.7,_gx=undefined,_gy=undefined) {
    if (_sound<0 || !audio_exists(_sound)) return -1;
    if (!is_undefined(_gx) && (!av_live() || paused || !av_visible(_gx,_gy))) return -1;
    // Per-asset debounce and a voice cap keep mass combat/recruitment bounded.
    var _key=string(_sound), _now=current_time;
    if (variable_struct_exists(av_sfx_cooldowns,_key) && _now<av_sfx_cooldowns[$ _key]) return -1;
    av_sfx_cooldowns[$ _key]=_now+65;
    if (array_length(av_voices)>=24) { if (audio_is_playing(av_voices[0])) audio_stop_sound(av_voices[0]); array_delete(av_voices,0,1); }
    var _voice=audio_play_sound(_sound,5,false,_gain);
    if (_voice!=-1) array_push(av_voices,_voice);
    return _voice;
};
av_set_music=function(_sound) {
    if (av_music_asset==_sound && av_music_voice!=-1 && audio_is_playing(av_music_voice)) return;
    if (av_music_voice!=-1 && audio_is_playing(av_music_voice)) audio_stop_sound(av_music_voice);
    av_music_asset=_sound;
    av_music_voice=audio_play_sound(_sound,100,true,0.32);
};
av_stop_loop=function(_key) {
    if (!variable_struct_exists(av_loops,_key)) return;
    if (av_loops[$ _key]!=-1 && audio_is_playing(av_loops[$ _key])) audio_stop_sound(av_loops[$ _key]);
    variable_struct_remove(av_loops,_key);
};
av_set_loop=function(_key,_sound,_wanted,_gain) {
    if (!_wanted) { av_stop_loop(_key); return; }
    if (variable_struct_exists(av_loops,_key) && audio_is_playing(av_loops[$ _key])) return;
    var _voice=audio_play_sound(_sound,10,true,_gain);
    if (_voice!=-1) av_loops[$ _key]=_voice;
};
av_destroy_particle=function(_effect) {
    if (part_system_exists(_effect.system)) part_system_destroy(_effect.system);
    if (_effect.key!="") variable_struct_remove(av_particle_keys,_effect.key);
    _effect.system=-1;
};
av_clear_world=function(_stop_voices=true) {
    for (var _i=0; _i<array_length(av_particles); ++_i) av_destroy_particle(av_particles[_i]);
    av_particles=[]; av_particle_keys={}; av_particle_clock=0;
    var _keys=variable_struct_get_names(av_loops);
    for (var _i=0; _i<array_length(_keys); ++_i) av_stop_loop(_keys[_i]);
    if (_stop_voices) {
        for (var _i=0; _i<array_length(av_voices); ++_i) if (audio_is_playing(av_voices[_i])) audio_stop_sound(av_voices[_i]);
        av_voices=[]; av_sfx_cooldowns={};
    }
};
av_cleanup=function() {
    av_clear_world();
    if (av_music_voice!=-1 && audio_is_playing(av_music_voice)) audio_stop_sound(av_music_voice);
    av_music_voice=-1; av_music_asset=-1;
};
av_create_particle=function(_asset,_gx,_gy,_key="",_lift=0) {
    var _system=part_system_create(_asset);
    part_system_automatic_draw(_system,false);
    part_system_automatic_update(_system,false);
    var _w=iso_to_world(_gx,_gy);
    part_system_position(_system,_w[0],_w[1]-_lift);
    var _effect={system:_system,key:_key,gx:_gx,gy:_gy,keep:true,steps:0};
    array_push(av_particles,_effect);
    if (_key!="") av_particle_keys[$ _key]=_effect;
    return _effect;
};
av_burst=function(_asset,_gx,_gy,_lift=0) {
    if (!av_live() || paused || !av_visible(_gx,_gy)) return;
    // Burst assets emit once on their first update. At most 64 simultaneous
    // impacts/spawns can exist; discard the oldest transient at the cap.
    var _bursts=0, _oldest=-1;
    for (var _i=0; _i<array_length(av_particles); ++_i) if (av_particles[_i].key=="") {
        _bursts++; if (_oldest<0) _oldest=_i;
    }
    if (_bursts>=64) { av_destroy_particle(av_particles[_oldest]); array_delete(av_particles,_oldest,1); }
    av_create_particle(_asset,_gx,_gy,"",_lift);
};
av_keep_particle=function(_asset,_gx,_gy,_key) {
    if (variable_struct_exists(av_particle_keys,_key)) { av_particle_keys[$ _key].keep=true; return; }
    av_create_particle(_asset,_gx,_gy,_key);
};
av_tick=function(_dt) {
    av_set_music(app_state=="playing" ? mus_gameplay : mus_title);
    for (var _i=array_length(av_voices)-1; _i>=0; --_i)
        if (!audio_is_playing(av_voices[_i])) array_delete(av_voices,_i,1);
    if (!av_live()) { av_clear_world(false); return; }
    // Reconcile with the real map every frame: no retained references to dead
    // units, historical nodes, cleansed terrain, or particles hidden by fog.
    for (var _i=0; _i<array_length(av_particles); ++_i) av_particles[_i].keep=false;
    var _ambient=false, _purifying=false;
    if (lab_mode==0) {
        // Invert the same viewport used by the ground renderer. Never walk the
        // entire 80x80 map merely to find visible corruption particle sources.
        var _view_top=gui_to_world(-128*map_zoom,gui_top-128*map_zoom);
        var _view_bottom=gui_to_world(lab_width+128*map_zoom,gui_bottom+160*map_zoom);
        var _left=_view_top[0], _right=_view_bottom[0], _top=_view_top[1], _bottom=_view_bottom[1];
        var _sum0=max(0,ceil(_top/(cell_height*0.5))), _sum1=min(map_size*2-2,floor(_bottom/(cell_height*0.5)));
        for (var _sum=_sum0; _sum<=_sum1; ++_sum) {
            var _gx0=max(0,_sum-map_size+1,ceil((_sum+_left/(cell_width*0.5))*0.5));
            var _gx1=min(map_size-1,_sum,floor((_sum+_right/(cell_width*0.5))*0.5));
            for (var _gx=_gx0; _gx<=_gx1; ++_gx) {
                var _gy=_sum-_gx, _idx=_gy*map_size+_gx;
                if (terrain[_idx]==2 && fog_visible[_idx]) av_keep_particle(ps_corruption,_gx,_gy,"c"+string(_idx));
            }
        }
        for (var _i=0; _i<array_length(nodes); ++_i) {
            var _n=nodes[_i];
            if (!_n.active || !av_visible(_n.gx,_n.gy)) continue;
            _ambient=true;
            var _praying=false;
            for (var _j=0; _j<array_length(units); ++_j) {
                var _u=units[_j];
                if (_u.kind==0 && _u.hp>0 && _u.action==2 && _u.order==2 && _u.objective==_n
                    && object_distance(_u,_n)<=0.85) { _praying=true; break; }
            }
            if (_praying) { av_keep_particle(ps_holy,_n.gx,_n.gy,"h"+string(_i)); _purifying=true; }
        }
    }
    av_set_loop("infestation",snd_infestation_ambient,_ambient && !paused,0.28);
    av_set_loop("purification",snd_purification,_purifying && !paused,0.55);
    // Authored particle lifetimes and velocities use 60-Hz steps. Manually
    // advance with simulation time so pause and variable frame rates agree.
    if (!paused) av_particle_clock+=_dt*60;
    var _steps=floor(av_particle_clock); av_particle_clock-=_steps;
    for (var _i=array_length(av_particles)-1; _i>=0; --_i) {
        var _effect=av_particles[_i];
        if (!av_visible(_effect.gx,_effect.gy) || (_effect.key!="" && !_effect.keep)) {
            av_destroy_particle(_effect); array_delete(av_particles,_i,1); continue;
        }
        repeat (_steps) { part_system_update(_effect.system); _effect.steps++; }
        if (_effect.key=="" && _effect.steps>0 && part_particles_count(_effect.system)==0) {
            av_destroy_particle(_effect); array_delete(av_particles,_i,1);
        }
    }
};
av_draw=function(_ground) {
    var _matrix=matrix_get(matrix_world);
    var _origin=world_to_gui(0,0);
    matrix_set(matrix_world,matrix_build(_origin[0],_origin[1],0,0,0,0,map_zoom,map_zoom,1));
    for (var _i=0; _i<array_length(av_particles); ++_i) {
        var _effect=av_particles[_i];
        if ((string_pos("c",_effect.key)==1)==_ground && av_visible(_effect.gx,_effect.gy)) part_system_drawit(_effect.system);
    }
    matrix_set(matrix_world,_matrix);
};

iso_to_world = function(_gx, _gy) {
    return [(_gx - _gy) * cell_width * 0.5, (_gx + _gy) * cell_height * 0.5];
};
world_to_iso = function(_wx, _wy) {
    // Cells are centred at integer coordinates, hence nearest-integer picking.
    return [floor((_wx / (cell_width*0.5) + _wy / (cell_height*0.5)) * 0.5 + 0.5),
            floor((_wy / (cell_height*0.5) - _wx / (cell_width*0.5)) * 0.5 + 0.5)];
};
world_to_gui = function(_wx, _wy) {
    return [720 + (_wx - camera_x) * map_zoom, 480 + (_wy - camera_y) * map_zoom];
};
gui_to_world = function(_sx, _sy) {
    return [camera_x + (_sx - 720) / map_zoom, camera_y + (_sy - 480) / map_zoom];
};
animation_frame = function(_spr, _unit) {
    var _count = sprite_get_number(_spr);
    var _frame = floor(anim_time * 10 + 0.00001);
    var _loop = anim_action < 2 || (anim_action == 2 && _unit == 0);
    return _loop ? (_frame mod _count) : min(_frame, _count - 1);
};
diamond = function(_sx, _sy, _width, _height, _colour) {
    draw_set_colour(_colour);
    draw_line(_sx, _sy-_height*0.5, _sx+_width*0.5, _sy);
    draw_line(_sx+_width*0.5, _sy, _sx, _sy+_height*0.5);
    draw_line(_sx, _sy+_height*0.5, _sx-_width*0.5, _sy);
    draw_line(_sx-_width*0.5, _sy, _sx, _sy-_height*0.5);
};
anchor = function(_sx, _sy, _colour) {
    draw_set_colour(_colour);
    draw_line(_sx-5, _sy, _sx+5, _sy);
    draw_line(_sx, _sy-5, _sx, _sy+5);
    draw_circle(_sx, _sy, 2, true);
};
sprite_box = function(_spr, _sx, _sy, _scale) {
    var _left = _sx - sprite_get_xoffset(_spr) * _scale;
    var _top = _sy - sprite_get_yoffset(_spr) * _scale;
    draw_set_colour(make_colour_rgb(120, 151, 176));
    draw_rectangle(_left, _top, _left + sprite_get_width(_spr)*_scale,
                   _top + sprite_get_height(_spr)*_scale, true);
};

props = [];
add_prop = function(_label, _sprite, _gx, _gy, _span, _fps, _unit) {
    // Even footprints sit between four cell centres and occupy exactly span x span cells.
    if (_span mod 2 == 0) { _gx += 0.5; _gy += 0.5; }
    array_push(props, { label:_label, spr:_sprite, gx:_gx, gy:_gy, span:_span,
                       fps:_fps, unit:_unit, offset_x:0, offset_y:0, scale:1 });
};
add_prop("City*", spr_city_state, 4, 4, 5, 0, -1);
add_prop("Outpost", spr_outpost, 10, 6, 2, 0, -1);
add_prop("Sentrion", spr_sentrion_work, 6, 9, 2, 5, -1);
add_prop("Windmill", spr_windmill, 3, 12, 2, 0, -1);
add_prop("Remnant", spr_remnant, 8, 14, 1, 4, -1);
add_prop("Node 01*", spr_infestation_node_01, 12, 13, 2, 4, -1);
add_prop("Node 02*", spr_infestation_node_02, 15, 12, 2, 4, -1);
add_prop("Node 03*", spr_infestation_node_03, 14, 16, 2, 4, -1);
var _forest_positions = [[1,8],[2,15],[6,15],[8,1],[15,6],[16,9]];
for (var _i = 0; _i < array_length(_forest_positions); ++_i) {
    add_prop("Forest 256x204", forest_sprites[_i mod array_length(forest_sprites)],
        _forest_positions[_i][0], _forest_positions[_i][1], 2, 0, -1);
}
add_prop("Ecclesian", unit_sprites[0][0][0], 7, 6, 1, 10, 0);
add_prop("Militia", unit_sprites[1][0][0], 8, 8, 1, 10, 1);
add_prop("Scourge", unit_sprites[2][0][0], 11, 10, 1, 10, 2);

// Permanent IDs survive depth sorting and keep selection stable.
for (var _i = 0; _i < array_length(props); ++_i) props[_i].id = _i;
array_sort(props, function(_a, _b) {
    return sign((_a.gx + _a.gy) - (_b.gx + _b.gy));
});
terrain = array_create(map_size * map_size, 0);
terrain_style = array_create(map_size * map_size, 0);
// Keep the starting settlement together; the City sits at the map centre.
for (var _i=array_length(props)-1; _i>=0; --_i) {
    var _p=props[_i];
    if (_p.id>=5 && _p.id<=7) { array_delete(props,_i,1); continue; }
    _p.gx+=start_offset; _p.gy+=start_offset;
}
for (var _gy = 0; _gy < map_size; ++_gy) {
    for (var _gx = 0; _gx < map_size; ++_gx) {
        var _idx = _gy * map_size + _gx;
        if (startup_fixture && _gx >= 12 && _gy <= 4) terrain[_idx] = 1;
    }
}

// Executable coordinate check for this diagnostic scene.
if (startup_test_mode) for (var _gy = 0; _gy < map_size; ++_gy) {
    for (var _gx = 0; _gx < map_size; ++_gx) {
        var _w = iso_to_world(_gx, _gy);
        var _g = world_to_iso(_w[0], _w[1]);
        if (_g[0] != _gx || _g[1] != _gy) show_error("Asset Lab: coordinate round trip failed", true);
    }
}
// Confirm all 120 combinations resolve, and one-shot playback holds its final frame.
anim_time = 999;
for (var _action = 0; _action < 5; ++_action) {
    anim_action = _action;
    for (var _unit = 0; _unit < 3; ++_unit) {
        for (var _dir = 0; _dir < 8; ++_dir) {
            var _spr = unit_sprites[_unit][_action][_dir];
            var _count = sprite_get_number(_spr);
            var _frame = animation_frame(_spr, _unit);
            var _loop = _action < 2 || (_action == 2 && _unit == 0);
            if (_count < 1 || _frame < 0 || _frame >= _count || (!_loop && _frame != _count-1)) {
                show_error("Asset Lab: invalid animation " + sprite_get_name(_spr), true);
            }
            if (_unit == 0 && _action == 3 && _count != 16) {
                show_error("Asset Lab: Ecclesian hit must retain 16 frames", true);
            }
        }
    }
}
anim_action = 0;
anim_time = 0;
show_debug_message("ASSET_LAB_READY: coordinate checks + all 120 animation checks passed");

// Block 3/4 simulation. Logical positions are continuous terrain coordinates.
// One obstacle raster; weighted A* prioritises prompt, collision-safe routes.
// A 1.2 heuristic weight avoids exhaustive equal-cost plateaus around buildings.
show_anchors = false;
show_labels = false;
window_set_caption("Ungodly Remnants | Units and cleansing");
nav = { side:map_size*3, solid:[], edges:[], fields:[], clock:0, cursor:0,
        expanded:0, hits:0, misses:0, budget:384, capacity:24, budget_us:1800,
        revision:0, frame:0, elapsed_us:0, search_limit:4096, heuristic_weight:1.2, rebuild_progress:0, labels_valid:false };
nav.count = nav.side*nav.side;
nav.solid = array_create(nav.count, false);
nav.edges = array_create(nav.count, []);
// One numeric workspace is shared by the bounded FIFO. Epoch stamps avoid
// clearing full-map arrays on commands, and neighbour expansion allocates nothing.
nav.search_stamp=array_create(nav.count,0); nav.search_closed=array_create(nav.count,0);
nav.search_g=array_create(nav.count,0); nav.search_score=array_create(nav.count,0);
nav.search_parent=array_create(nav.count,-1); nav.search_position=array_create(nav.count,-1);
nav.search_heap=array_create(nav.count,0); nav.search_size=0; nav.search_epoch=0; nav.active=undefined;
nav_index = function(_gx, _gy) {
    var _cx = floor((_gx+0.5)*3), _cy = floor((_gy+0.5)*3);
    if (_cx<0 || _cy<0 || _cx>=nav.side || _cy>=nav.side) return -1;
    return _cy*nav.side+_cx;
};
nav_x = function(_index) { return (_index mod nav.side + 0.5)/3-0.5; };
nav_y = function(_index) { return (_index div nav.side + 0.5)/3-0.5; };
nav_open = function(_gx, _gy) {
    var _idx = nav_index(_gx,_gy);
    return _idx>=0 && !nav.solid[_idx];
};
nav_links = function(_i) {
    var _links=[];
    if (!nav.solid[_i]) {
        var _cx=_i mod nav.side, _cy=_i div nav.side;
        for (var _dy=-1; _dy<=1; ++_dy) for (var _dx=-1; _dx<=1; ++_dx) {
            if (_dx==0 && _dy==0) continue;
            var _nx=_cx+_dx, _ny=_cy+_dy;
            if (_nx<0 || _ny<0 || _nx>=nav.side || _ny>=nav.side) continue;
            var _n=_ny*nav.side+_nx;
            if (nav.solid[_n]) continue;
            if (_dx!=0 && _dy!=0 && (nav.solid[_cy*nav.side+_nx] || nav.solid[_ny*nav.side+_cx])) continue;
            array_push(_links,_n);
        }
    }
    nav.edges[_i]=_links;
};
nav_terrain_wall = function(_i) {
    var _gx=nav_x(_i), _gy=nav_y(_i);
    if (_gx< -0.34 || _gy< -0.34 || _gx>map_size-0.66 || _gy>map_size-0.66) return true;
    // Inflate every generated lake, rather than the old hard-coded NE rectangle.
    for (var _yy=max(0,ceil(_gy-0.66)); _yy<=min(map_size-1,floor(_gy+0.66)); ++_yy)
    for (var _xx=max(0,ceil(_gx-0.66)); _xx<=min(map_size-1,floor(_gx+0.66)); ++_xx)
        if (terrain[_yy*map_size+_xx]==1) return true;
    return false;
};
nav_components_begin = function() {
    nav.labels=array_create(nav.count,-1); nav.labels_valid=false;
    nav.component_queue=[]; nav.component_head=0; nav.component_id=0;
    nav.rebuild_phase=3; nav.rebuild_at=0; nav.rebuild_progress=0.75;
};
nav_rebuild_begin = function(_with_labels=true) {
    nav.fields=[]; nav.active=undefined; nav.cursor=0; nav.revision++;
    nav.rebuild_phase=0; nav.rebuild_at=0; nav.rebuild_prop=0; nav.rebuild_progress=0; nav.with_labels=_with_labels;
    nav.labels=array_create(nav.count,-1); nav.labels_valid=false;
    nav.component_queue=[]; nav.component_head=0; nav.component_id=0;
};
nav_rebuild_step = function(_budget_us=3000) {
    var _began=get_timer(), _work=0;
    while (_work<1024 && get_timer()-_began<_budget_us) {
        if (nav.rebuild_phase==0) {
            nav.solid[nav.rebuild_at]=nav_terrain_wall(nav.rebuild_at);
            nav.rebuild_at++; _work++;
            if (nav.rebuild_at>=nav.count) { nav.rebuild_phase=1; nav.rebuild_at=0; }
        } else if (nav.rebuild_phase==1) {
            if (nav.rebuild_prop>=array_length(props)) { nav.rebuild_phase=2; nav.rebuild_at=0; continue; }
            var _p=props[nav.rebuild_prop];
            if (_p.unit>=0 || _p.spr==spr_remnant) { nav.rebuild_prop++; continue; }
            var _half=_p.span*0.5+0.16;
            var _x0=max(0,ceil((_p.gx-_half+0.5)*3-0.5));
            var _x1=min(nav.side-1,floor((_p.gx+_half+0.5)*3-0.5));
            var _y0=max(0,ceil((_p.gy-_half+0.5)*3-0.5));
            var _y1=min(nav.side-1,floor((_p.gy+_half+0.5)*3-0.5));
            var _width=_x1-_x0+1, _total=_width*(_y1-_y0+1);
            if (_total<=0 || nav.rebuild_at>=_total) { nav.rebuild_prop++; nav.rebuild_at=0; continue; }
            var _i=(_y0+nav.rebuild_at div _width)*nav.side+_x0+(nav.rebuild_at mod _width);
            if (abs(nav_x(_i)-_p.gx)<_half && abs(nav_y(_i)-_p.gy)<_half) nav.solid[_i]=true;
            nav.rebuild_at++; _work++;
        } else if (nav.rebuild_phase==2) {
            nav_links(nav.rebuild_at++); _work++;
            if (nav.rebuild_at>=nav.count) {
                if (!nav.with_labels) { nav.rebuild_phase=4; nav.rebuild_progress=1; return true; }
                nav.rebuild_phase=3; nav.rebuild_at=0;
            }
        } else if (nav.rebuild_phase==3) {
            if (nav.component_head<array_length(nav.component_queue)) {
                var _at=nav.component_queue[nav.component_head++], _links=nav.edges[_at];
                for (var _j=0; _j<array_length(_links); ++_j) {
                    var _n=_links[_j];
                    if (nav.labels[_n]<0) { nav.labels[_n]=nav.component_id; array_push(nav.component_queue,_n); }
                }
            } else {
                if (nav.rebuild_at>=nav.count) {
                    nav.rebuild_phase=4; nav.rebuild_progress=1; nav.labels_valid=true;
                    nav.component_queue=[]; return true;
                }
                var _at=nav.rebuild_at++;
                if (!nav.solid[_at] && nav.labels[_at]<0) {
                    nav.component_id++; nav.labels[_at]=nav.component_id;
                    nav.component_queue=[_at]; nav.component_head=0;
                }
            }
            _work++;
        } else return true;
    }
    nav.rebuild_progress=(nav.rebuild_phase==0 ? nav.rebuild_at/nav.count*0.4 :
        ((nav.rebuild_phase==1 ? 0.4+0.1*nav.rebuild_prop/max(1,array_length(props)) :
            ((nav.rebuild_phase==2 ? 0.5+0.25*nav.rebuild_at/nav.count : 0.75+0.25*nav.rebuild_at/nav.count)))));
    return false;
};
nav_rebuild = function(_center_x=undefined,_center_y=undefined,_span=0) {
    if (is_undefined(_center_x)) {
        nav_rebuild_begin();
        while (!nav_rebuild_step(1000000)) {} // Tests/setup only; loading calls step once per frame.
        return;
    }
    var _radius=_span*0.5+0.5;
    var _x0=max(0,floor((_center_x-_radius+0.5)*3)), _x1=min(nav.side-1,ceil((_center_x+_radius+0.5)*3));
    var _y0=max(0,floor((_center_y-_radius+0.5)*3)), _y1=min(nav.side-1,ceil((_center_y+_radius+0.5)*3));
    for (var _yy=_y0; _yy<=_y1; ++_yy) for (var _xx=_x0; _xx<=_x1; ++_xx) {
        var _i=_yy*nav.side+_xx, _gx=nav_x(_i), _gy=nav_y(_i), _wall=nav_terrain_wall(_i);
        for (var _j=0; _j<array_length(props); ++_j) {
            var _p=props[_j];
            if (_p.unit<0 && _p.spr!=spr_remnant && abs(_gx-_p.gx)<_p.span*0.5+0.16
                && abs(_gy-_p.gy)<_p.span*0.5+0.16) { _wall=true; break; }
        }
        nav.solid[_i]=_wall;
    }
    for (var _yy=max(0,_y0-1); _yy<=min(nav.side-1,_y1+1); ++_yy)
    for (var _xx=max(0,_x0-1); _xx<=min(nav.side-1,_x1+1); ++_xx) nav_links(_yy*nav.side+_xx);
    nav.fields=[]; nav.active=undefined; nav.cursor=0; nav.revision++; nav.labels_valid=false;
};
// The initial graph is built in small chunks after the player starts a match.
nav_nearest = function(_gx,_gy,_known=false) {
    var _idx=nav_index(_gx,_gy);
    if (_idx>=0 && !nav.solid[_idx] && (!_known || fog_seen[fog_index(nav_x(_idx),nav_y(_idx))])) return _idx;
    // Bounded perimeter search: blocked clicks never scan the entire map.
    var _cx=clamp(floor((_gx+0.5)*3),0,nav.side-1), _cy=clamp(floor((_gy+0.5)*3),0,nav.side-1);
    var _best=-1, _dist=1000000000;
    for (var _ring=0; _ring<=24; ++_ring) {
        for (var _yy=max(0,_cy-_ring); _yy<=min(nav.side-1,_cy+_ring); ++_yy)
        for (var _xx=max(0,_cx-_ring); _xx<=min(nav.side-1,_cx+_ring); ++_xx) {
            if (_ring>0 && abs(_xx-_cx)!=_ring && abs(_yy-_cy)!=_ring) continue;
            var _i=_yy*nav.side+_xx;
            if (nav.solid[_i] || (_known && !fog_seen[fog_index(nav_x(_i),nav_y(_i))])) continue;
            var _d=sqr(nav_x(_i)-_gx)+sqr(nav_y(_i)-_gy);
            if (_d<_dist) { _dist=_d; _best=_i; }
        }
        if (_best>=0 && sqr(max(0,(_ring-1)/3))>_dist) break;
    }
    return _best;
};
nav_heuristic = function(_a,_b) {
    var _dx=abs((_a mod nav.side)-(_b mod nav.side)), _dy=abs((_a div nav.side)-(_b div nav.side));
    return 1000*max(_dx,_dy)+414*min(_dx,_dy);
};
nav_field = function(_goal,_start,_known=false) {
    if (_goal<0 || _start<0) return undefined;
    nav.clock++;
    for (var _i=0; _i<array_length(nav.fields); ++_i) {
        var _f=nav.fields[_i];
        if (_f.failed && _f.known && nav.frame-_f.requested>30) continue;
        if (_f.goal==_goal && _f.known==_known && (_f.start==_start || (_f.ready && !_f.failed && variable_struct_exists(_f.route,string(_start))))) {
            _f.used=nav.clock; _f.requested=nav.frame; nav.hits++; return _f;
        }
    }
    var _slot=-1, _old=1000000000;
    if (array_length(nav.fields)>=nav.capacity) {
        for (var _i=0; _i<array_length(nav.fields); ++_i) {
            if (nav.fields[_i].ready && nav.fields[_i].used<_old) { _old=nav.fields[_i].used; _slot=_i; }
        }
        if (_slot<0) return undefined;
    }
    nav.misses++;
    var _h=nav_heuristic(_start,_goal);
    var _f={goal:_goal,start:_start,known:_known,used:nav.clock,requested:nav.frame,revision:nav.revision,
        route:{},queued:nav.clock,ready:false,failed:false,partial:false,started:false,
        expanded:0,best:_start,best_h:_h,trace:-1,trace_next:-1};
    if (nav.labels_valid && nav.labels[_start]!=nav.labels[_goal]) { _f.ready=true; _f.failed=true; }
    if (_slot<0) array_push(nav.fields,_f); else nav.fields[_slot]=_f;
    return _f;
};
nav_expand = function(_f) {
    // Project uses reference arrays (Copy on Write disabled). Local aliases keep
    // the VM hot loop numeric and avoid repeated struct property resolution.
    var _stamp=nav.search_stamp, _closed=nav.search_closed, _g=nav.search_g;
    var _scores=nav.search_score, _parents=nav.search_parent;
    var _positions=nav.search_position, _heap=nav.search_heap, _side=nav.side;
    if (!_f.started) {
        nav.search_epoch++; _f.started=true;
        var _start=_f.start;
        _stamp[_start]=nav.search_epoch;
        _g[_start]=0; _scores[_start]=_f.best_h*nav.heuristic_weight;
        _parents[_start]=-1; _positions[_start]=0;
        _heap[0]=_start; nav.search_size=1;
    }
    // Reconstruction shares the same budget; only final waypoints use strings.
    if (_f.trace>=0) {
        _f.route[$ string(_f.trace)]=_f.trace_next;
        _f.trace_next=_f.trace; _f.trace=_parents[_f.trace];
        if (_f.trace<0) _f.ready=true;
        return;
    }
    var _epoch=nav.search_epoch;
    var _at=_heap[0], _last=_heap[--nav.search_size];
    _closed[_at]=_epoch; _f.expanded++;
    if (nav.search_size>0) {
        var _p=0, _last_score=_scores[_last], _last_g=_g[_last];
        while (_p*2+1<nav.search_size) {
            var _child=_p*2+1, _cell=_heap[_child];
            if (_child+1<nav.search_size) {
                var _right=_heap[_child+1];
                if (_scores[_right]<_scores[_cell]
                    || (_scores[_right]==_scores[_cell] && _g[_right]>_g[_cell])) { _child++; _cell=_right; }
            }
            if (_last_score<_scores[_cell] || (_last_score==_scores[_cell] && _last_g>=_g[_cell])) break;
            _heap[_p]=_cell; _positions[_cell]=_p; _p=_child;
        }
        _heap[_p]=_last; _positions[_last]=_p;
    }
    if (_at==_f.goal) { _f.trace=_at; return; }
    var _links=nav.edges[_at], _at_g=_g[_at];
    var _at_x=_at mod _side, _at_y=_at div _side;
    for (var _k=0; _k<array_length(_links); ++_k) {
        var _n=_links[_k];
        if (_closed[_n]==_epoch) continue;
        if (_f.known) {
            var _fi=fog_index(nav_x(_n),nav_y(_n));
            if (_fi<0 || !fog_seen[_fi]) continue;
        }
        var _cost=_at_g+((_n mod _side!=_at_x && _n div _side!=_at_y) ? 1414 : 1000);
        var _seen=_stamp[_n]==_epoch;
        if (_seen && _cost>=_g[_n]) continue;
        var _dx=abs((_n mod _side)-(_f.goal mod _side)), _dy=abs((_n div _side)-(_f.goal div _side));
        var _h=1000*max(_dx,_dy)+414*min(_dx,_dy), _score=_cost+_h*nav.heuristic_weight;
        if (_h<_f.best_h) { _f.best_h=_h; _f.best=_n; }
        var _p;
        if (!_seen) { _p=nav.search_size++; _stamp[_n]=_epoch; }
        else _p=_positions[_n];
        _g[_n]=_cost; _scores[_n]=_score; _parents[_n]=_at;
        while (_p>0) {
            var _parent=(_p-1) div 2, _above=_heap[_parent];
            if (_scores[_above]<_score || (_scores[_above]==_score && _g[_above]>=_cost)) break;
            _heap[_p]=_above; _positions[_above]=_p; _p=_parent;
        }
        _heap[_p]=_n; _positions[_n]=_p;
    }
    if (nav.search_size==0 || _f.expanded>=nav.search_limit) {
        if (_f.best!=_f.start && _f.expanded>=nav.search_limit) { _f.partial=true; _f.trace=_f.best; }
        else { _f.ready=true; _f.failed=true; }
    }
};
nav_tick = function() {
    nav.expanded=0; nav.frame++;
    var _began=get_timer();
    // FIFO jobs share one workspace, so each completed request frees its slot
    // promptly. No unit can continually pre-empt an older queued command.
    while (nav.expanded<nav.budget && get_timer()-_began<nav.budget_us) {
        if (is_undefined(nav.active) || nav.active.ready || nav.active.revision!=nav.revision) {
            nav.active=undefined;
            var _old=1000000000;
            for (var _i=0; _i<array_length(nav.fields); ++_i) {
                var _f=nav.fields[_i];
                if (_f.ready) continue;
                if (nav.frame-_f.requested>90) { _f.ready=true; _f.failed=true; continue; }
                if (_f.queued<_old) { _old=_f.queued; nav.active=_f; }
            }
            if (is_undefined(nav.active)) break;
        }
        if (nav.frame-nav.active.requested>90) { nav.active.ready=true; nav.active.failed=true; continue; }
        nav_expand(nav.active); nav.expanded++;
    }
    nav.elapsed_us=get_timer()-_began;
};
nav_segment = function(_ax,_ay,_bx,_by,_known=false) {
    var _start=nav_index(_ax,_ay), _finish=nav_index(_bx,_by);
    if (_start<0 || _finish<0) return false;
    // A short segment in the interior of open cells needs no repeated sampling.
    if (!_known && max(abs(_bx-_ax),abs(_by-_ay))<=1/3 && array_length(nav.edges[_start])==8
        && array_length(nav.edges[_finish])==8) return true;
    var _steps=ceil(max(abs(_bx-_ax),abs(_by-_ay))*18)+1;
    var _prev=nav_index(_ax,_ay);
    for (var _i=1; _i<=_steps; ++_i) {
        var _idx=nav_index(lerp(_ax,_bx,_i/_steps),lerp(_ay,_by,_i/_steps));
        var _pxx=lerp(_ax,_bx,_i/_steps), _pyy=lerp(_ay,_by,_i/_steps);
        if (_known) { var _fi=fog_index(_pxx,_pyy); if (_fi<0 || !fog_seen[_fi]) return false; }
        if (_idx<0 || nav.solid[_idx] || !nav_open(_pxx-0.13,_pyy) || !nav_open(_pxx+0.13,_pyy)
            || !nav_open(_pxx,_pyy-0.13) || !nav_open(_pxx,_pyy+0.13)) return false;
        if (_prev>=0 && _idx!=_prev) {
            var _px=_prev mod nav.side, _py=_prev div nav.side;
            var _nx=_idx mod nav.side, _ny=_idx div nav.side;
            if (_px!=_nx && _py!=_ny && (nav.solid[_py*nav.side+_nx] || nav.solid[_ny*nav.side+_px])) return false;
        }
        _prev=_idx;
    }
    return true;
};

units=[]; nodes=[]; city=undefined; next_unit_id=0;
sim_time=0; sim_over=false; sim_won=false; sim_testing=false; sim_message="Select allies; right-click ground, enemy, or node";
dragging=false; drag_x=0; drag_y=0;
bucket_side=map_size*2; buckets=array_create(bucket_side*bucket_side,-1);
touched_buckets=[]; touched_enemy_buckets=[];
enemy_buckets=array_create(bucket_side*bucket_side*2,-1);
unit_limit=400;
unit_spawn = function(_kind,_gx,_gy) {
    var _alive=0, _team_alive=0;
    for (var _i=0; _i<array_length(units); ++_i) if (units[_i].hp>0 && units[_i].team==(_kind==2 ? 1 : 0)) _team_alive++;
    if (!sim_testing && variable_instance_exists(id,"balance") && _team_alive>=(_kind==2 ? balance.enemy_limit : balance.ally_limit)) return undefined;
    for (var _i=0; _i<array_length(units); ++_i) if (units[_i].hp>0) _alive++;
    if (_alive>=unit_limit) return undefined;
    var _idx=nav_nearest(_gx,_gy);
    if (_idx<0) return undefined;
    // Find an unoccupied microcell before inserting. Spawn bursts must not
    // create a stack of overlapping actors that makes local avoidance quadratic.
    var _origin_x=_idx mod nav.side, _origin_y=_idx div nav.side, _free=-1;
    for (var _ring=0; _ring<nav.side && _free<0; ++_ring) {
        for (var _yy=max(0,_origin_y-_ring); _yy<=min(nav.side-1,_origin_y+_ring) && _free<0; ++_yy)
        for (var _xx=max(0,_origin_x-_ring); _xx<=min(nav.side-1,_origin_x+_ring); ++_xx) {
            if (_ring>0 && abs(_xx-_origin_x)!=_ring && abs(_yy-_origin_y)!=_ring) continue;
            var _candidate=_yy*nav.side+_xx;
            if (nav.solid[_candidate]) continue;
            var _occupied=false, _tx=nav_x(_candidate), _ty=nav_y(_candidate);
            for (var _j=0; _j<array_length(units); ++_j) {
                var _v=units[_j];
                if (_v.hp>0 && sqr(_v.gx-_tx)+sqr(_v.gy-_ty)<0.08) { _occupied=true; break; }
            }
            if (!_occupied) { _free=_candidate; break; }
        }
    }
    if (_free<0) return undefined;
    _idx=_free;
    var _hp=[65,130,90];
    var _u={id:next_unit_id++, kind:_kind, team:(_kind==2 ? 1 : 0),
        gx:nav_x(_idx), gy:nav_y(_idx), hp:_hp[_kind], max_hp:_hp[_kind], radius:0.13,
        pace:(_kind==2 ? 0.8 : 2.1), damage:(_kind==1 ? 22 : 13), city_raider:false,
        selected:false, action:0, facing:0, frame:0, target:undefined,
        order:0, objective:undefined, goal:-1, field:undefined, next_cell:-1, direct:false,
        walk_direct:false, travel_x:nav_x(_idx), travel_y:nav_y(_idx), exploring:false, direct_goal:-1, direct_revision:-1,
        think:(_kind==0 ? 0 : (next_unit_id mod 12)/60), cooldown:0, struck:false, next:-1, enemy_next:-1, corpse:0, stuck:0,
        home_x:nav_x(_idx), home_y:nav_y(_idx), rally_x:nav_x(_idx), rally_y:nav_y(_idx), slot_visible:false, unreachable:false};
    array_push(units,_u);
    if (_kind==2) av_burst(ps_appear_evil,_u.gx,_u.gy);
    return _u;
};
for (var _i=0; _i<array_length(props); ++_i) {
    var _p=props[_i];
    if (_p.id==0) { city={gx:_p.gx,gy:_p.gy,hp:1000,max_hp:1000,span:_p.span}; _p.city=city; }
    if (_p.id>=5 && _p.id<=7) {
        var _n={gx:_p.gx,gy:_p.gy,span:_p.span,progress:0,needed:48,active:true,
                spawn_in:9+(_p.id-5)*4,spawned:0};
        _p.node=_n; array_push(nodes,_n);
    }
}
// Remove the three diagnostic mannequins; the gallery still uses the sprite table.
for (var _i=array_length(props)-1; _i>=0; --_i) if (props[_i].unit>=0) array_delete(props,_i,1);
// The loading job spawns the starting army once the final graph is ready.
unit_action = function(_u,_action) {
    if (_u.action==_action) return;
    _u.action=_action; _u.frame=0; _u.struck=false;
};
unit_face = function(_u,_dx,_dy) {
    // Sprite front points down the screen. Imported left/right labels use the
    // character's perspective, so mirror the facing index for screen movement.
    var _sx=(_dx-_dy)*cell_width*0.5, _sy=(_dx+_dy)*cell_height*0.5;
    if (abs(_sx)+abs(_sy)>0.00001) {
        var _screen_facing=(round((point_direction(0,0,_sx,_sy)+90)/45)+8) mod 8;
        _u.facing=(8-_screen_facing) mod 8;
    }
};
unit_hurt = function(_u,_damage) {
    if (_u.hp<=0 || _damage<=0) return;
    av_burst(_u.team==1 ? ps_blood_evil : ps_blood_human,_u.gx,_u.gy,42);
    _u.hp=max(0,_u.hp-_damage);
    if (_u.hp<=0 && _u.team==1) av_sound(snd_scourge_death,0.75,_u.gx,_u.gy);
    if (_u.hp<=0) { unit_action(_u,4); _u.selected=false; _u.target=undefined; _u.field=undefined; }
    // Attacks are committed once started: damage cannot repeatedly stun-lock them.
    else if (_u.action!=2 && _u.action!=3) unit_action(_u,3);
};
unit_buckets = function() {
    // Clear occupied buckets only: map area grew 25-fold, unit count did not.
    for (var _b=0; _b<array_length(touched_buckets); ++_b) buckets[touched_buckets[_b]]=-1;
    for (var _b=0; _b<array_length(touched_enemy_buckets); ++_b) enemy_buckets[touched_enemy_buckets[_b]]=-1;
    touched_buckets=[]; touched_enemy_buckets=[];
    for (var _i=0; _i<array_length(units); ++_i) {
        var _u=units[_i];
        if (_u.hp<=0) continue;
        var _bx=clamp(floor((_u.gx+0.5)*2),0,bucket_side-1);
        var _by=clamp(floor((_u.gy+0.5)*2),0,bucket_side-1);
        var _b=_by*bucket_side+_bx;
        if (buckets[_b]<0) array_push(touched_buckets,_b);
        _u.next=buckets[_b]; buckets[_b]=_i;
        var _eb=_b+_u.team*bucket_side*bucket_side;
        if (enemy_buckets[_eb]<0) array_push(touched_enemy_buckets,_eb);
        _u.enemy_next=enemy_buckets[_eb]; enemy_buckets[_eb]=_i;
    }
};
unit_enemy = function(_u,_range) {
    var _best=undefined, _dist=sqr(_range);
    var _x0=max(0,floor((_u.gx+0.5-_range)*2)), _x1=min(bucket_side-1,floor((_u.gx+0.5+_range)*2));
    var _y0=max(0,floor((_u.gy+0.5-_range)*2)), _y1=min(bucket_side-1,floor((_u.gy+0.5+_range)*2));
    for (var _by=_y0; _by<=_y1; ++_by) for (var _bx=_x0; _bx<=_x1; ++_bx) {
        var _id=enemy_buckets[(1-_u.team)*bucket_side*bucket_side+_by*bucket_side+_bx];
        while (_id>=0) {
            var _v=units[_id]; _id=_v.enemy_next;
            if (_v.hp<=0 || _v.team==_u.team || (_u.team==0 && !sim_testing && !fog_can_see(_v.gx,_v.gy))) continue;
            var _d=sqr(_v.gx-_u.gx)+sqr(_v.gy-_u.gy);
            if (_d<_dist && nav_segment(_u.gx,_u.gy,_v.gx,_v.gy)) { _best=_v; _dist=_d; }
        }
    }
    return _best;
};
// A nearby building can cover a unit's microcell while its actual body is clear.
// Correct this subcell rounding only along an independently collision-tested segment.
nav_body_open = function(_gx,_gy,_radius) {
    if (_gx-_radius< -0.5 || _gy-_radius< -0.5 || _gx+_radius>map_size-0.5 || _gy+_radius>map_size-0.5) return false;
    for (var _yy=max(0,ceil(_gy-0.5-_radius)); _yy<=min(map_size-1,floor(_gy+0.5+_radius)); ++_yy)
    for (var _xx=max(0,ceil(_gx-0.5-_radius)); _xx<=min(map_size-1,floor(_gx+0.5+_radius)); ++_xx)
        if (terrain[_yy*map_size+_xx]==1
            && sqr(max(0,abs(_gx-_xx)-0.5))+sqr(max(0,abs(_gy-_yy)-0.5))<sqr(_radius)) return false;
    for (var _j=0; _j<array_length(props); ++_j) {
        var _p=props[_j];
        if (_p.unit<0 && _p.spr!=spr_remnant
            && sqr(max(0,abs(_gx-_p.gx)-_p.span*0.5))+sqr(max(0,abs(_gy-_p.gy)-_p.span*0.5))<sqr(_radius)) return false;
    }
    return true;
};
nav_recover = function(_u) {
    var _at=nav_index(_u.gx,_u.gy);
    if (_at<0 || !nav.solid[_at]) return;
    var _cx=_at mod nav.side, _cy=_at div nav.side, _best=-1, _dist=1000000000;
    for (var _yy=max(0,_cy-2); _yy<=min(nav.side-1,_cy+2); ++_yy)
    for (var _xx=max(0,_cx-2); _xx<=min(nav.side-1,_cx+2); ++_xx) {
        var _idx=_yy*nav.side+_xx;
        if (nav.solid[_idx]) continue;
        var _x=nav_x(_idx), _y=nav_y(_idx), _d=sqr(_x-_u.gx)+sqr(_y-_u.gy);
        if (_d>=_dist || _d>0.25) continue;
        var _clear=true;
        for (var _step=0; _step<=10; ++_step) if (!nav_body_open(lerp(_u.gx,_x,_step/10),lerp(_u.gy,_y,_step/10),_u.radius)) { _clear=false; break; }
        if (_clear) { _best=_idx; _dist=_d; }
    }
    if (_best>=0) { _u.gx=nav_x(_best); _u.gy=nav_y(_best); _u.field=undefined; _u.next_cell=-1; }
};
unit_route = function(_u,_gx,_gy) {
    _u.direct=false; _u.walk_direct=false;
    var _known=_u.team==0 && !sim_testing;
    _u.exploring=false;
    if (_known) {
        var _fi=fog_index(_gx,_gy);
        _u.exploring=_fi>=0 && !fog_seen[_fi];
    }
    if (_u.exploring) {
        // Unknown destinations are directions, not omniscient routes through lakes.
        // Pick a short, explored frontier in that direction; revelation advances it.
        var _dx=_gx-_u.gx, _dy=_gy-_u.gy, _len=max(0.001,point_distance(0,0,_dx,_dy));
        var _best=-1000000000, _tx=_u.gx, _ty=_u.gy;
        for (var _ring=1; _ring<=8; ++_ring) for (var _turn=-2; _turn<=2; ++_turn) {
            var _angle=point_direction(0,0,_dx,_dy)+_turn*22.5;
            var _x=_u.gx+lengthdir_x(_ring/3,_angle), _y=_u.gy+lengthdir_y(_ring/3,_angle);
            var _fi=fog_index(_x,_y), _idx=nav_index(_x,_y);
            if (_fi<0 || !fog_seen[_fi] || _idx<0 || nav.solid[_idx]) continue;
            var _score=(_x-_u.gx)*_dx/_len+(_y-_u.gy)*_dy/_len-abs(_turn)*0.10;
            if (_score>_best) { _best=_score; _tx=nav_x(_idx); _ty=nav_y(_idx); }
        }
        _gx=_tx; _gy=_ty;
    }
    var _goal=nav_nearest(_gx,_gy,_known), _start=nav_index(_u.gx,_u.gy);
    if (_goal<0 || _start<0) { _u.unreachable=true; _u.field=undefined; return; }
    // Bypass path search for short clear approaches. Collision is still checked per step.
    if (point_distance(_u.gx,_u.gy,_gx,_gy)<=4
        && ((_u.direct_goal==_goal && _u.direct_revision==nav.revision) || nav_segment(_u.gx,_u.gy,_gx,_gy,_known))) {
        _u.goal=_goal; _u.walk_direct=true; _u.direct_goal=_goal; _u.direct_revision=nav.revision; _u.travel_x=_gx; _u.travel_y=_gy;
        _u.field=undefined; _u.next_cell=-1; _u.unreachable=false; return;
    }
    if (_goal!=_u.goal || is_undefined(_u.field) || _u.field.revision!=nav.revision
        || (_u.field.failed && _known && nav.frame-_u.field.requested>30)
        || (_u.field.ready && !_u.field.failed && !variable_struct_exists(_u.field.route,string(_start)))) {
        _u.goal=_goal; _u.field=nav_field(_goal,_start,_known); _u.next_cell=-1; _u.unreachable=false;
    }
    if (!is_undefined(_u.field) && !_u.field.ready) _u.field.requested=nav.frame;
};
object_edge = function(_u,_obj) {
    // Find the closest reachable approach point on the footprint perimeter.
    var _half=_obj.span*0.5+0.4;
    return [clamp(_u.gx,_obj.gx-_half,_obj.gx+_half),
            clamp(_u.gy,_obj.gy-_half,_obj.gy+_half)];
};
object_distance = function(_u,_obj) {
    return point_distance(0,0,max(0,abs(_u.gx-_obj.gx)-_obj.span*0.5),
                              max(0,abs(_u.gy-_obj.gy)-_obj.span*0.5));
};
unit_command = function(_u,_order,_obj,_gx,_gy) {
    _u.order=_order; _u.objective=_obj; _u.target=undefined;
    _u.goal=-1; _u.direct_goal=-1; _u.field=undefined; _u.next_cell=-1; _u.think=(_u.id mod 12)/60; _u.stuck=0; _u.slot_visible=false;
    _u.direct=false; _u.walk_direct=false;
    _u.home_x=_gx; _u.home_y=_gy;
    _u.rally_x=_gx; _u.rally_y=_gy;
};
unit_think = function(_u) {
    nav_recover(_u);
    _u.direct=false; _u.walk_direct=false;
    _u.slot_visible=_u.order==1 && point_distance(_u.gx,_u.gy,_u.rally_x,_u.rally_y)<2
        && nav_segment(_u.gx,_u.gy,_u.home_x,_u.home_y);
    if (_u.kind==0) {
        _u.target=undefined;
        if (_u.order==1) unit_route(_u,_u.rally_x,_u.rally_y);
        if (_u.order==2 && (!is_undefined(_u.objective)) && _u.objective.active) {
            if (object_distance(_u,_u.objective)<=0.85) { _u.field=undefined; return; }
            var _edge=object_edge(_u,_u.objective);
            unit_route(_u,_edge[0],_edge[1]);
        } else if (_u.order==2) { _u.order=0; _u.field=undefined; }
        return;
    }
    if (!is_undefined(_u.target) && (_u.target.hp<=0 || (_u.team==0 && !sim_testing && !fog_can_see(_u.target.gx,_u.target.gy)))) _u.target=undefined;
    if (_u.team==0 && _u.order==3 && !sim_testing && !is_undefined(_u.objective) && !fog_can_see(_u.objective.gx,_u.objective.gy)) {
        _u.order=0; _u.objective=undefined;
    }
    if (_u.order==4) {
        if (!is_undefined(_u.objective) && _u.objective.hp>0) {
            _u.home_x=_u.objective.gx; _u.home_y=_u.objective.gy;
            _u.rally_x=_u.home_x; _u.rally_y=_u.home_y;
        } else { _u.order=0; _u.objective=undefined; }
    }
    // Explicit enemy order is kept until death; automatic defence has a leash.
    if (_u.order==3 && !is_undefined(_u.objective) && _u.objective.hp>0) _u.target=_u.objective;
    else {
        if (_u.order==3) { _u.order=0; _u.objective=undefined; }
        if (!is_undefined(_u.target) && point_distance(_u.gx,_u.gy,_u.target.gx,_u.target.gy)>4) _u.target=undefined;
        var _near=unit_enemy(_u,(_u.team==1 ? 3.2 : 2.6));
        if (!is_undefined(_near)) _u.target=_near;
    }
    if (!is_undefined(_u.target)) {
        // Nearby visible opponents need steering, not a new 72,900-cell field
        // each time their target enters another microcell.
        if (point_distance(_u.gx,_u.gy,_u.target.gx,_u.target.gy)<=4
            && nav_segment(_u.gx,_u.gy,_u.target.gx,_u.target.gy)) {
            _u.direct=true; _u.field=undefined; _u.next_cell=-1; _u.unreachable=false;
        } else unit_route(_u,_u.target.gx,_u.target.gy);
    } else if (_u.team==1 && _u.city_raider) {
        var _edge=object_edge(_u,city); unit_route(_u,_edge[0],_edge[1]);
    } else if (_u.team==1) {
        _u.field=undefined; _u.next_cell=-1;
    } else if (_u.order==1 || point_distance(_u.gx,_u.gy,_u.home_x,_u.home_y)>(_u.order==4 ? 0.9 : 0.45)) {
        unit_route(_u,_u.rally_x,_u.rally_y);
    } else _u.field=undefined;
};
unit_move = function(_u,_dt) {
    var _direct=_u.direct && !is_undefined(_u.target) && _u.target.hp>0;
    if (!_direct && !_u.walk_direct && is_undefined(_u.field)) return false;
    var _at=nav_index(_u.gx,_u.gy), _next=_u.next_cell, _dx=0, _dy=0;
    if (_direct) {
        _dx=_u.target.gx-_u.gx; _dy=_u.target.gy-_u.gy;
    } else if (_u.walk_direct) {
        _dx=_u.travel_x-_u.gx; _dy=_u.travel_y-_u.gy;
    } else {
        var _f=_u.field;
        if (_f.revision!=nav.revision) { _u.field=undefined; _u.next_cell=-1; _u.think=0; return false; }
        if (!_f.ready) return false;
        if (_f.failed || _at<0) { _u.unreachable=true; return false; }
        if (!variable_struct_exists(_f.route,string(_at))) { _u.field=undefined; _u.think=0; return false; }
        if (_next<0 || point_distance(_u.gx,_u.gy,nav_x(_next),nav_y(_next))<0.045) {
            _next=_f.route[$ string(_at)];
            if (_next<0) {
                // A capped long search returns a safe prefix, then resumes from here.
                if (_f.partial) { _u.field=undefined; _u.think=0; return false; }
                _next=_at;
            }
            _u.next_cell=_next;
        }
        _dx=nav_x(_next)-_u.gx; _dy=nav_y(_next)-_u.gy;
    }
    // One shared destination field guides a formation. Only the final approach
    // steers to individual slots, with the same raster collision checks.
    var _slot_approach=false;
    if (_u.order==1 && is_undefined(_u.target) && _u.slot_visible && !_u.exploring) {
        _dx=_u.home_x-_u.gx; _dy=_u.home_y-_u.gy; _slot_approach=true;
    }
    var _len=point_distance(0,0,_dx,_dy);
    if (_len<0.045 && (_at==_u.goal || _slot_approach || _u.walk_direct)) {
        if (_u.order==1 && is_undefined(_u.target) && !_u.exploring) { _u.order=0; _u.field=undefined; _u.walk_direct=false; }
        return false;
    }
    var _step=min(_len,_u.pace*_dt);
    var _vx=(_len>0 ? _dx/_len*_step : 0), _vy=(_len>0 ? _dy/_len*_step : 0);
    // Local separation uses nine spatial buckets, never scans the whole army.
    var _sx=0, _sy=0;
    var _bx=floor((_u.gx+0.5)*2), _by=floor((_u.gy+0.5)*2);
    for (var _yy=max(0,_by-1); _yy<=min(bucket_side-1,_by+1); ++_yy)
    for (var _xx=max(0,_bx-1); _xx<=min(bucket_side-1,_bx+1); ++_xx) {
        var _id=buckets[_yy*bucket_side+_xx];
        while (_id>=0) {
            var _v=units[_id]; _id=_v.next;
            if (_v.id==_u.id || _v.hp<=0) continue;
            var _rx=_u.gx-_v.gx, _ry=_u.gy-_v.gy;
            var _dsq=_rx*_rx+_ry*_ry, _r=_u.radius+_v.radius;
            if (_dsq>=_r*_r) continue;
            var _d=sqrt(_dsq);
            if (_d<0.001) { _rx=(_u.id>_v.id ? 1 : -1)*0.01; _ry=0.005; _d=point_distance(0,0,_rx,_ry); }
            _sx+=_rx/_d*(_r-_d)*3*_dt; _sy+=_ry/_d*(_r-_d)*3*_dt;
        }
    }
    _sx=clamp(_sx,-_step,_step); _sy=clamp(_sy,-_step,_step);
    var _nx=_u.gx+_vx+_sx, _ny=_u.gy+_vy+_sy;
    if (!nav_segment(_u.gx,_u.gy,_nx,_ny)) {
        _nx=_u.gx+_vx; _ny=_u.gy+_vy;
        if (!nav_segment(_u.gx,_u.gy,_nx,_ny)) { _u.next_cell=-1; _u.direct_goal=-1; _u.think=0; return false; }
    }
    unit_face(_u,_nx-_u.gx,_ny-_u.gy);
    _u.gx=_nx; _u.gy=_ny;
    // Re-evaluate when pushed into another cell, avoiding waypoint oscillation.
    if (nav_index(_nx,_ny)!=_at && nav_index(_nx,_ny)!=_next) _u.next_cell=-1;
    return abs(_vx)+abs(_vy)>0.00001;
};
sim_tick = function(_dt) {
    if (sim_over) return;
    sim_time+=_dt;
    if (!sim_testing) {
        corruption_tick(_dt);
        if (sim_time>balance.growth_grace) {
            growth_clock+=_dt;
            if (growth_clock>=balance.growth_interval) { growth_clock-=balance.growth_interval; corruption_grow(); }
        }
        if (corruption_city_reached()) { sim_finish("INFESTATION REACHED THE CITY"); fog_update(); return; }
    }
    unit_buckets();
    nav_tick();
    enemy_assign_raiders();
    for (var _i=0; _i<array_length(nodes); ++_i) {
        var _n=nodes[_i];
        if (!_n.active || (!sim_testing && !scourge_awake)) continue;
        _n.spawn_in-=_dt;
        if (_n.spawn_in<=0) {
            _n.spawn_in=balance.spawn_interval;
            if (!sim_testing && random(1)>=enemy_spawn_chance()) continue;
            var _u=unit_spawn(2,_n.gx-1.7,_n.gy-1.7);
            if (!is_undefined(_u)) _n.spawned++;
        }
    }
    for (var _i=0; _i<array_length(units); ++_i) {
        var _u=units[_i];
        var _spr=unit_sprites[_u.kind][_u.action][_u.facing];
        var _frames=sprite_get_number(_spr);
        _u.frame+=10*_dt;
        if (_u.hp<=0) { _u.frame=min(_u.frame,_frames-1); _u.corpse+=_dt; continue; }
        _u.cooldown=max(0,_u.cooldown-_dt);
        if (_u.action==3) {
            if (_u.frame<_frames) continue;
            unit_action(_u,0);
        }
        if (_u.action==2 && _u.kind!=0) {
            if (!_u.struck && _u.frame>=_frames*0.45) {
                _u.struck=true;
                if (_u.kind==1) av_sound(choose(snd_militia_attack_1,snd_militia_attack_2,snd_militia_attack_3),0.65,_u.gx,_u.gy);
                if (!is_undefined(_u.target) && _u.target.hp>0) {
                    if (point_distance(_u.gx,_u.gy,_u.target.gx,_u.target.gy)<=0.9
                        && nav_segment(_u.gx,_u.gy,_u.target.gx,_u.target.gy)) unit_hurt(_u.target,_u.damage);
                } else if (_u.team==1 && _u.city_raider && object_distance(_u,city)<=0.95) city.hp=max(0,city.hp-_u.damage);
            }
            if (_u.frame<_frames) continue;
            _u.cooldown=0.35; unit_action(_u,0);
        }
        _u.think-=_dt;
        if (_u.think<=0) { _u.think=0.2+(_u.id mod 5)*0.013; unit_think(_u); }
        if (_u.kind==0 && _u.order==2 && !is_undefined(_u.objective) && _u.objective.active
            && object_distance(_u,_u.objective)<=0.85) {
            var _n=_u.objective;
            unit_face(_u,_n.gx-_u.gx,_n.gy-_u.gy); unit_action(_u,2);
            _n.progress=min(_n.needed,_n.progress+_dt);
            if (_n.progress>=_n.needed) { node_cleanse(_n); _u.order=0; _u.field=undefined; sim_message="Node cleansed: spawning stopped"; }
            continue;
        }
        var _in_range=false;
        if (_u.kind!=0 && !is_undefined(_u.target) && _u.target.hp>0) {
            _in_range=point_distance(_u.gx,_u.gy,_u.target.gx,_u.target.gy)<=0.7
                && nav_segment(_u.gx,_u.gy,_u.target.gx,_u.target.gy);
            if (_in_range) unit_face(_u,_u.target.gx-_u.gx,_u.target.gy-_u.gy);
        } else if (_u.team==1 && _u.city_raider && object_distance(_u,city)<=0.85) {
            _in_range=true; unit_face(_u,city.gx-_u.gx,city.gy-_u.gy);
        }
        if (_in_range) {
            if (_u.cooldown<=0) unit_action(_u,2); else unit_action(_u,0);
        } else unit_action(_u,unit_move(_u,_dt) ? 1 : 0);
    }
    if (!sim_testing) { fog_update(); sentrion_tick(); }
    if (city.hp<=0) sim_finish("CITY DESTROYED");
    if (!sim_testing && !sim_over) { remnant_tick(); ritual_tick(_dt); }
    // Compact dead units after their animation; IDs remain stable for selection/hash ties.
    // Struct references are used for targets, so array indices can change safely.
    for (var _i=array_length(units)-1; _i>=0; --_i) if (units[_i].corpse>12) array_delete(units,_i,1);
};

// Stable body bounds: animation canvases include large transparent margins.
// Minimum GUI dimensions keep small, zoomed-out units easy to acquire.
unit_select_bounds = function(_u) {
    var _w=iso_to_world(_u.gx,_u.gy), _s=world_to_gui(_w[0],_w[1]);
    var _half=max(20,30*map_zoom), _height=max(40,95*map_zoom);
    return [_s[0]-_half,_s[1]-_height,_s[0]+_half,_s[1]+max(8,12*map_zoom)];
};
unit_pick = function(_mx,_my) {
    var _pick=undefined, _best=1000000000;
    for (var _i=0; _i<array_length(units); ++_i) {
        var _u=units[_i];
        if (_u.hp<=0 || (_u.team==1 && !fog_can_see(_u.gx,_u.gy))) continue;
        var _r=unit_select_bounds(_u);
        if (!point_in_rectangle(_mx,_my,_r[0]-10,_r[1]-10,_r[2]+10,_r[3]+10)) continue;
        // Prefer a body hit over its forgiving margin, then the nearest body centre.
        var _outside=!point_in_rectangle(_mx,_my,_r[0],_r[1],_r[2],_r[3]);
        var _score=_outside*1000000+sqr((_mx-(_r[0]+_r[2])*0.5)/(_r[2]-_r[0]))
            +sqr((_my-(_r[1]+_r[3])*0.5)/(_r[3]-_r[1]));
        if (_score<_best) { _best=_score; _pick=_u; }
    }
    return _pick;
};
unit_select_box = function(_left,_top,_right,_bottom) {
    for (var _i=0; _i<array_length(units); ++_i) {
        var _u=units[_i]; if (_u.team!=0 || _u.hp<=0) continue;
        var _r=unit_select_bounds(_u);
        if (_r[0]<=_right && _r[2]>=_left && _r[1]<=_bottom && _r[3]>=_top) _u.selected=true;
    }
};
sim_input = function() {
    var _w=gui_to_world(mouse_gui_x,mouse_gui_y);
    var _gx=(_w[0]/(cell_width*0.5)+_w[1]/(cell_height*0.5))*0.5;
    var _gy=(_w[1]/(cell_height*0.5)-_w[0]/(cell_width*0.5))*0.5;
    if (mouse_check_button_pressed(mb_left) && mouse_gui_y>gui_top && mouse_gui_y<gui_bottom) {
        dragging=true; drag_x=mouse_gui_x; drag_y=mouse_gui_y;
    }
    if (dragging && mouse_check_button_released(mb_left)) {
        dragging=false;
        var _box=point_distance(drag_x,drag_y,mouse_gui_x,mouse_gui_y)>12;
        var _pick=undefined;
        if (!keyboard_check(vk_shift)) for (var _i=0; _i<array_length(units); ++_i) units[_i].selected=false;
        if (_box) unit_select_box(min(drag_x,mouse_gui_x),min(drag_y,mouse_gui_y),max(drag_x,mouse_gui_x),max(drag_y,mouse_gui_y));
        else _pick=unit_pick(mouse_gui_x,mouse_gui_y);
        gui_menu=-1; gui_prop=-1; gui_inspected=undefined;
        if (!is_undefined(_pick)) {
            _pick.selected=(_pick.team==0); gui_inspected=_pick;
        } else if (!_box) gui_pick_prop();
        if (_box || !is_undefined(_pick) || gui_prop>=0) av_sound(snd_ui_click,0.55);
    }
    if (keyboard_check_pressed(ord("E"))) { gui_prop=-1; gui_menu=-1; gui_inspected=undefined; av_sound(snd_ui_click,0.55); }
    if (keyboard_check_pressed(ord("E"))) for (var _i=0; _i<array_length(units); ++_i) if (units[_i].team==0 && units[_i].hp>0) units[_i].selected=true;
    if (keyboard_check_pressed(ord("H"))) for (var _i=0; _i<array_length(units); ++_i) if (units[_i].selected) unit_command(units[_i],0,undefined,units[_i].gx,units[_i].gy);
    if (mouse_gui_y<=gui_top || mouse_gui_y>=gui_bottom) return;
    if (!mouse_check_button_pressed(mb_right) || sim_over) return;
    var _enemy=undefined, _node=undefined, _escort=undefined, _best=0.8;
    for (var _i=0; _i<array_length(units); ++_i) {
        var _v=units[_i]; if (_v.team!=1 || _v.hp<=0 || !fog_can_see(_v.gx,_v.gy)) continue;
        var _d=point_distance(_gx,_gy,_v.gx,_v.gy);
        if (_d<_best) { _enemy=_v; _best=_d; }
    }
    for (var _i=0; _i<array_length(nodes); ++_i) {
        var _n=nodes[_i];
        if (_n.active && fog_can_see(_n.gx,_n.gy) && abs(_gx-_n.gx)<=1.2 && abs(_gy-_n.gy)<=1.2) _node=_n;
    }
    if (is_undefined(_enemy) && is_undefined(_node)) {
        for (var _i=0; _i<array_length(units); ++_i) {
            var _v=units[_i];
            if (_v.kind==0 && _v.hp>0 && point_distance(_gx,_gy,_v.gx,_v.gy)<0.5) { _escort=_v; break; }
        }
    }
    var _selected=[];
    for (var _i=0; _i<array_length(units); ++_i) if (units[_i].selected && units[_i].hp>0) array_push(_selected,units[_i]);
    var _side=ceil(sqrt(array_length(_selected)));
    for (var _i=0; _i<array_length(_selected); ++_i) {
        var _u=_selected[_i];
        if (_u.kind==0 && !is_undefined(_node)) unit_command(_u,2,_node,_gx,_gy);
        else if (_u.kind!=0 && !is_undefined(_enemy)) unit_command(_u,3,_enemy,_gx,_gy);
        else if (_u.kind==1 && !is_undefined(_escort)) unit_command(_u,4,_escort,_escort.gx,_escort.gy);
        else {
            var _tx=_gx+((_i mod _side)-(_side-1)*0.5)*0.34;
            var _ty=_gy+((_i div _side)-(_side-1)*0.5)*0.34;
            if (!is_undefined(_node)) { var _edge=object_edge(_u,_node); _tx=_edge[0]; _ty=_edge[1]; }
            var _fi=fog_index(_tx,_ty);
            if (_fi<0) continue;
            if (fog_seen[_fi]) {
                var _slot=nav_nearest(_tx,_ty,true);
                if (_slot>=0) { _tx=nav_x(_slot); _ty=nav_y(_slot); }
            }
            unit_command(_u,1,undefined,_tx,_ty);
            _u.rally_x=_gx; _u.rally_y=_gy;
            if (!is_undefined(_node)) { _u.rally_x=_tx; _u.rally_y=_ty; }
            unit_route(_u,_u.rally_x,_u.rally_y);
        }
    }
    sim_message="Order issued to "+string(array_length(_selected))+" units";
};

// A movement slot is one third of a terrain cell. Never expose hidden walls
// through the cursor colour; unrevealed destinations are exploration orders.
unit_grid_draw = function() {
    var _selected=false;
    for (var _i=0; _i<array_length(units); ++_i) {
        var _u=units[_i];
        if (_u.selected && _u.team==0 && _u.hp>0) { _selected=true; break; }
    }
    if (!_selected || gui_place>=0) return false;
    if (mouse_gui_y<=gui_top || mouse_gui_y>=gui_bottom) return true;
    var _w=gui_to_world(mouse_gui_x,mouse_gui_y);
    var _gx=(_w[0]/(cell_width*0.5)+_w[1]/(cell_height*0.5))*0.5;
    var _gy=(_w[1]/(cell_height*0.5)-_w[0]/(cell_width*0.5))*0.5;
    var _idx=nav_index(_gx,_gy);
    if (_idx<0) return true;
    var _tx=nav_x(_idx), _ty=nav_y(_idx), _colour=c_aqua;
    if (fog_can_see(_tx,_ty)) _colour=nav_open(_tx,_ty) ? c_lime : c_red;
    _w=iso_to_world(_tx,_ty);
    var _s=world_to_gui(_w[0],_w[1]);
    diamond(_s[0],_s[1],cell_width*map_zoom/3,cell_height*map_zoom/3,_colour);
    return true;
};
sim_draw = function() {
    var _items=[];
    // Cull before depth sorting: distant armies must not cost a full sprite
    // submission and temporary sort entry while the camera is elsewhere.
    for (var _i=0; _i<array_length(props); ++_i) {
        var _p=props[_i];
        if (!fog_prop_known(_p) || !gui_visible(_p)) continue;
        array_push(_items,{gx:_p.gx,gy:_p.gy,prop:_p,actor:undefined});
    }
    for (var _i=0; _i<array_length(units); ++_i) {
        var _u=units[_i];
        if (_u.team==1 && !fog_can_see(_u.gx,_u.gy)) continue;
        var _spr=unit_sprites[_u.kind][_u.action][_u.facing];
        var _w=iso_to_world(_u.gx,_u.gy), _s=world_to_gui(_w[0],_w[1]);
        var _left=_s[0]-sprite_get_xoffset(_spr)*map_zoom;
        var _top=_s[1]-sprite_get_yoffset(_spr)*map_zoom;
        if (_left>lab_width || _left+sprite_get_width(_spr)*map_zoom<0
            || _top>gui_bottom || _top+sprite_get_height(_spr)*map_zoom<gui_top) continue;
        array_push(_items,{gx:_u.gx,gy:_u.gy,prop:undefined,actor:_u});
    }
    array_sort(_items,function(_a,_b) { return sign((_a.gx+_a.gy)-(_b.gx+_b.gy)); });
    for (var _i=0; _i<array_length(_items); ++_i) {
        var _item=_items[_i], _w=iso_to_world(_item.gx,_item.gy), _s=world_to_gui(_w[0],_w[1]);
        if (is_undefined(_item.actor)) {
            var _p=_item.prop, _tint=c_white;
            if (!fog_prop_known(_p)) continue;
            if (_p.spr==spr_remnant && _p.relic.collected) continue;
            var _visible=fog_can_see(_p.gx,_p.gy);
            if (!_visible) _tint=make_colour_rgb(80,85,100);
            if (variable_struct_exists(_p,"node") && (_visible ? !_p.node.active : !_p.fog_active)) _tint=_visible ? make_colour_rgb(95,145,135) : make_colour_rgb(35,55,60);
            draw_sprite_ext(_p.spr,floor((_visible ? sim_time : 0)*_p.fps) mod sprite_get_number(_p.spr),_s[0],_s[1],map_zoom*_p.scale,map_zoom*_p.scale,0,_tint,1);
            if (_p.spr==spr_remnant && _visible) {
                draw_set_colour(c_aqua); draw_circle(_s[0],_s[1],(18+3*sin(sim_time*4))*map_zoom,true);
                draw_text(_s[0]-32,_s[1]+16,"REMNANT");
            }
            if (variable_struct_exists(_p,"city") && ritual.active) {
                draw_set_alpha(0.5+0.25*sin(sim_time*3));
                diamond(_s[0],_s[1],cell_width*(_p.span+0.3)*map_zoom,cell_height*(_p.span+0.3)*map_zoom,c_aqua);
                draw_set_alpha(1);
            }
            if (show_anchors) diamond(_s[0],_s[1],cell_width*_p.span*map_zoom,cell_height*_p.span*map_zoom,c_yellow);
            if (variable_struct_exists(_p,"alarm") && _p.alarm) {
                draw_set_colour(c_orange); draw_circle(_s[0],_s[1]-100*map_zoom,8+3*sin(sim_time*6),true);
                draw_text(_s[0]-4,_s[1]-108*map_zoom,"!");
            }
            if (variable_struct_exists(_p,"node") && _visible) {
                var _n=_p.node;
                draw_set_colour(c_black); draw_rectangle(_s[0]-35,_s[1]+8,_s[0]+35,_s[1]+15,false);
                draw_set_colour(c_aqua); draw_rectangle(_s[0]-35,_s[1]+8,_s[0]-35+70*_n.progress/_n.needed,_s[1]+15,false);
                draw_set_colour(c_white); draw_text(_s[0]-35,_s[1]+18,_n.active ? string(floor(100*_n.progress/_n.needed))+"%" : "CLEANSED");
            }
        } else {
            var _u=_item.actor;
            if (_u.team==1 && !fog_can_see(_u.gx,_u.gy)) continue;
            var _spr=unit_sprites[_u.kind][_u.action][_u.facing], _count=sprite_get_number(_spr);
            var _loop=_u.action<2 || (_u.kind==0 && _u.action==2);
            var _frame=_loop ? floor(_u.frame) mod _count : min(floor(_u.frame),_count-1);
            if (_u.selected) {
                var _slot=nav_index(_u.gx,_u.gy);
                var _foot=iso_to_world(nav_x(_slot),nav_y(_slot));
                var _screen=world_to_gui(_foot[0],_foot[1]);
                diamond(_screen[0],_screen[1],cell_width*map_zoom/3,cell_height*map_zoom/3,c_aqua);
            }
            draw_sprite_ext(_spr,_frame,_s[0],_s[1],map_zoom,map_zoom,0,c_white,1);
            if (_u.hp>0) {
                var _top=_s[1]-85*map_zoom;
                draw_set_colour(c_black); draw_rectangle(_s[0]-18,_top,_s[0]+18,_top+4,false);
                draw_set_colour(_u.team==0 ? c_lime : c_red); draw_rectangle(_s[0]-18,_top,_s[0]-18+36*_u.hp/_u.max_hp,_top+4,false);
                if (_u.selected && _u.unreachable) { draw_set_colour(c_yellow); draw_text(_s[0],_top-16,"NO PATH"); }
            }
            if (show_anchors) diamond(_s[0],_s[1],cell_width*_u.radius*2*map_zoom,cell_height*_u.radius*2*map_zoom,c_yellow);
        }
    }
    if (dragging) {
        draw_set_colour(c_aqua); draw_rectangle(drag_x,drag_y,mouse_gui_x,mouse_gui_y,true);
    }
    draw_set_colour(c_white);
};

// Opt-in integration suite runs inside the actual VM, using the production code.
// It never writes project files. The initial playable scene is restored afterwards.
unit_test_mode=environment_get_variable("UNGODLY_UNIT_TEST")!="";
if (unit_test_mode) exception_unhandled_handler(function(_error) {
    show_debug_message("UNIT_RUNTIME_ERROR: "+string(_error));
    return 1;
});
unit_test_tick=0;
unit_test_failed=false;
unit_test_assert = function(_ok,_label) {
    if (!_ok) unit_test_failed=true;
    show_debug_message((_ok ? "UNIT_TEST_PASS: " : "UNIT_TEST_FAILED: ")+_label);
};
unit_tests = function() {
    sim_testing=true;
    var _saved_units=units, _saved_nodes=nodes, _saved_city=city;
    var _saved_id=next_unit_id;
    units=[]; nodes=[]; city={gx:4,gy:4,span:5,hp:1000,max_hp:1000};
    var _start=nav_nearest(7.5,7), _goal=nav_nearest(10,10), _f=nav_field(_goal,_start);
    unit_test_assert(nav_field(_goal,_start)==_f,"same start and goal shares one sparse search");
    var _frames=0, _bounded=true, _peak=0;
    while (!_f.ready && _frames<240) {
        _f.requested=nav.frame; nav_tick(); _frames++;
        _bounded=_bounded && nav.expanded<=nav.budget;
        _peak=max(_peak,nav.elapsed_us);
    }
    var _valid=_f.ready && !_f.failed, _at=_start, _visited=0;
    while (_valid && _at!=_goal && _visited<4096) {
        if (!variable_struct_exists(_f.route,string(_at))) { _valid=false; break; }
        var _next=_f.route[$ string(_at)];
        if (_next<0 || nav.solid[_next] || !nav_segment(nav_x(_at),nav_y(_at),nav_x(_next),nav_y(_next))) { _valid=false; break; }
        _at=_next; _visited++;
    }
    unit_test_assert(_valid && _at==_goal && _visited>0,"A* reconstructs a reachable collision-safe route");
    unit_test_assert(_bounded && _frames<60,"navigation uses production work budget and responds within 60 ticks");
    unit_test_assert(nav_nearest(_saved_city.gx,_saved_city.gy)>=0 && !nav_open(_saved_city.gx,_saved_city.gy),"blocked command projects to open approach");
    nav.fields=[]; nav.active=undefined;
    var _goals=[];
    for (var _i=nav.count-1; _i>=0 && array_length(_goals)<25; --_i) if (!nav.solid[_i]) array_push(_goals,_i);
    for (var _i=0; _i<24; ++_i) nav_field(_goals[_i],_start);
    unit_test_assert(is_undefined(nav_field(_goals[24],_start)) && array_length(nav.fields)==24,"pending searches cannot be evicted or exceed cache capacity");
    var _all_ready=false, _first=-1, _last=-1, _fair=true;
    for (var _frame=0; _frame<240 && !_all_ready; ++_frame) {
        for (var _i=0; _i<24; ++_i) if (!nav.fields[_i].ready) nav.fields[_i].requested=nav.frame;
        nav_tick(); _all_ready=true;
        _bounded=_bounded && nav.expanded<=nav.budget; _peak=max(_peak,nav.elapsed_us);
        for (var _i=0; _i<24; ++_i) {
            if (!nav.fields[_i].ready) _all_ready=false;
            else if (_first<0) _first=_frame+1;
        }
        if (_all_ready) _last=_frame+1;
    }
    for (var _i=0; _i<24; ++_i) if (nav.fields[_i].expanded==0) _fair=false;
    unit_test_assert(_fair && _bounded && _all_ready,"24 distant commands finish fairly under production frame budgets");
    var _sum_expanded=0, _min_expanded=1000000000, _max_expanded=0;
    for (var _i=0; _i<24; ++_i) {
        var _work=nav.fields[_i].expanded;
        _sum_expanded+=_work; _min_expanded=min(_min_expanded,_work); _max_expanded=max(_max_expanded,_work);
    }
    show_debug_message("NAV_RESPONSE_BENCHMARK: first_ticks="+string(_first)+", last_ticks="+string(_last)+", peak_search_us="+string(_peak)
        +", total_expanded="+string(_sum_expanded)+", min_job_expanded="+string(_min_expanded)+", max_job_expanded="+string(_max_expanded));
    // Isolate a reachable island: a burst of impossible destinations must be
    // rejected by connectivity labels without flooding the rest of the map.
    var _saved_terrain=terrain, _saved_props=props;
    terrain=[]; array_copy(terrain,0,_saved_terrain,0,array_length(_saved_terrain)); props=[];
    for (var _yy=13; _yy<=17; ++_yy) for (var _xx=13; _xx<=17; ++_xx)
        terrain[_yy*map_size+_xx]=(_xx==13 || _xx==17 || _yy==13 || _yy==17) ? 1 : 0;
    nav_rebuild(); nav.fields=[]; nav.active=undefined;
    var _island=nav_nearest(15,15), _rejected=true;
    for (var _i=0; _i<40; ++_i) {
        var _job=nav_field(_island,nav_nearest(5+(_i mod 8)*0.34,5+(_i div 8)*0.34));
        if (is_undefined(_job) || !_job.ready || !_job.failed || _job.expanded!=0) _rejected=false;
    }
    unit_test_assert(_rejected && array_length(nav.fields)<=nav.capacity,"40 unreachable burst orders rejected immediately without map floods");
    // A new wall invalidates routes already held by an actor.
    var _old_revision=nav.revision;
    nav_rebuild(15,15,2);
    unit_test_assert(nav.revision>_old_revision && array_length(nav.fields)==0,"local collision changes invalidate pending and cached routes");
    props=[{unit:-1,spr:spr_outpost,gx:8,gy:8,span:2}]; nav_rebuild();
    var _adjacent={gx:9.14,gy:8,radius:0.13,field:undefined,next_cell:-1};
    var _old_x=_adjacent.gx;
    unit_test_assert(nav_body_open(_adjacent.gx,_adjacent.gy,_adjacent.radius),"unit beside new building has physical body clearance");
    nav_recover(_adjacent);
    unit_test_assert(nav_open(_adjacent.gx,_adjacent.gy) && _adjacent.gx>=_old_x
        && point_distance(_old_x,8,_adjacent.gx,_adjacent.gy)<=0.5,"building-adjacent unit escapes raster rounding without crossing footprint");
    var _corner={gx:9.1,gy:9.1,radius:0.13,field:undefined,next_cell:-1};
    var _corner_clear=nav_body_open(_corner.gx,_corner.gy,_corner.radius);
    nav_recover(_corner);
    unit_test_assert(_corner_clear && nav_open(_corner.gx,_corner.gy),"building corner uses circular body clearance and recovers a free microcell");
    props=[]; nav_rebuild();
    var _saved_seen=fog_seen;
    fog_seen=array_create(map_size*map_size,false);
    for (var _yy=5; _yy<=10; ++_yy) for (var _xx=5; _xx<=10; ++_xx) fog_seen[_yy*map_size+_xx]=true;
    var _scout=unit_spawn(0,8,8);
    unit_command(_scout,1,undefined,22,8);
    sim_testing=false; unit_route(_scout,22,8);
    var _frontier_x=_scout.travel_x;
    unit_test_assert(_scout.exploring && _scout.walk_direct && _frontier_x>8 && _frontier_x<11
        && fog_seen[fog_index(_scout.travel_x,_scout.travel_y)],"dark click starts a short explored waypoint in the requested direction");
    for (var _yy=5; _yy<=12; ++_yy) for (var _xx=5; _xx<=12; ++_xx) fog_seen[_yy*map_size+_xx]=true;
    unit_route(_scout,22,8);
    unit_test_assert(_scout.travel_x>_frontier_x && _scout.rally_x==22,"revealing terrain advances frontier while retaining original dark destination");
    sim_testing=true; fog_seen=_saved_seen; units=[];
    terrain=_saved_terrain; props=_saved_props; nav_rebuild(); nav.fields=[]; nav.active=undefined;
    var _u=unit_spawn(0,7.5,7);
    unit_command(_u,1,undefined,10,10);
    for (var _i=0; _i<600; ++_i) sim_tick(0.05);
    unit_test_assert(point_distance(_u.gx,_u.gy,10,10)<0.4,"continuous movement reaches destination around props");
    unit_test_assert(_u.hp==_u.max_hp && is_undefined(_u.target),"Ecclesian never acquires combat target");
    _u.walk_direct=false; _u.field={revision:nav.revision,ready:true,failed:true};
    var _old_x=_u.gx, _old_y=_u.gy;
    unit_test_assert(!unit_move(_u,0.05) && _u.unreachable && _u.gx==_old_x && _u.gy==_old_y,"unreachable route stops safely");
    units=[]; sim_over=false;
    for (var _i=0; _i<20; ++_i) {
        var _u=unit_spawn(1,8+(_i mod 5)*0.34,7.8+(_i div 5)*0.34);
        unit_command(_u,1,undefined,9+((_i mod 5)-2)*0.34,10+((_i div 5)-1.5)*0.34);
        _u.rally_x=9; _u.rally_y=10;
    }
    for (var _i=0; _i<700; ++_i) sim_tick(0.05);
    var _arrived=0;
    for (var _i=0; _i<array_length(units); ++_i) if (point_distance(units[_i].gx,units[_i].gy,units[_i].home_x,units[_i].home_y)<0.5) _arrived++;
    unit_test_assert(_arrived==20,"20-unit formation reaches individual slots");
    units=[]; sim_over=false;
    var _a=unit_spawn(1,8,8), _b=unit_spawn(2,8.333,8);
    _a.damage=200;
    for (var _i=0; _i<240 && _b.hp>0; ++_i) sim_tick(0.05);
    unit_test_assert(_b.hp==0 && _b.action==4,"automatic melee damage and death");
    for (var _i=0; _i<60; ++_i) sim_tick(0.05);
    unit_test_assert(_b.frame<=sprite_get_number(unit_sprites[2][4][_b.facing])-1,"death holds final frame");
    units=[]; sim_over=false;
    var _n={gx:12.5,gy:13.5,span:2,progress:0,needed:1,active:true,spawn_in:100,spawned:0};
    nodes=[_n];
    var _priest=unit_spawn(0,11,13.5);
    unit_command(_priest,2,_n,_n.gx,_n.gy);
    for (var _i=0; _i<200 && _n.active; ++_i) sim_tick(0.05);
    unit_test_assert(!_n.active && _n.progress==_n.needed,"assigned Ecclesian cleanses fixed node");
    var _spawned=_n.spawned; sim_over=false;
    for (var _i=0; _i<60; ++_i) sim_tick(0.05);
    unit_test_assert(_n.spawned==_spawned,"cleansed node stops spawning");
    units=[]; sim_over=false;
    _n.active=true; _n.progress=0; _n.spawn_in=0; nodes=[_n];
    sim_tick(0.05);
    unit_test_assert(_n.spawned==_spawned+1 && array_length(units)==1,"active node spawns Scourge");
    units=[]; sim_over=false; _n.spawn_in=1; _n.progress=0; _n.needed=5;
    var _priest=unit_spawn(0,10,12);
    for (var _i=0; _i<4; ++_i) {
        var _guard=unit_spawn(1,10+(_i mod 2)*0.34,11+(_i div 2)*0.34);
        unit_command(_guard,4,_priest,_priest.gx,_priest.gy);
    }
    unit_command(_priest,2,_n,_n.gx,_n.gy);
    for (var _i=0; _i<600 && _n.active; ++_i) sim_tick(0.05);
    unit_test_assert(!_n.active && _priest.hp>0,"full cycle: spawning node, escort defence, surviving cleanser");
    show_debug_message("UNIT_ESCORT: hp="+string(_priest.hp)+", position="+string(_priest.gx)+","+string(_priest.gy)+", progress="+string(_n.progress));
    units=[]; nodes=[]; sim_over=false;
    var _raider=unit_spawn(2,7,4);
    for (var _i=0; _i<500 && city.hp==1000; ++_i) sim_tick(0.05);
    unit_test_assert(city.hp<1000,"Scourge approaches and damages city");
    units=_saved_units; nodes=_saved_nodes; city=_saved_city; next_unit_id=_saved_id;
    sim_time=0; sim_over=false; sim_testing=false; nav.fields=[]; nav.active=undefined; nav.hits=0; nav.misses=0;
    sim_message="Select allies; right-click ground, enemy, or node";
    unit_buckets();
    show_debug_message(unit_test_failed ? "UNIT_TEST_SUITE_FAILED" : "UNIT_TEST_COMPLETE");
};
unit_bench_total=0; unit_bench_max=0; unit_bench_samples=[]; unit_bench_frame_samples=[];
unit_bench_begin = function() {
    unit_bench_total=0; unit_bench_max=0; unit_bench_samples=[]; unit_bench_frame_samples=[];
    units=[]; nodes=[]; nav.fields=[]; nav.active=undefined; sim_testing=true; sim_over=false;
    for (var _i=0; _i<200; ++_i) {
        var _u=unit_spawn(1,7+(_i mod 20)*0.32,7+(_i div 20)*0.32);
        unit_command(_u,1,undefined,9+((_i mod 20)-9.5)*0.3,11+((_i div 20)-4.5)*0.3);
        _u.rally_x=9; _u.rally_y=11;
    }
};
unit_bench_end = function() {
    var _safe=true;
    for (var _i=0; _i<array_length(units); ++_i) if (!nav_open(units[_i].gx,units[_i].gy)) _safe=false;
    unit_test_assert(_safe && array_length(nav.fields)<=nav.capacity,"200 units share bounded cache and avoid obstacles");
    array_sort(unit_bench_samples,true);
    show_debug_message("UNIT_BENCHMARK: 200 units, 120 real frames, mean_us="+string(unit_bench_total/120)
        +", p95_us="+string(unit_bench_samples[113])+", max_us="+string(unit_bench_max));
    if (array_length(unit_bench_frame_samples)>0) {
        var _sum=0;
        for (var _i=0; _i<array_length(unit_bench_frame_samples); ++_i) _sum+=unit_bench_frame_samples[_i];
        array_sort(unit_bench_frame_samples,true);
        var _count=array_length(unit_bench_frame_samples);
        show_debug_message("UNIT_FRAME_BENCHMARK: 200 units, mean_us="+string(_sum/_count)
            +", p95_us="+string(unit_bench_frame_samples[max(0,ceil(_count*0.95)-1)])+", max_us="+string(unit_bench_frame_samples[_count-1]));
    }
    show_debug_message(unit_test_failed ? "UNIT_TEST_SUITE_FAILED" : "UNIT_SMOKE_COMPLETE");
    if (unit_test_failed) throw "UNIT_TEST_SUITE_FAILED";
};

// GUI: fixed logical canvas; the same rectangles drive drawing and input.
if (!variable_global_exists("gui_fonts")) {
    global.gui_fonts=[font_add("YoungSerif-Regular.ttf",24,false,false,32,127),
        font_add("IMFELLEnglish-Regular.ttf",19,false,false,32,127),
        font_add("IMFELLEnglish-Regular.ttf",15,false,false,32,127)];
}
gui_heading_font=global.gui_fonts[0]; gui_body_font=global.gui_fonts[1]; gui_small_font=global.gui_fonts[2];
if (gui_heading_font==-1 || gui_body_font==-1 || gui_small_font==-1) show_error("GUI fonts could not be loaded.",true);
gui_top=105; gui_bottom=lab_height-296;
gui_world_centre_y=floor((gui_top+gui_bottom)*0.5);
gui_window_bounds=[0,0,lab_width,lab_height];
player_gui_update=function() {
    // Keep the logical canvas aligned with the application surface,
    // but allow GUI drawing over the window's pillarbox/letterbox margins too.
    // GX reports browser dimensions here, while GUI/mouse coordinates belong
    // to its canvas. Let the runner apply the canvas/CSS transform once.
    if (web_layout) return;
    var _position=application_get_position();
    var _scale_x=max(1,_position[2]-_position[0])/lab_width;
    var _scale_y=max(1,_position[3]-_position[1])/lab_height;
    // Some native fullscreen runners report a 0x0 window. The centred
    // application rectangle still gives the complete back-buffer dimensions.
    var _window_width=max(1,window_get_width(),_position[0]+_position[2]);
    var _window_height=max(1,window_get_height(),_position[1]+_position[3]);
    display_set_gui_maximise(_scale_x,_scale_y,_position[0],_position[1]);
    gui_window_bounds[0]=floor(-_position[0]/_scale_x);
    gui_window_bounds[1]=floor(-_position[1]/_scale_y);
    gui_window_bounds[2]=ceil((_window_width-_position[0])/_scale_x);
    gui_window_bounds[3]=ceil((_window_height-_position[1])/_scale_y);
};
gui_clock=0; gui_menu=-1; gui_prop=-1; gui_inspected=undefined;
gui_place=-1; gui_notice=""; gui_notice_time=0;
gold=250; gold_clock=0;
gui_names=["Ecclesian","Militia","Sentrion","Outpost"];
gui_costs=[35,25,20,100];
gui_descriptions=["A ritual cleanser. Send with an escort.","A defender. Guards allies and the city.","Reveals 6 cells and signals nearby threats.","A forward garrison for recruiting units."];
gui_icons=[spr_gui_icon_ecclesian,spr_gui_icon_militia,spr_gui_icon_sentrion,spr_gui_icon_outpost];
gui_unit_portraits=[spr_gui_portrait_ecclesian,spr_gui_portrait_militia,spr_gui_portrait_scourge];
gui_slots=[[399,730,129,123],[564,730,129,123],[730,730,129,123],[896,730,129,123]];
for (var _slot=0; _slot<array_length(gui_slots); ++_slot) gui_slots[_slot][1]=gui_bottom+126;
gui_army_slots=[[277,0,220,105],[497,0,220,105]];
gui_create_rect=[1101,gui_bottom+207,264,31];
gui_ink=make_colour_rgb(232,219,185);
gui_muted=make_colour_rgb(178,167,143);
for (var _i=0; _i<array_length(props); ++_i) {
    var _p=props[_i];
    if (_p.id==1 || _p.id==2) { _p.max_hp=(_p.id==1 ? 400 : 250); _p.hp=_p.max_hp; }
}
window_set_caption("Ungodly Remnants");
world_to_gui = function(_wx,_wy) {
    return [720+(_wx-camera_x)*map_zoom,gui_world_centre_y+(_wy-camera_y)*map_zoom];
};
gui_to_world = function(_sx,_sy) {
    return [camera_x+(_sx-720)/map_zoom,camera_y+(_sy-gui_world_centre_y)/map_zoom];
};
// Client-window pixels keep the edge band consistent when the window resizes.
camera_pan_vector = function(_key_x,_key_y,_mx,_my,_width,_height,_edge_active) {
    var _edge_x=0, _edge_y=0;
    if (_edge_active && _width>0 && _height>0
        && _mx>=0 && _my>=0 && _mx<_width && _my<_height) {
        var _band=min(18,min(_width,_height)*0.1);
        _edge_x=(_mx>=_width-_band)-(_mx<_band);
        _edge_y=(_my>=_height-_band)-(_my<_band);
    }
    // Keyboard input takes precedence on its axis; corners keep the same speed.
    var _vx=(_key_x!=0 ? _key_x : _edge_x), _vy=(_key_y!=0 ? _key_y : _edge_y);
    var _length=max(1,sqrt(_vx*_vx+_vy*_vy));
    return [_vx/_length,_vy/_length];
};
gui_threat_marker = function(_gx,_gy) {
    var _w=iso_to_world(_gx,_gy), _s=world_to_gui(_w[0],_w[1]);
    if (_s[0]>=0 && _s[0]<=lab_width && _s[1]>=gui_top && _s[1]<=gui_bottom) return undefined;
    var _cx=lab_width*0.5, _cy=(gui_top+gui_bottom)*0.5;
    var _dx=_s[0]-_cx, _dy=_s[1]-_cy, _distance=point_distance(0,0,_dx,_dy);
    var _scale=1000000000;
    if (abs(_dx)>0.0001) _scale=min(_scale,(_cx-28)/abs(_dx));
    if (abs(_dy)>0.0001) _scale=min(_scale,((gui_bottom-gui_top)*0.5-28)/abs(_dy));
    return {x:_cx+_dx*_scale,y:_cy+_dy*_scale,
        dx:_dx/_distance,dy:_dy/_distance,distance:_distance};
};
gui_offscreen_threat = function() {
    if (sim_over) return undefined;
    var _best=undefined, _rank=1000000000;
    // Current allied vision supplies contacts; fog memory cannot track enemies.
    for (var _i=0; _i<array_length(units); ++_i) {
        var _u=units[_i];
        if (_u.team!=1 || _u.hp<=0 || !fog_can_see(_u.gx,_u.gy)) continue;
        var _marker=gui_threat_marker(_u.gx,_u.gy);
        if (!is_undefined(_marker) && _marker.distance<_rank) { _best=_marker; _rank=_marker.distance; }
    }
    if (!is_undefined(_best)) return _best;
    for (var _i=0; _i<array_length(nodes); ++_i) {
        var _n=nodes[_i];
        if (!_n.active || !fog_can_see(_n.gx,_n.gy)) continue;
        var _marker=gui_threat_marker(_n.gx,_n.gy);
        if (!is_undefined(_marker) && _marker.distance<_rank) { _best=_marker; _rank=_marker.distance; }
    }
    if (!is_undefined(_best)) return _best;
    // A watchtower can also signal corruption without a nearby unit/node.
    for (var _i=0; _i<array_length(props); ++_i) {
        var _p=props[_i];
        if (_p.spr!=spr_sentrion_work || _p.hp<=0 || !variable_struct_exists(_p,"alarm") || !_p.alarm) continue;
        var _gx=variable_struct_exists(_p,"threat_x") ? _p.threat_x : _p.gx;
        var _gy=variable_struct_exists(_p,"threat_y") ? _p.threat_y : _p.gy;
        if (!fog_can_see(_gx,_gy)) continue;
        var _marker=gui_threat_marker(_gx,_gy);
        if (!is_undefined(_marker) && _marker.distance<_rank) { _best=_marker; _rank=_marker.distance; }
    }
    return _best;
};
gui_draw_threat = function() {
    var _m=gui_offscreen_threat();
    if (is_undefined(_m)) return;
    var _pulse=0.65+0.35*sin(gui_clock*5);
    draw_set_alpha(0.92); draw_set_colour(make_colour_rgb(22,16,15));
    draw_circle(_m.x,_m.y,22,false);
    draw_set_alpha(_pulse); draw_set_colour(make_colour_rgb(235,110,62));
    draw_circle(_m.x,_m.y,22,true);
    draw_set_alpha(1);
    var _tip_x=_m.x+_m.dx*15, _tip_y=_m.y+_m.dy*15;
    var _back_x=_m.x+_m.dx, _back_y=_m.y+_m.dy;
    draw_line_width(_m.x-_m.dx*14,_m.y-_m.dy*14,_back_x,_back_y,5);
    draw_triangle(_tip_x,_tip_y,_back_x-_m.dy*9,_back_y+_m.dx*9,
        _back_x+_m.dy*9,_back_y-_m.dx*9,false);
    draw_set_colour(c_white); draw_set_alpha(1);
};
gui_hit = function(_r) {
    return point_in_rectangle(mouse_gui_x,mouse_gui_y,_r[0],_r[1],_r[0]+_r[2],_r[1]+_r[3]);
};
gui_message = function(_text) { gui_notice=_text; gui_notice_time=4; };
gui_get_prop = function(_id) {
    for (var _i=0; _i<array_length(props); ++_i) if (props[_i].id==_id) return props[_i];
    return undefined;
};
gui_prop_kind = function(_p) {
    if (variable_struct_exists(_p,"city")) return "city";
    if (variable_struct_exists(_p,"node")) return "infestation";
    if (_p.spr==spr_outpost) return "outpost";
    if (_p.spr==spr_sentrion_work) return "sentrion";
    if (_p.spr==spr_windmill) return "windmill";
    if (_p.spr==spr_remnant) return "remnant";
    return "";
};
gui_visible = function(_p) {
    var _w=iso_to_world(_p.gx,_p.gy), _s=world_to_gui(_w[0],_w[1]);
    // Visibility means the rendered building intersects the playable viewport.
    var _l=_s[0]-sprite_get_xoffset(_p.spr)*map_zoom;
    var _t=_s[1]-sprite_get_yoffset(_p.spr)*map_zoom;
    return _l<1440 && _l+sprite_get_width(_p.spr)*map_zoom>0
        && _t<gui_bottom && _t+sprite_get_height(_p.spr)*map_zoom>gui_top;
};
gui_spawn_source = function() {
    if (city.hp<=0) return undefined;
    var _selected=gui_get_prop(gui_prop), _city=undefined;
    var _city_visible=false, _garrison_visible=false;
    for (var _i=0; _i<array_length(props); ++_i) {
        var _p=props[_i];
        if (variable_struct_exists(_p,"city")) { _city=_p; _city_visible=gui_visible(_p); }
        if (_p.spr==spr_outpost && _p.hp>0 && gui_visible(_p)) _garrison_visible=true;
    }
    if (!is_undefined(_selected)) {
        if (variable_struct_exists(_selected,"city")) return _city;
        if (_selected.spr==spr_outpost && _selected.hp>0) return _selected;
    }
    if (_city_visible || (!_city_visible && !_garrison_visible)) return _city;
    return undefined;
};
gui_selection = function() {
    for (var _i=0; _i<array_length(units); ++_i) if (units[_i].selected && units[_i].hp>0) return units[_i];
    if (!is_undefined(gui_inspected) && gui_inspected.hp>0) return gui_inspected;
    return undefined;
};
gui_selection_mixed = function() {
    var _kind=-1;
    for (var _i=0; _i<array_length(units); ++_i) {
        var _u=units[_i]; if (!_u.selected || _u.hp<=0) continue;
        if (_kind>=0 && _kind!=_u.kind) return true;
        _kind=_u.kind;
    }
    return false;
};
gui_select_kind = function(_kind) {
    for (var _i=0; _i<array_length(units); ++_i) {
        var _u=units[_i];
        _u.selected=(_u.team==0 && _u.hp>0 && _u.kind==_kind);
    }
    gui_prop=-1; gui_inspected=undefined; gui_menu=-1; gui_place=-1; dragging=false;
};
gui_pick_prop = function() {
    gui_prop=-1;
    // Props are sorted back to front; the last visible hit is the frontmost.
    for (var _i=0; _i<array_length(props); ++_i) {
        var _p=props[_i]; if (gui_prop_kind(_p)=="" || !fog_can_see(_p.gx,_p.gy)) continue;
        if (_p.spr==spr_remnant && _p.relic.collected) continue;
        var _w=iso_to_world(_p.gx,_p.gy), _s=world_to_gui(_w[0],_w[1]);
        var _scale=map_zoom*_p.scale;
        var _l=_s[0]-sprite_get_xoffset(_p.spr)*_scale;
        var _t=_s[1]-sprite_get_yoffset(_p.spr)*_scale;
        if (point_in_rectangle(mouse_gui_x,mouse_gui_y,_l,_t,_l+sprite_get_width(_p.spr)*_scale,_t+sprite_get_height(_p.spr)*_scale)) gui_prop=_p.id;
    }
};
gui_placement_cell = function() {
    var _w=gui_to_world(mouse_gui_x,mouse_gui_y), _g=world_to_iso(_w[0],_w[1]);
    return [clamp(_g[0],1,map_size-3)+0.5,clamp(_g[1],1,map_size-3)+0.5];
};
gui_can_build = function(_gx,_gy) {
    if (sim_over || city.hp<=0) return false;
    // A span-2 building on a half-cell anchor covers exactly 2x2 terrain cells.
    // Sampling +/-1 and rounding used to check an unrelated third row/column.
    var _half=1, _hidden=0;
    var _x0=floor(_gx-_half+0.5), _x1=ceil(_gx+_half-0.5);
    var _y0=floor(_gy-_half+0.5), _y1=ceil(_gy+_half-0.5);
    for (var _y=_y0; _y<=_y1; ++_y) for (var _x=_x0; _x<=_x1; ++_x) {
        var _idx=fog_index(_x,_y);
        if (_idx<0 || !fog_seen[_idx] || terrain[_idx]!=0) return false;
        if (!fog_visible[_idx] && ++_hidden>2) return false;
    }
    // Navigation walls include clearance for moving units. Placement uses the
    // actual building rectangle and unit circles instead of that inflated grid.
    for (var _i=0; _i<array_length(units); ++_i) {
        var _u=units[_i];
        if (_u.hp<=0) continue;
        var _radius=variable_struct_exists(_u,"radius") ? _u.radius : 0.13;
        var _dx=max(0,abs(_gx-_u.gx)-_half), _dy=max(0,abs(_gy-_u.gy)-_half);
        if (sqr(_dx)+sqr(_dy)<sqr(_radius)) return false;
    }
    for (var _i=0; _i<array_length(props); ++_i) {
        var _p=props[_i];
        if (_p.spr==spr_remnant && _p.relic.collected) continue;
        if (abs(_gx-_p.gx)<_half+_p.span*0.5 && abs(_gy-_p.gy)<_half+_p.span*0.5) return false;
    }
    return true;
};
gui_build = function(_kind,_gx,_gy) {
    if (_kind<2 || _kind>3 || gold<gui_costs[_kind] || !gui_can_build(_gx,_gy)) return false;
    var _next=0;
    for (var _i=0; _i<array_length(props); ++_i) _next=max(_next,props[_i].id+1);
    var _hp=(_kind==3 ? 400 : 250);
    array_push(props,{id:_next,label:gui_names[_kind],spr:(_kind==3 ? spr_outpost : spr_sentrion_work),
        gx:_gx,gy:_gy,span:2,fps:(_kind==2 ? 5 : 0),unit:-1,offset_x:0,offset_y:0,scale:1,hp:_hp,max_hp:_hp});
    gold-=gui_costs[_kind];
    gui_prop=_next; gui_inspected=undefined;
    for (var _i=0; _i<array_length(units); ++_i) units[_i].selected=false;
    nav_rebuild(_gx,_gy,2);
    for (var _i=0; _i<array_length(units); ++_i) {
        var _u=units[_i]; _u.field=undefined; _u.next_cell=-1;
        _u.think=(_u.id mod 12)/60;
    }
    fog_update(); sentrion_tick();
    gui_message(gui_names[_kind]+" constructed.");
    av_sound(snd_build,0.75);
    return true;
};
gui_recruit = function(_kind) {
    if (_kind<0 || _kind>1 || sim_over || gold<gui_costs[_kind]) return false;
    var _source=gui_spawn_source();
    if (is_undefined(_source)) { gui_message("Select a visible Outpost to recruit here."); return false; }
    var _u=unit_spawn(_kind,_source.gx+_source.span*0.5+0.7,_source.gy);
    if (is_undefined(_u)) { gui_message("Unit limit reached or no free spawn space."); return false; }
    gold-=gui_costs[_kind];
    fog_update();
    av_sound(snd_unit_spawn,0.7);
    gui_message(gui_names[_kind]+" recruited at "+(variable_struct_exists(_source,"city") ? "the City." : "the Outpost."));
    return true;
};
gui_input = function() {
    if (sim_over) {
        dragging=false;
        return true;
    }
    if (keyboard_check_pressed(vk_escape)) { gui_menu=-1; gui_place=-1; dragging=false; }
    if (gui_place>=0 && mouse_check_button_pressed(mb_right)) { gui_place=-1; return true; }
    if (mouse_gui_y<=gui_top || mouse_gui_y>=gui_bottom) {
        if (mouse_check_button_released(mb_left)) dragging=false;
        if (mouse_check_button_pressed(mb_left)) {
            av_sound(snd_ui_click,0.55);
            for (var _i=0; _i<2; ++_i) if (gui_hit(gui_army_slots[_i])) { gui_select_kind(_i); return true; }
            var _city_selected=gui_get_prop(gui_prop);
            if (gui_menu<0 && !is_undefined(_city_selected) && variable_struct_exists(_city_selected,"city")
                && is_undefined(gui_selection()) && gui_hit(gui_create_rect)) { ritual_start(); return true; }
            for (var _i=0; _i<4; ++_i) if (gui_hit(gui_slots[_i])) { gui_menu=_i; gui_place=-1; }
            if (gui_menu>=0 && gui_hit(gui_create_rect) && !sim_over) {
                if (gold<gui_costs[gui_menu]) gui_message("Not enough gold.");
                else if (gui_menu<2) gui_recruit(gui_menu);
                else { gui_place=gui_menu; gui_menu=-1; gui_message("Choose visible, uncorrupted ground. Right-click or Esc cancels."); }
            }
        }
        return true;
    }
    if (gui_place>=0) {
        if (mouse_check_button_pressed(mb_left)) {
            var _cell=gui_placement_cell();
            if (gui_build(gui_place,_cell[0],_cell[1])) { gui_place=-1; gui_menu=-1; }
            else gui_message("Use visible, clean ground away from units and buildings.");
        }
        return true;
    }
    return false;
};
gui_tick = function(_dt) {
    gui_clock+=_dt;
    gui_notice_time=max(0,gui_notice_time-_dt);
    if (!paused && !sim_over && lab_mode==0) {
        gold_clock+=_dt;
        if (gold_clock>=15) { gold_clock-=15; gold+=10; }
    }
};
gui_text = function(_font,_text,_x,_y,_colour) {
    draw_set_font(_font); draw_set_colour(c_black); draw_text(_x+1,_y+1,_text);
    draw_set_colour(_colour); draw_text(_x,_y,_text);
};
gui_button_text = function(_font,_text,_x,_y,_width,_height,_colour) {
    var _halign=draw_get_halign(), _valign=draw_get_valign();
    draw_set_halign(fa_center); draw_set_valign(fa_middle);
    gui_text(_font,_text,_x+_width*0.5,_y+_height*0.5-3,_colour);
    draw_set_halign(_halign); draw_set_valign(_valign);
};
// Cache half-resolution decorative artwork once per process. Text is drawn
// separately at its original resolution; repeated matches reuse these sprites.
if (!variable_global_exists("gui_art_cache")) global.gui_art_cache=[-1,-1,-1];
gui_artwork = function(_spr,_x,_y,_width,_height,_colour=c_white,_alpha=1) {
    var _sources=[spr_gui_top,spr_gui_bottom,spr_gui_button];
    var _slot=0;
    for (var _i=0; _i<3; ++_i) if (_sources[_i]==_spr) _slot=_i;
    var _cached=global.gui_art_cache[_slot];
    if (_cached<0 || !sprite_exists(_cached)) {
        var _width_px=max(1,ceil(sprite_get_width(_spr)*0.5));
        var _height_px=max(1,ceil(sprite_get_height(_spr)*0.5));
        var _surface=surface_create(_width_px,_height_px);
        if (surface_exists(_surface)) {
            var _filter=gpu_get_texfilter();
            gpu_set_texfilter(true);
            surface_set_target(_surface);
            draw_clear_alpha(c_black,0);
            draw_sprite_stretched(_spr,0,0,0,_width_px,_height_px);
            surface_reset_target();
            _cached=sprite_create_from_surface(_surface,0,0,_width_px,_height_px,false,false,0,0);
            surface_free(_surface);
            gpu_set_texfilter(_filter);
            global.gui_art_cache[_slot]=_cached;
        }
    }
    var _filter=gpu_get_texfilter();
    // Enlarge the reduced texture with linear filtering for a soft painted HUD.
    gpu_set_texfilter(true);
    draw_sprite_stretched_ext(_cached<0 ? _spr : _cached,0,_x,_y,_width,_height,_colour,_alpha);
    gpu_set_texfilter(_filter);
};
gui_draw = function() {
    draw_set_alpha(1); draw_set_halign(fa_left); draw_set_valign(fa_top);
    gui_artwork(spr_gui_top,0,0,1440,105);
    gui_artwork(spr_gui_bottom,0,gui_bottom,1440,296);
    var _counts=[0,0,0,0];
    for (var _i=0; _i<array_length(units); ++_i) if (units[_i].hp>0 && units[_i].kind<2) _counts[units[_i].kind]++;
    for (var _i=0; _i<array_length(props); ++_i) {
        var _p=props[_i];
        if (_p.spr==spr_sentrion_work && _p.hp>0) _counts[2]++;
        if (_p.spr==spr_outpost && _p.hp>0) _counts[3]++;
    }
    var _centres=[166,387,607,827,1047,1267];
    draw_sprite_stretched(spr_gui_coin,0,88,40,40,40);
    gui_text(gui_small_font,"GOLD",143,35,gui_muted);
    gui_text(gui_heading_font,string(gold),143,52,gui_ink);
    var _labels=["ECCLESIANS","MILITIA","SENTRIONS","OUTPOSTS"];
    for (var _i=0; _i<4; ++_i) {
        var _cx=_centres[_i+1];
        if (_i<2 && gui_hit(gui_army_slots[_i])) {
            draw_set_colour(make_colour_rgb(203,169,99));
            draw_rectangle(_cx-100,24,_cx+100,88,true);
        }
        var _content_x=_cx-(_i==0 ? 18 : 0);
        draw_sprite_stretched(gui_icons[_i],0,_content_x-78,38,44,44);
        gui_text(gui_small_font,_labels[_i],_content_x-24,35,gui_muted);
        gui_text(gui_heading_font,string(_counts[_i]),_content_x-24,52,gui_ink);
    }
    gui_text(gui_small_font,"CITY HEALTH",1210,35,gui_muted);
    gui_text(gui_heading_font,string(ceil(100*city.hp/city.max_hp))+"%",1210,52,gui_ink);
    // Collection remains visible during army selection, recruitment and the finale.
    draw_set_colour(make_colour_rgb(20,24,28)); draw_set_alpha(0.9);
    draw_rectangle(1008,112,1420,182,false); draw_set_alpha(1);
    gui_text(gui_small_font,"REMNANTS  "+string(remnant_count)+" / 3",1022,117,gui_ink);
    for (var _i=0; _i<3; ++_i) {
        draw_sprite_stretched_ext(spr_gui_icon_remnant,0,1022+_i*36,141,30,30,
            _i<remnant_count ? c_white : make_colour_rgb(65,65,75),1);
    }
    var _objective=remnant_count<3 ? "Cleanse nodes; recover relics" : "Select City: begin ritual";
    if (ritual.active) _objective="Ritual "+string(floor(100*ritual.elapsed/ritual.duration))+"% | "+string(ceil(ritual.duration-ritual.elapsed))+"s";
    if (sim_over) _objective=sim_won ? "Ritual complete" : "City lost";
    gui_text(gui_small_font,_objective,1132,147,gui_ink);
    if (ritual.active) {
        draw_set_colour(make_colour_rgb(55,52,50)); draw_rectangle(1022,175,1406,179,false);
        draw_set_colour(c_aqua); draw_rectangle(1022,175,1022+384*ritual.elapsed/ritual.duration,179,false);
    }
    gui_text(gui_small_font,"ARMY "+string(_counts[0]+_counts[1])+" / "+string(balance.ally_limit)+"   |   SPACE Pause   |   ESC Menu   |   F1 Controls",26,gui_bottom-22,gui_muted);
    var _u=gui_selection(), _p=gui_get_prop(gui_prop), _mixed=gui_selection_mixed();
    var _portrait=-1, _name="Ungodly Remnants", _description="Select a unit or building.", _hp=-1, _maxhp=1;
    if (!is_undefined(_u)) {
        if (!_mixed) _portrait=gui_unit_portraits[_u.kind];
        _name=["Ecclesian","Militia","Scourge"][_u.kind];
        _description=["Ritual cleanser. Needs an escort.","Defender. Protects the city and allies.","Hostile creature of the Infestation."][_u.kind];
        _hp=_u.hp; _maxhp=_u.max_hp;
        if (_mixed) { _name="Army"; _description="Ecclesians and Militia selected."; _hp=-1; }
    } else if (!is_undefined(_p)) {
        var _key=gui_prop_kind(_p);
        _portrait=asset_get_index("spr_gui_portrait_"+_key);
        switch (_key) {
            case "city": _name="City"; _description="Remnants: "+string(remnant_count)+" / 3"; _hp=city.hp; _maxhp=city.max_hp; break;
            case "outpost": _name="Outpost"; _description="Select to recruit units at this garrison."; _hp=_p.hp; _maxhp=_p.max_hp; break;
            case "sentrion": _name="Sentrion"; _description="Sight: 6 cells. Signals nearby threats."; _hp=_p.hp; _maxhp=_p.max_hp; break;
            case "windmill": _name="Windmill"; _description="A weathered landmark beyond the city."; break;
            case "remnant": _name="Remnant"; _description="Move a living Ecclesian beside it to recover it for the City."; break;
            case "infestation": _name=_p.node.active ? "Infestation" : "Cleansed Node";
                _description="Cleanse with Ecclesians. Rare chance to leave a Remnant."; break;
        }
    }
    // The square portrait stays tied to selection while a creation menu is open.
    if (_portrait!=-1) {
        var _frame=floor(gui_clock*10) mod sprite_get_number(_portrait);
        draw_sprite_stretched(_portrait,_frame,93,gui_bottom+70,176,176);
    } else if (!_mixed) {
        draw_sprite_stretched(spr_gui_portrait_city,0,93,gui_bottom+70,176,176);
    }
    for (var _i=0; _i<4; ++_i) {
        var _r=gui_slots[_i];
        draw_sprite_stretched(gui_icons[_i],0,_r[0]+3,_r[1]+2,_r[2]-6,_r[3]-4);
        draw_set_halign(fa_center);
        var _label_offsets=[0,-12,16,0];
        gui_text(gui_small_font,gui_names[_i],_r[0]+_r[2]*0.5+_label_offsets[_i],gui_bottom+77,gui_ink);
        draw_set_halign(fa_left);
        if (gui_menu==_i || gui_hit(_r)) {
            draw_set_colour(make_colour_rgb(203,169,99));
            draw_rectangle(_r[0],_r[1],_r[0]+_r[2],_r[1]+_r[3],true);
        }
    }
    var _x=1093, _y=gui_bottom+121;
    if (gui_menu>=0) {
        var _kind=gui_menu, _can=!sim_over && gold>=gui_costs[_kind];
        var _source=gui_spawn_source();
        if (_kind<2 && (is_undefined(_source) || _counts[0]+_counts[1]>=balance.ally_limit)) _can=false;
        gui_text(gui_heading_font,gui_names[_kind],_x,_y,gui_ink);
        draw_set_font(gui_small_font); draw_set_colour(gui_muted);
        draw_text_ext(_x,_y+30,gui_descriptions[_kind],15,300);
        var _where="Choose a building site";
        if (_kind<2) _where=is_undefined(_source) ? "Select an Outpost to recruit here" : (variable_struct_exists(_source,"city") ? "Recruit at: City" : "Recruit at: Outpost");
        if (_kind<2 && _counts[0]+_counts[1]>=balance.ally_limit) _where="Army limit reached";
        gui_text(gui_small_font,string(gui_costs[_kind])+" gold  |  "+_where,_x,_y+64,gui_muted);
        var _r=gui_create_rect;
        gui_artwork(spr_gui_button,_r[0],_r[1],_r[2],_r[3],_can ? c_white : make_colour_rgb(100,100,100));
        draw_set_halign(fa_center);
        gui_button_text(gui_body_font,_kind<2 ? "Hire" : "Place building",_r[0],_r[1],_r[2],_r[3],_can ? gui_ink : gui_muted);
        draw_set_halign(fa_left);
    } else {
        gui_text(gui_heading_font,_name,_x,_y,gui_ink);
        draw_set_font(gui_body_font); draw_set_colour(gui_muted);
        draw_text_ext(_x,_y+33,_description,20,300);
        var _is_city=!is_undefined(_p) && variable_struct_exists(_p,"city") && is_undefined(_u);
        if (_is_city) {
            gui_text(gui_small_font,string(ceil(city.hp))+" / "+string(city.max_hp)+" HP",_x,_y+55,gui_ink);
            draw_set_colour(make_colour_rgb(25,23,22)); draw_rectangle(_x,gui_bottom+199,_x+300,gui_bottom+203,false);
            draw_set_colour(make_colour_rgb(107,138,74)); draw_rectangle(_x,gui_bottom+199,_x+300*city.hp/city.max_hp,gui_bottom+203,false);
            var _r=gui_create_rect, _can=ritual_reason()=="";
            gui_artwork(spr_gui_button,_r[0],_r[1],_r[2],_r[3],_can ? c_white : make_colour_rgb(100,100,100));
            draw_set_halign(fa_center);
            var _label=sim_over ? "Match finished" : (ritual.active ? "Ritual in progress" : "Begin final ritual");
            gui_button_text(gui_body_font,_label,_r[0],_r[1],_r[2],_r[3],_can ? gui_ink : gui_muted);
            draw_set_halign(fa_left);
            gui_text(gui_small_font,ritual_reason(),_x,_y+123,gui_muted);
        } else if (_hp>=0) {
            gui_text(gui_small_font,string(ceil(_hp))+" / "+string(_maxhp)+" HP",_x,_y+75,gui_ink);
            draw_set_colour(make_colour_rgb(25,23,22)); draw_rectangle(_x,_y+99,_x+300,_y+109,false);
            draw_set_colour(make_colour_rgb(107,138,74)); draw_rectangle(_x+1,_y+100,_x+1+298*clamp(_hp/_maxhp,0,1),_y+108,false);
        }
    }
    if (sim_time<alert_until && !sim_over) {
        draw_set_halign(fa_center);
        gui_text(gui_body_font,alert_text,720,118,c_orange);
        draw_set_halign(fa_left);
    }
    // Selection / status sits in the narrow stone footer, outside the artwork slots.
    if (gui_notice_time>0 || paused || sim_over) {
        var _status=sim_over ? sim_message : (gui_notice_time>0 ? gui_notice : "Paused");
        draw_set_halign(fa_center);
        gui_text(gui_small_font,_status,720,lab_height-20,gui_ink);
        draw_set_halign(fa_left);
    }
    if (sim_over) {
        var _won=sim_won;
        draw_set_alpha(0.95); draw_set_colour(make_colour_rgb(20,24,28));
        draw_rectangle(490,255,950,470,false); draw_set_alpha(1);
        draw_set_colour(gui_muted); draw_rectangle(490,255,950,470,true);
        draw_set_halign(fa_center);
        gui_text(gui_heading_font,_won ? "Victory" : "Defeat",720,275,gui_ink);
        var _result=_won ? "The ritual is complete. The City endures." : (city.hp<=0 ? "The City has fallen." : "Infestation has reached the City.");
        gui_text(gui_body_font,_result,720,315,gui_ink);
        gui_text(gui_small_font,"Remnants "+string(remnant_count)+" / 3  |  Time "+string(floor(sim_time))+"s",720,345,gui_muted);
        gui_artwork(spr_gui_button,570,375,300,31);
        gui_button_text(gui_body_font,"Play again",570,375,300,31,gui_ink);
        gui_artwork(spr_gui_button,570,420,300,31);
        gui_button_text(gui_body_font,"Main menu",570,420,300,31,gui_ink);
        draw_set_halign(fa_left);
    }
    draw_set_font(-1); draw_set_colour(c_white); draw_set_alpha(1);
};
// Explicit opt-in VM integration checks and captures, never active in normal play.
gui_test_mode=environment_get_variable("UNGODLY_GUI_TEST")!="";
gui_test_tick=0;
gui_navigation_tests = function() {
    var _cases=[[0,400,-1,0],[1279,400,1,0],[640,0,0,-1],[640,799,0,1]];
    var _edges_ok=true;
    for (var _i=0; _i<array_length(_cases); ++_i) {
        var _c=_cases[_i], _v=camera_pan_vector(0,0,_c[0],_c[1],1280,800,true);
        if (_v[0]!=_c[2] || _v[1]!=_c[3]) _edges_ok=false;
    }
    unit_test_assert(_edges_ok,"Camera: all four client-window edges scroll in the correct direction");
    var _v=camera_pan_vector(0,0,0,0,1280,800,true);
    unit_test_assert(_v[0]<0 && _v[1]<0 && abs(sqr(_v[0])+sqr(_v[1])-1)<=0.00001,
        "Camera: corner scrolling is diagonal without a speed boost");
    var _stopped=true, _positions=[[-1,400],[1280,400],[640,-1],[640,800],[640,400]];
    for (var _i=0; _i<array_length(_positions); ++_i) {
        _v=camera_pan_vector(0,0,_positions[_i][0],_positions[_i][1],1280,800,true);
        if (_v[0]!=0 || _v[1]!=0) _stopped=false;
    }
    _v=camera_pan_vector(0,0,0,0,1280,800,false);
    unit_test_assert(_stopped && _v[0]==0 && _v[1]==0,"Camera: outside cursor, interior and inactive window do not edge-scroll");
    _v=camera_pan_vector(1,0,0,400,1280,800,true);
    unit_test_assert(_v[0]==1 && _v[1]==0,"Camera: keyboard overrides opposing edge input");
    _v=camera_pan_vector(0,0,1919,540,1920,1080,true);
    unit_test_assert(_v[0]==1 && _v[1]==0,"Camera: edge scrolling follows resized client dimensions");

    var _units=units, _nodes=nodes, _props=props, _visible=fog_visible;
    var _cx=camera_x, _cy=camera_y, _zoom=map_zoom, _over=sim_over;
    var _city_world=iso_to_world(city.gx,city.gy);
    camera_x=_city_world[0]; camera_y=_city_world[1]; map_zoom=0.6; sim_over=false;
    units=[]; nodes=[]; props=[];
    fog_visible=array_create(map_size*map_size,true);
    var _enemy={team:1,hp:65,gx:city.gx+20,gy:city.gy-20}; units=[_enemy];
    var _m=gui_offscreen_threat();
    unit_test_assert(!is_undefined(_m) && _m.dx>0 && abs(_m.x-(lab_width-28))<0.001,
        "Threat: discovered enemy to the right gets an arrow inside the viewport");
    fog_visible=array_create(map_size*map_size,false);
    unit_test_assert(is_undefined(gui_offscreen_threat()),"Threat: fog-hidden enemies never leak into the indicator");
    fog_visible=array_create(map_size*map_size,true); _enemy.hp=0;
    unit_test_assert(is_undefined(gui_offscreen_threat()),"Threat: dead enemies do not leave stale arrows");
    _enemy.hp=65; _enemy.gx=city.gx; _enemy.gy=city.gy;
    unit_test_assert(is_undefined(gui_offscreen_threat()),"Threat: panning a contact onto the screen removes its arrow");
    units=[]; nodes=[{gx:city.gx+20,gy:city.gy-20,active:true}];
    unit_test_assert(!is_undefined(gui_offscreen_threat()),"Threat: detected active nodes can supply an offscreen arrow");
    nodes[0].active=false;
    unit_test_assert(is_undefined(gui_offscreen_threat()),"Threat: cleansed nodes no longer supply arrows");
    nodes=[]; props=[{spr:spr_sentrion_work,hp:100,alarm:true,gx:city.gx,gy:city.gy,
        threat_x:city.gx+20,threat_y:city.gy-20}];
    unit_test_assert(!is_undefined(gui_offscreen_threat()),"Threat: watchtower arrow points at its corruption contact rather than the tower");
    props[0].hp=0;
    unit_test_assert(is_undefined(gui_offscreen_threat()),"Threat: destroyed watchtowers cannot supply alerts");
    var _geometry=true;
    for (var _i=0; _i<8; ++_i) {
        var _angle=_i*45, _sx=720+lengthdir_x(3000,_angle), _sy=354.5+lengthdir_y(3000,_angle);
        var _w=gui_to_world(_sx,_sy);
        var _gx=(_w[0]/(cell_width*0.5)+_w[1]/(cell_height*0.5))*0.5;
        var _gy=(_w[1]/(cell_height*0.5)-_w[0]/(cell_width*0.5))*0.5;
        _m=gui_threat_marker(_gx,_gy);
        if (is_undefined(_m)) { _geometry=false; continue; }
        if (_m.x<27.99 || _m.x>lab_width-27.99 || _m.y<gui_top+27.99 || _m.y>gui_bottom-27.99
            || abs((_m.x-720)*(_sy-354.5)-(_m.y-354.5)*(_sx-720))>0.01) _geometry=false;
    }
    unit_test_assert(_geometry,"Threat: eight directions intersect the viewport safely and point along the original bearing");
    sim_over=true;
    unit_test_assert(is_undefined(gui_offscreen_threat()),"Threat: result screen suppresses threat indicators");
    units=_units; nodes=_nodes; props=_props; fog_visible=_visible;
    camera_x=_cx; camera_y=_cy; map_zoom=_zoom; sim_over=_over;
};
gui_tests = function() {
    gui_navigation_tests();
    var _gold=gold, _cx=camera_x, _cy=camera_y, _zoom=map_zoom;
    var _units=[], _props=[];
    array_copy(_units,0,units,0,array_length(units)); array_copy(_props,0,props,0,array_length(props));
    var _oldlimit=unit_limit, _oldid=next_unit_id;
    // Isolated selection fixtures include offscreen allies, a corpse and an enemy.
    units=[
        {kind:0,team:0,hp:100,gx:5,gy:5,selected:false},
        {kind:1,team:0,hp:100,gx:8,gy:8,selected:false},
        {kind:0,team:0,hp:100,gx:100,gy:100,selected:false},
        {kind:0,team:0,hp:0,gx:5,gy:5,selected:false},
        {kind:0,team:1,hp:100,gx:100,gy:100,selected:false}
    ];
    var _test_world=iso_to_world(5,5);
    camera_x=_test_world[0]; camera_y=_test_world[1];
    for (var _z=0; _z<3; ++_z) {
        map_zoom=[0.3,1,2][_z];
        var _r=unit_select_bounds(units[0]);
        unit_test_assert(unit_pick(720,_r[1]+2)==units[0],"Selection: head hit works at zoom "+string(map_zoom));
        unit_test_assert(unit_pick(_r[0]-8,(_r[1]+_r[3])*0.5)==units[0],"Selection: near miss snaps to unit at zoom "+string(map_zoom));
        unit_test_assert(is_undefined(unit_pick(_r[0]-30,_r[1]-30)),"Selection: empty ground stays empty");
    }
    unit_select_box(715,_r[1]+1,725,_r[1]+6);
    unit_test_assert(units[0].selected && !units[3].selected,"Selection: box touching head selects living unit without feet");
    gui_prop=0; gui_menu=1; gui_place=2; dragging=true; gui_inspected=units[1];
    gui_select_kind(0);
    unit_test_assert(units[0].selected && units[2].selected && !units[1].selected && !units[3].selected && !units[4].selected,"Selection: Ecclesian bar selects all living allies including offscreen");
    unit_test_assert(gui_prop==-1 && gui_menu==-1 && gui_place==-1 && !dragging && is_undefined(gui_inspected),"Selection: army bar clears stale inspection and placement");
    unit_test_assert(!gui_selection_mixed(),"Selection: same type group retains portrait");
    units[1].selected=true;
    unit_test_assert(gui_selection_mixed(),"Selection: mixed army hides portrait");
    gui_select_kind(1);
    unit_test_assert(!units[0].selected && units[1].selected && !units[2].selected && !gui_selection_mixed(),"Selection: Militia bar replaces previous group");
    units[1].hp=0; gui_select_kind(1);
    unit_test_assert(is_undefined(gui_selection()),"Selection: empty army group clears selection");
    units=_units;
    var _city=gui_get_prop(0), _outpost=gui_get_prop(1);
    var _w=iso_to_world(_city.gx,_city.gy);
    camera_x=_w[0]; camera_y=_w[1]; map_zoom=1;
    gui_prop=-1;
    unit_test_assert(gui_spawn_source()==_city,"GUI: visible city is the default recruitment source");
    gui_prop=1;
    unit_test_assert(gui_spawn_source()==_outpost,"GUI: selected garrison takes precedence over visible city");
    camera_x=1000000; camera_y=1000000;
    gui_prop=-1;
    unit_test_assert(gui_spawn_source()==_city,"GUI: no city or garrison visible falls back to city");
    gui_prop=1;
    unit_test_assert(gui_spawn_source()==_outpost,"GUI: selected offscreen garrison remains source");
    _w=iso_to_world(_outpost.gx,_outpost.gy);
    camera_x=_w[0]; camera_y=_w[1]; map_zoom=4; gui_prop=-1;
    unit_test_assert(!gui_visible(_city) && gui_visible(_outpost) && is_undefined(gui_spawn_source()),"GUI: visible unselected garrison blocks city fallback");
    gui_prop=0;
    unit_test_assert(gui_spawn_source()==_city,"GUI: selected city overrides camera visibility");
    gold=250;
    var _count=array_length(units);
    unit_test_assert(gui_recruit(0) && array_length(units)==_count+1 && gold==215,"GUI: recruitment creates a unit and charges exactly once");
    gold=0; _count=array_length(units);
    unit_test_assert(!gui_recruit(1) && array_length(units)==_count,"GUI: insufficient gold cannot create units");
    gold=250; unit_limit=0;
    unit_test_assert(!gui_recruit(1) && gold==250,"GUI: failed spawn does not charge gold");
    unit_limit=_oldlimit;
    unit_test_assert(!gui_build(2,city.gx,city.gy) && gold==250,"GUI: occupied building site cannot spend gold");
    var _built=false;
    for (var _gy=1; _gy<map_size-3 && !_built; ++_gy) for (var _gx=1; _gx<map_size-3 && !_built; ++_gx) {
        if (!gui_can_build(_gx+0.5,_gy+0.5)) continue;
        _built=gui_build(2,_gx+0.5,_gy+0.5);
        unit_test_assert(_built && gold==230 && !nav_open(_gx+0.5,_gy+0.5),"GUI: construction charges 20 gold and rebuilds navigation walls");
    }
    unit_test_assert(_built,"GUI: a valid construction site exists");
    unit_test_assert(gui_heading_font!=-1 && gui_body_font!=-1 && gui_small_font!=-1,"GUI: both bundled TTF families load");
    show_debug_message("GUI_FONTS: "+font_get_fontname(gui_heading_font)+" | "+font_get_fontname(gui_body_font));
    unit_test_assert(sprite_get_number(spr_gui_portrait_ecclesian)==100 && sprite_get_number(spr_gui_portrait_militia)==26 && sprite_get_number(spr_gui_portrait_scourge)==41,"GUI: all Mixamo portrait frames imported");
    gold=_gold; camera_x=_cx; camera_y=_cy; map_zoom=_zoom;
    units=_units; props=_props; next_unit_id=_oldid; gui_prop=0; gui_menu=-1;
    gui_notice_time=0; nav_rebuild();
    for (var _i=0; _i<array_length(units); ++_i) { units[_i].field=undefined; units[_i].selected=false; units[_i].next_cell=-1; }
    show_debug_message(unit_test_failed ? "GUI_TEST_FAILED" : "GUI_TEST_COMPLETE");
    if (unit_test_failed) throw "GUI_TEST_FAILED";
};

sim_finish=function(_message,_victory=false) {
    sim_over=true; sim_won=_victory; sim_message=_message;
    av_clear_world();
    gui_notice_time=0; gui_place=-1; gui_menu=-1; dragging=false;
};
// Block 5 tuning: logical map cells and simulation seconds.
balance={unit_sight:3,city_sight:4.5,outpost_sight:3.5,sentrion_sight:6,
    growth_interval:4,growth_grace:20,spawn_interval:18,ally_limit:map_presets[menu_map_preset].ally_limit,enemy_limit:40,raider_limit:8,
    first_spawn_chance:0.03,second_spawn_chance:0.08,
    node_interval:45,node_limit:18,node_mature_cells:25,node_branch_chance:0.06,remnant_chance:0.20};
enemy_spawn_chance=function() {
    if (remnant_count<=0) return 0;
    if (remnant_count==1) return balance.first_spawn_chance;
    if (remnant_count==2) return balance.second_spawn_chance;
    return 1;
};
enemy_assign_raiders=function() {
    var _count=0, _aggressive=sim_testing || remnant_count>=3;
    for (var _i=0; _i<array_length(units); ++_i) {
        var _u=units[_i];
        if (_u.team!=1 || _u.hp<=0) continue;
        if (!_aggressive) _u.city_raider=false;
        if (_u.city_raider) _count++;
    }
    if (!_aggressive) return;
    for (var _i=0; _i<array_length(units) && _count<balance.raider_limit; ++_i) {
        var _u=units[_i];
        if (_u.team!=1 || _u.hp<=0 || _u.city_raider) continue;
        _u.city_raider=true; _u.think=0; _count++;
    }
};
scourge_awake=false; node_clock=0;
fog_visible=array_create(map_size*map_size,false); fog_cells=[];
fog_seen=array_create(map_size*map_size,false);
fog_terrain=array_create(map_size*map_size,0);
corruption_owner=array_create(map_size*map_size,-1);
growth_clock=0; alert_text=""; alert_until=0; alert_count=0;
fog_index=function(_gx,_gy) {
    var _x=round(_gx), _y=round(_gy);
    if (_x<0 || _y<0 || _x>=map_size || _y>=map_size) return -1;
    return _y*map_size+_x;
};
fog_can_see=function(_gx,_gy) {
    var _i=fog_index(_gx,_gy);
    return _i>=0 && fog_visible[_i];
};
fog_reveal=function(_gx,_gy,_radius) {
    for (var _y=max(0,ceil(_gy-_radius)); _y<=min(map_size-1,floor(_gy+_radius)); ++_y)
    for (var _x=max(0,ceil(_gx-_radius)); _x<=min(map_size-1,floor(_gx+_radius)); ++_x)
        if (sqr(_x-_gx)+sqr(_y-_gy)<=sqr(_radius)) {
            var _idx=_y*map_size+_x;
            if (!fog_visible[_idx]) { fog_visible[_idx]=true; array_push(fog_cells,_idx); }
        }
};
fog_prop_known=function(_p) {
    if (variable_struct_exists(_p,"city") || _p.spr==spr_outpost || _p.spr==spr_sentrion_work) return true;
    return variable_struct_exists(_p,"fog_known") && _p.fog_known;
};
fog_update=function() {
    for (var _i=0; _i<array_length(fog_cells); ++_i) fog_visible[fog_cells[_i]]=false;
    fog_cells=[];
    if (city.hp>0) fog_reveal(city.gx,city.gy,balance.city_sight);
    for (var _i=0; _i<array_length(props); ++_i) {
        var _p=props[_i];
        if (variable_struct_exists(_p,"hp") && _p.hp<=0) continue;
        if (_p.spr==spr_sentrion_work) fog_reveal(_p.gx,_p.gy,balance.sentrion_sight);
        if (_p.spr==spr_outpost) fog_reveal(_p.gx,_p.gy,balance.outpost_sight);
    }
    for (var _i=0; _i<array_length(units); ++_i) {
        var _u=units[_i];
        if (_u.team==0 && _u.hp>0) fog_reveal(_u.gx,_u.gy,balance.unit_sight);
    }
    for (var _i=0; _i<array_length(fog_cells); ++_i) {
        var _idx=fog_cells[_i];
        fog_seen[_idx]=true; fog_terrain[_idx]=terrain[_idx];
    }
    for (var _i=0; _i<array_length(props); ++_i) {
        var _p=props[_i];
        if (!fog_can_see(_p.gx,_p.gy)) continue;
        _p.fog_known=true;
        if (variable_struct_exists(_p,"node")) {
            _p.fog_active=_p.node.active; _p.fog_progress=_p.node.progress;
        }
    }
    if (!is_undefined(gui_inspected) && gui_inspected.team==1 && !fog_can_see(gui_inspected.gx,gui_inspected.gy)) gui_inspected=undefined;
    var _selected=gui_get_prop(gui_prop);
    if (!is_undefined(_selected) && variable_struct_exists(_selected,"node") && !fog_can_see(_selected.gx,_selected.gy)) gui_prop=-1;
};
sentrion_tick=function() {
    for (var _i=0; _i<array_length(props); ++_i) {
        var _p=props[_i];
        if (_p.spr!=spr_sentrion_work || _p.hp<=0) continue;
        var _threat=false, _contacts=[], _new_contact=false, _threat_x=_p.gx, _threat_y=_p.gy;
        for (var _j=0; _j<array_length(nodes); ++_j) {
            var _n=nodes[_j];
            if (_n.active && point_distance(_p.gx,_p.gy,_n.gx,_n.gy)<=balance.sentrion_sight) {
                _threat=true; _threat_x=_n.gx; _threat_y=_n.gy; array_push(_contacts,"node"+string(_j));
            }
        }
        for (var _j=0; _j<array_length(units); ++_j) {
            var _u=units[_j];
            if (_u.team==1 && _u.hp>0 && point_distance(_p.gx,_p.gy,_u.gx,_u.gy)<=balance.sentrion_sight) {
                _threat=true; _threat_x=_u.gx; _threat_y=_u.gy; array_push(_contacts,"unit"+string(_u.id));
            }
        }
        var _r=balance.sentrion_sight;
        for (var _y=max(0,ceil(_p.gy-_r)); _y<=min(map_size-1,floor(_p.gy+_r)) && !_threat; ++_y)
        for (var _x=max(0,ceil(_p.gx-_r)); _x<=min(map_size-1,floor(_p.gx+_r)) && !_threat; ++_x)
            if (terrain[_y*map_size+_x]==2 && sqr(_x-_p.gx)+sqr(_y-_p.gy)<=sqr(_r)) {
                _threat=true; _threat_x=_x; _threat_y=_y;
            }
        var _previous=variable_struct_exists(_p,"contacts") ? _p.contacts : [];
        for (var _j=0; _j<array_length(_contacts); ++_j) {
            var _found=false;
            for (var _k=0; _k<array_length(_previous); ++_k) if (_previous[_k]==_contacts[_j]) _found=true;
            if (!_found) _new_contact=true;
        }
        _p.contacts=_contacts;
        var _was=variable_struct_exists(_p,"alarm") && _p.alarm;
        _p.alarm=_threat;
        _p.threat_x=_threat_x; _p.threat_y=_threat_y;
        if (_threat && (!_was || (_new_contact && (!variable_struct_exists(_p,"last_signal") || sim_time-_p.last_signal>=8)))) {
            _p.last_signal=sim_time;
            alert_text="Sentrion: threat near "+string(_p.gx)+", "+string(_p.gy)+"!";
            alert_until=sim_time+8; alert_count++;
            if (av_live()) av_sound(snd_alert,0.75);
        }
    }
};
node_navigation_refresh=function(_node) {
    nav_rebuild(_node.gx,_node.gy,_node.span);
    for (var _i=0; _i<array_length(units); ++_i) {
        var _u=units[_i]; _u.field=undefined; _u.next_cell=-1;
        _u.think=(_u.id mod 12)/60;
    }
};
node_spawn=function(_gx,_gy) {
    // A new 2x2 node must have a walkable approach and spare ground around it.
    if (point_distance(_gx,_gy,city.gx,city.gy)<10) return false;
    // GML round uses ties-to-even: rounding each half-anchor offset separately
    // aliases neighbouring samples. Resolve one integer anchor, then offset it.
    var _cx=floor(_gx+0.5), _cy=floor(_gy+0.5);
    for (var _dy=-2; _dy<=2; ++_dy) for (var _dx=-2; _dx<=2; ++_dx) {
        var _idx=fog_index(_cx+_dx,_cy+_dy);
        if (_idx<0 || terrain[_idx]!=0 || !nav_open(_cx+_dx,_cy+_dy)) return false;
    }
    for (var _i=0; _i<array_length(nodes); ++_i) {
        var _n=nodes[_i];
        if (_n.active && point_distance(_gx,_gy,_n.gx,_n.gy)<7) return false;
    }
    for (var _i=0; _i<array_length(props); ++_i) {
        var _p=props[_i];
        if (abs(_gx-_p.gx)<_p.span*0.5+3 && abs(_gy-_p.gy)<_p.span*0.5+3) return false;
    }
    for (var _i=0; _i<array_length(units); ++_i)
        if (units[_i].hp>0 && point_distance(_gx,_gy,units[_i].gx,units[_i].gy)<4) return false;
    var _owner=array_length(nodes), _next=0;
    for (var _i=0; _i<array_length(props); ++_i) _next=max(_next,props[_i].id+1);
    var _n={gx:_gx,gy:_gy,span:2,progress:0,needed:48,active:true,
        spawn_in:balance.spawn_interval,spawned:0,special:true,relic:undefined,drop_rolled:false,owned_cells:9};
    array_push(nodes,_n);
    var _spr=[spr_infestation_node_01,spr_infestation_node_02,spr_infestation_node_03][_owner mod 3];
    array_push(props,{id:_next,label:"Infestation Node",spr:_spr,gx:_gx,gy:_gy,span:2,
        fps:4,unit:-1,offset_x:0,offset_y:0,scale:1,node:_n});
    for (var _dy=-1; _dy<=1; ++_dy) for (var _dx=-1; _dx<=1; ++_dx) {
        var _idx=fog_index(_cx+_dx,_cy+_dy);
        terrain[_idx]=2; corruption_owner[_idx]=_owner;
    }
    node_navigation_refresh(_n);
    av_sound(snd_infestation_spawn,0.75,_gx,_gy);
    return true;
};
node_is_mature=function(_n) {
    // Nine starting cells plus sixteen successful growth steps: about 64 seconds
    // of growth. Cleansing progress is a separate mechanic, not node maturity.
    return _n.active && variable_struct_exists(_n,"owned_cells") && _n.owned_cells>=balance.node_mature_cells;
};
node_branch=function() {
    if (ritual.active || sim_over || city.hp<=0) return false;
    var _active=0;
    for (var _i=0; _i<array_length(nodes); ++_i) if (nodes[_i].active) _active++;
    if (_active>=balance.node_limit) return false;
    var _count=array_length(nodes);
    for (var _i=0; _i<_count; ++_i) {
        var _n=nodes[_i];
        if (!node_is_mature(_n) || random(1)>=balance.node_branch_chance) continue;
        // Bounded local attempts, at most one extra node per 45-second pulse.
        // node_spawn retains ground, spacing, City and occupied-site checks.
        var _angle=random(360);
        for (var _attempt=0; _attempt<12; ++_attempt) {
            var _distance=random_range(8,11), _direction=_angle+_attempt*30;
            var _gx=floor(_n.gx+lengthdir_x(_distance,_direction))+0.5;
            var _gy=floor(_n.gy+lengthdir_y(_distance,_direction))+0.5;
            if (node_spawn(_gx,_gy)) return true;
        }
    }
    return false;
};
corruption_tick=function(_dt) {
    if (ritual.active) return;
    node_clock+=_dt;
    if (node_clock<balance.node_interval) return;
    node_clock-=balance.node_interval;
    var _active=0;
    for (var _i=0; _i<array_length(nodes); ++_i) if (nodes[_i].active) _active++;
    if (_active>=balance.node_limit) return;
    // Expand the search ring over time, keeping early discoveries near the City.
    var _radius=min(map_size*0.45,14+sim_time/30);
    for (var _attempt=0; _attempt<80; ++_attempt) {
        var _angle=random(360), _distance=random_range(11,_radius);
        var _gx=floor(city.gx+lengthdir_x(_distance,_angle))+0.5;
        var _gy=floor(city.gy+lengthdir_y(_distance,_angle))+0.5;
        if (node_spawn(_gx,_gy)) break;
    }
    node_branch();
};
node_cleanse=function(_n) {
    if (!_n.active) return false;
    _n.active=false;
    if (sim_testing) return true;
    gold+=40; corruption_clear(_n);
    // Remove the physical node and its navigation footprint; retain its stable
    // owner index only for historical territory references and ritual origins.
    for (var _i=array_length(props)-1; _i>=0; --_i) {
        var _p=props[_i];
        if (variable_struct_exists(_p,"node") && _p.node==_n) {
            if (gui_prop==_p.id) gui_prop=-1;
            array_delete(props,_i,1);
        }
    }
    node_navigation_refresh(_n);
    var _drop=remnant_spawn(_n,round(_n.gx),round(_n.gy));
    gui_message("Node cleansed: +40 gold."+(_drop ? " A Remnant remains on the ground." : ""));
    return true;
};
corruption_grow=function() {
    // Compute occupied bounds in one map pass, rather than one map pass per node.
    var _bounds=[];
    for (var _nidx=0; _nidx<array_length(nodes); ++_nidx)
        array_push(_bounds,{x0:map_size,y0:map_size,x1:-1,y1:-1,count:0});
    for (var _i=0; _i<array_length(terrain); ++_i) {
        var _owner=corruption_owner[_i];
        if (_owner<0 || _owner>=array_length(nodes)) continue;
        var _b=_bounds[_owner], _x=_i mod map_size, _y=_i div map_size;
        _b.x0=min(_b.x0,_x); _b.x1=max(_b.x1,_x);
        _b.y0=min(_b.y0,_y); _b.y1=max(_b.y1,_y);
        _b.count++;
    }
    // Each node owns its cells. Cleansing removes only that node's infestation.
    for (var _nidx=0; _nidx<array_length(nodes); ++_nidx) {
        var _n=nodes[_nidx]; if (!_n.active) continue;
        var _best=-1, _distance=1000000000;
        var _b=_bounds[_nidx]; _n.owned_cells=_b.count;
        for (var _y=max(0,_b.y0-1); _y<=min(map_size-1,_b.y1+1); ++_y)
        for (var _x=max(0,_b.x0-1); _x<=min(map_size-1,_b.x1+1); ++_x) {
            var _i=_y*map_size+_x;
            if (terrain[_i]!=0) continue;
            var _adjacent=false;
            if (_x>0 && corruption_owner[_i-1]==_nidx) _adjacent=true;
            if (_x<map_size-1 && corruption_owner[_i+1]==_nidx) _adjacent=true;
            if (_y>0 && corruption_owner[_i-map_size]==_nidx) _adjacent=true;
            if (_y<map_size-1 && corruption_owner[_i+map_size]==_nidx) _adjacent=true;
            if (!_adjacent) continue;
            var _d=sqr(_x-_n.gx)+sqr(_y-_n.gy);
            if (_d<_distance) { _distance=_d; _best=_i; }
        }
        if (_best>=0) { terrain[_best]=2; corruption_owner[_best]=_nidx; _n.owned_cells++; }
    }
};
corruption_clear=function(_node) {
    var _owner=-1;
    for (var _i=0; _i<array_length(nodes); ++_i) if (nodes[_i]==_node) _owner=_i;
    if (_owner<0) return;
    for (var _i=0; _i<array_length(terrain); ++_i) if (corruption_owner[_i]==_owner) {
        terrain[_i]=0; corruption_owner[_i]=-1;
    }
};
corruption_city_reached=function() {
    var _half=city.span*0.5;
    for (var _y=max(0,ceil(city.gy-_half)); _y<=min(map_size-1,floor(city.gy+_half)); ++_y)
    for (var _x=max(0,ceil(city.gx-_half)); _x<=min(map_size-1,floor(city.gx+_half)); ++_x)
        if (terrain[_y*map_size+_x]==2) return true;
    return false;
};
// Seed small patches; no terrain metadata or navigation mutation is needed.
for (var _i=0; _i<array_length(terrain); ++_i) if (terrain[_i]==2) terrain[_i]=0;
for (var _j=0; _j<array_length(nodes); ++_j) {
    nodes[_j].spawn_in=20+_j*6;
    for (var _y=0; _y<map_size; ++_y) for (var _x=0; _x<map_size; ++_x)
        if (point_distance(_x,_y,nodes[_j].gx,nodes[_j].gy)<=1.5) {
            var _i=_y*map_size+_x;
            terrain[_i]=2; corruption_owner[_i]=_j;
        }
}
// Remove the old gallery relic. Production relics are released once per node.
for (var _i=array_length(props)-1; _i>=0; --_i) if (props[_i].spr==spr_remnant) array_delete(props,_i,1);
// Terrain and props are finalised before the initial navigation build.
remnants=[]; remnant_count=0; remnant_required=3;
ritual={active:false,elapsed:0,duration:60,wave:0,spawned:0,pending:0,retry:0};
for (var _i=0; _i<array_length(nodes); ++_i) {
    nodes[_i].special=true; nodes[_i].relic=undefined;
}
remnant_spawn=function(_node,_gx,_gy) {
    if (!_node.special || _node.active || !is_undefined(_node.relic)) return false;
    if (variable_struct_exists(_node,"drop_rolled") && _node.drop_rolled) return false;
    _node.drop_rolled=true;
    if (random(1)>=balance.remnant_chance) return false;
    var _next=0;
    for (var _i=0; _i<array_length(props); ++_i) _next=max(_next,props[_i].id+1);
    var _relic={collected:false,ready_at:sim_time+0.35,gx:_gx,gy:_gy,index:array_length(remnants)};
    _node.relic=_relic; array_push(remnants,_relic);
    var _scale=min(cell_width/(sprite_get_bbox_right(spr_remnant)-sprite_get_bbox_left(spr_remnant)+1),
        cell_height/(sprite_get_bbox_bottom(spr_remnant)-sprite_get_bbox_top(spr_remnant)+1));
    array_push(props,{id:_next,label:"Remnant",spr:spr_remnant,gx:_gx,gy:_gy,span:1,
        fps:4,unit:-1,offset_x:0,offset_y:0,scale:_scale,relic:_relic});
    return true;
};
remnant_tick=function() {
    for (var _i=0; _i<array_length(remnants); ++_i) {
        var _r=remnants[_i];
        if (_r.collected || sim_time<_r.ready_at || !fog_can_see(_r.gx,_r.gy)) continue;
        for (var _j=0; _j<array_length(units); ++_j) {
            var _u=units[_j];
            if (_u.kind!=0 || _u.hp<=0 || point_distance(_u.gx,_u.gy,_r.gx,_r.gy)>0.85
                || !nav_segment(_u.gx,_u.gy,_r.gx,_r.gy)) continue;
            _r.collected=true; remnant_count++;
            if (!scourge_awake) {
                scourge_awake=true;
                for (var _k=0; _k<array_length(nodes); ++_k) nodes[_k].spawn_in=balance.spawn_interval;
            }
            var _p=gui_get_prop(gui_prop);
            if (!is_undefined(_p) && _p.spr==spr_remnant && _p.relic==_r) gui_prop=-1;
            var _warning=". Danger rises: monsters now appear, but rarely.";
            if (remnant_count==2) _warning=". Danger rises again: monsters appear more often.";
            if (remnant_count>=3) _warning=". Monsters are now aggressive and march on the City! Select the City for the ritual.";
            gui_message("Remnant recovered: "+string(remnant_count)+" / 3"+_warning);
            break;
        }
    }
};
ritual_reason=function() {
    if (sim_over || city.hp<=0) return "The match has ended";
    if (ritual.active) return "Ritual in progress";
    if (paused) return "Resume the match first";
    var _p=gui_get_prop(gui_prop);
    if (is_undefined(_p) || !variable_struct_exists(_p,"city") || !is_undefined(gui_selection())) return "Select the City";
    if (remnant_count<remnant_required) return "Requires 3 Remnants ("+string(remnant_count)+" / 3)";
    return "";
};
ritual_start=function() {
    var _reason=ritual_reason();
    if (_reason!="") { gui_message(_reason); return false; }
    ritual.active=true; ritual.elapsed=0;
    av_sound(snd_ritual,0.8);
    gui_message("The final ritual has begun. Defend the City for 60 seconds!");
    return true;
};
ritual_tick=function(_dt) {
    if (!ritual.active || sim_over) return;
    ritual.elapsed=min(ritual.duration,ritual.elapsed+_dt);
    // Three timed surges from the former nodes. Cap-blocked spawns are retried,
    // never lost or allowed to exceed the production population limit.
    if (ritual.wave<3 && ritual.elapsed>=ritual.wave*15) {
        ritual.pending+=4+ritual.wave*2; ritual.wave++;
        gui_message("Final wave "+string(ritual.wave)+" / 3. Defend the City!");
    }
    ritual.retry-=_dt;
    if (ritual.pending>0 && ritual.retry<=0) {
        ritual.retry=0.5;
        var _n=nodes[ritual.spawned mod array_length(nodes)];
        var _u=unit_spawn(2,_n.gx-1.7,_n.gy-1.7);
        if (!is_undefined(_u)) { ritual.pending--; ritual.spawned++; }
    }
    if (ritual.elapsed>=ritual.duration && ritual.pending==0 && ritual.wave==3)
        sim_finish("RITUAL COMPLETE - VICTORY",true);
};
// First patches surround the settlement; subsequent nodes appear during play.
// Initial node sites are reserved by world generation, then seeded after navigation.
// Dedicated block-5 checks exercise production fog, growth, economy and match flow.
block5_test_mode=environment_get_variable("UNGODLY_BLOCK5_TEST")!="";
block5_test_tick=0;
world_test_mode=environment_get_variable("UNGODLY_WORLD_TEST")!="";
world_test_tick=0;
if (player_test_mode || av_test_mode || block5_test_mode || gui_test_mode || world_test_mode || environment_get_variable("UNGODLY_GENERATION_TEST")!="") exception_unhandled_handler(function(_error) {
    show_debug_message("BLOCK5_RUNTIME_ERROR: "+json_stringify(_error)); game_end();
});
block5_tests=function() {
    world_tests();
    ritual.active=false; sim_over=false; balance.node_limit=0;
    // Isolate sight sources to check memory without depending on starting towers.
    units=[]; props=[]; nodes=[]; city={gx:1,gy:1,span:2,hp:0,max_hp:1000};
    terrain=array_create(map_size*map_size,0); fog_seen=array_create(map_size*map_size,false);
    fog_terrain=array_create(map_size*map_size,0); fog_update();
    unit_test_assert(!fog_can_see(10,10) && !fog_seen[fog_index(10,10)],"unexplored cells start hidden");
    var _scout={gx:10,gy:10,team:0,hp:65}; units=[_scout]; fog_update();
    var _cell=fog_index(10,10);
    unit_test_assert(fog_can_see(13,10) && !fog_can_see(14,10),"ordinary unit sight is exactly 3 cells");
    _scout.gx=1; _scout.gy=1; terrain[_cell]=2; fog_update();
    unit_test_assert(fog_seen[_cell] && !fog_visible[_cell] && fog_terrain[_cell]==0,"unseen infestation growth does not change remembered terrain");
    _scout.gx=10; _scout.gy=10; fog_update();
    unit_test_assert(fog_terrain[_cell]==2,"returning scout discovers infestation growth");
    _scout.gx=1; _scout.gy=1; terrain[_cell]=0; fog_update();
    unit_test_assert(fog_terrain[_cell]==2,"unseen cleansing does not leak into terrain memory");
    _scout.gx=10; _scout.gy=10; fog_update();
    unit_test_assert(fog_terrain[_cell]==0,"returning scout refreshes cleansed terrain");
    _scout.hp=0; fog_update();
    unit_test_assert(!fog_can_see(10,10),"dead allies no longer reveal terrain");
    units=[];
    var _tower={id:50,gx:8,gy:8,spr:spr_sentrion_work,hp:250,span:2}; props=[_tower]; fog_update();
    unit_test_assert(fog_can_see(14,8) && !fog_can_see(15,8),"Sentrion reveals 6 cells, twice unit radius");
    var _enemy={id:500,gx:14,gy:8,team:1,hp:90}; units=[_enemy];
    alert_count=0; sentrion_tick(); sentrion_tick();
    unit_test_assert(_tower.alarm && alert_count==1,"Sentrion detects boundary threat once without unchanged-state spam");
    _enemy.gx=15; sentrion_tick();
    unit_test_assert(!_tower.alarm,"Sentrion clears signal after threat leaves");
    _enemy.gx=14; sentrion_tick();
    unit_test_assert(_tower.alarm && alert_count==2,"returning threat signals again");
    _tower.hp=0; fog_update();
    unit_test_assert(!fog_can_see(14,8),"dead watchtower supplies no vision");

    // Growth, ownership and water boundaries.
    units=[]; props=[]; terrain=array_create(map_size*map_size,0);
    corruption_owner=array_create(map_size*map_size,-1);
    nodes=[{gx:10,gy:10,active:true},{gx:15,gy:15,active:true}];
    terrain[fog_index(10,10)]=2; corruption_owner[fog_index(10,10)]=0;
    terrain[fog_index(15,15)]=2; corruption_owner[fog_index(15,15)]=1;
    terrain[fog_index(9,10)]=1;
    corruption_grow();
    var _owned=0;
    for (var _i=0; _i<array_length(terrain); ++_i) if (corruption_owner[_i]>=0) _owned++;
    unit_test_assert(_owned==4 && terrain[fog_index(9,10)]==1,"each active node grows one frontier cell and preserves water");
    nodes[0].active=false; corruption_clear(nodes[0]); corruption_grow();
    _owned=0; var _other=0;
    for (var _i=0; _i<array_length(terrain); ++_i) {
        if (corruption_owner[_i]==0) _owned++;
        if (corruption_owner[_i]==1) _other++;
    }
    unit_test_assert(_owned==0 && _other==3,"cleansed node retracts its own territory and stops growing");

    // Production caps and spending rejection.
    nodes=[]; units=[]; city.hp=1000; sim_over=false; sim_testing=false;
    for (var _i=0; _i<balance.ally_limit; ++_i) unit_spawn(1,8,8);
    var _count=array_length(units);
    unit_test_assert(_count==balance.ally_limit && is_undefined(unit_spawn(0,8,8)),"allied cap enforced across both recruit types");
    for (var _i=0; _i<balance.enemy_limit; ++_i) unit_spawn(2,10,10);
    unit_test_assert(array_length(units)==_count+balance.enemy_limit && is_undefined(unit_spawn(2,10,10)),"enemy cap is independent of allied cap");
    units=[]; props=[{id:0,gx:1,gy:1,span:2,spr:spr_city_state,city:city}]; gui_prop=0;
    unit_limit=0; gold=250;
    unit_test_assert(!gui_recruit(1) && gold==250,"rejected recruitment never spends gold"); unit_limit=400;
    fog_update();
    unit_test_assert(!gui_can_build(15,15),"construction rejects unexplored terrain");
    var _raider=unit_spawn(2,7,4); city.gx=4; city.gy=4; city.span=5; city.hp=1;
    terrain=array_create(map_size*map_size,0); sim_over=false; sim_time=0;
    for (var _i=0; _i<800 && !sim_over; ++_i) sim_tick(0.05);
    unit_test_assert(sim_over && city.hp==0 && sim_message=="CITY DESTROYED","city combat death ends match");
    units=[]; sim_over=false; city.hp=1000;
    terrain[fog_index(6,4)]=2; sim_tick(0.05);
    unit_test_assert(sim_over && city.hp==1000 && sim_message=="INFESTATION REACHED THE CITY","infestation footprint contact ends match independently of city HP");
    // Pickup recovery after a cleanser dies: soldiers cannot claim relics.
    sim_over=false; units=[]; terrain=array_create(map_size*map_size,0);
    remnants=[{gx:8,gy:8,collected:false,ready_at:0,index:0}]; remnant_count=0;
    unit_spawn(1,8,8); fog_update(); remnant_tick();
    unit_test_assert(remnant_count==0,"Militia cannot recover a Remnant");
    var _priest=unit_spawn(0,8,8); _priest.hp=0; fog_update(); remnant_tick();
    unit_test_assert(remnant_count==0,"dead Ecclesian cannot recover a Remnant");
    _priest.hp=65; _priest.gx=8; _priest.gy=8; fog_update(); remnant_tick(); remnant_tick();
    unit_test_assert(remnant_count==1 && remnants[0].collected,"replacement Ecclesian recovers a waiting relic exactly once");
    nodes=[{gx:14,gy:14}];
    ritual={active:true,elapsed:0,duration:60,wave:0,spawned:0,pending:0,retry:0};
    unit_limit=0; ritual_tick(0.05);
    unit_test_assert(ritual.pending==4 && ritual.spawned==0,"blocked final spawns remain queued");
    unit_limit=400; ritual_tick(0.5);
    unit_test_assert(ritual.pending==3 && ritual.spawned==1,"final spawn queue resumes when space is available");
    // Defeat must beat ritual completion in the same simulation step.
    units=[]; nodes=[]; city.hp=0; sim_over=false;
    ritual={active:true,elapsed:59.99,duration:60,wave:3,spawned:18,pending:0,retry:0};
    sim_tick(0.05);
    unit_test_assert(sim_message=="CITY DESTROYED" && ritual.elapsed<60,"City defeat takes priority over ritual completion");
    city.hp=1000; sim_over=false; ritual.elapsed=60; ritual.pending=1;
    terrain[fog_index(6,4)]=2; sim_tick(0.05);
    unit_test_assert(sim_over && !sim_won && city.hp==1000,"infestation defeat remains defeat even at 100 percent ritual with queued spawns");
    show_debug_message(unit_test_failed ? "BLOCK5_TEST_FAILED" : "BLOCK5_TEST_COMPLETE");
};

// Production-map checks for the dynamic world progression (no reduced map).
world_tests=function() {
    paused=false;
    unit_test_assert(map_size==64 && array_length(terrain)==4096,"World: map area is approximately halved");
    unit_test_assert(city.gx==31.5 && city.gy==31.5,"World: City is at the map centre");
    worldgen_tests();
    unit_test_assert(array_length(nodes)>=2,"World: initial nodes have valid sites");
    var _enemy_count=0;
    for (var _i=0; _i<array_length(units); ++_i) if (units[_i].team==1) _enemy_count++;
    unit_test_assert(_enemy_count==0 && !scourge_awake,"World: no starting enemies");
    var _initial=array_length(nodes);
    for (var _i=0; _i<1300; ++_i) sim_tick(0.05);
    unit_test_assert(array_length(nodes)>_initial,"World: a new node appears during simulation");
    _enemy_count=0;
    for (var _i=0; _i<array_length(units); ++_i) if (units[_i].team==1) _enemy_count++;
    unit_test_assert(_enemy_count==0,"World: timed nodes cannot spawn enemies before pickup");
    unit_test_assert(!node_spawn(city.gx,city.gy),"World: nodes cannot appear on the City");
    var _n=nodes[0], _owner_cell=-1, _owned_before=0;
    for (var _i=0; _i<array_length(terrain); ++_i) if (corruption_owner[_i]==0) _owned_before++;
    corruption_grow();
    var _owned_after=0;
    for (var _i=0; _i<array_length(terrain); ++_i) if (corruption_owner[_i]==0) _owned_after++;
    unit_test_assert(_owned_after==_owned_before+1,"World: infestation spreads from its node");
    balance.remnant_chance=0;
    var _gold=gold;
    node_cleanse(_n);
    unit_test_assert(!_n.active && gold==_gold+40 && array_length(remnants)==0,"World: a common cleanse drops no Remnant");
    var _found=false;
    for (var _i=0; _i<array_length(props); ++_i)
        if (variable_struct_exists(props[_i],"node") && props[_i].node==_n) _found=true;
    unit_test_assert(!_found && nav_open(_n.gx,_n.gy),"World: cleansed node and collision footprint disappear");
    var _owned=0;
    for (var _i=0; _i<array_length(terrain); ++_i) if (corruption_owner[_i]==0) _owned++;
    unit_test_assert(_owned==0 && !node_cleanse(_n) && gold==_gold+40,"World: cleansing clears owned ground and cannot reward twice");
    unit_test_assert(!remnant_spawn(_n,_n.gx,_n.gy),"World: failed drop cannot be rolled again");
    balance.remnant_chance=1;
    _n=nodes[1];
    node_cleanse(_n);
    unit_test_assert(array_length(remnants)==1 && remnant_count==0 && !scourge_awake,"World: dropped item alone does not awaken enemies");
    var _r=remnants[0], _p=undefined;
    for (var _i=0; _i<array_length(props); ++_i) if (props[_i].spr==spr_remnant) _p=props[_i];
    unit_test_assert(!is_undefined(_p) && _p.span==1 && _p.scale<1,"World: ground Remnant occupies one cell and is scaled down");
    var _collector=unit_spawn(0,_r.gx+2,_r.gy);
    sim_time+=1; fog_update(); remnant_tick();
    unit_test_assert(remnant_count==0,"World: seeing a Remnant at a distance does not collect it");
    _collector.hp=0; _collector.gx=_r.gx; _collector.gy=_r.gy; fog_update(); remnant_tick();
    unit_test_assert(remnant_count==0,"World: a dead collector cannot pick up the item");
    _collector.hp=65; _collector.gx=_r.gx+2; _collector.gy=_r.gy;
    unit_command(_collector,1,undefined,_r.gx,_r.gy);
    for (var _i=0; _i<500 && remnant_count==0; ++_i) sim_tick(0.05);
    unit_test_assert(remnant_count==1 && _r.collected && scourge_awake,"World: approaching and collecting the first Remnant awakens enemies");
    remnant_tick();
    unit_test_assert(remnant_count==1 && !remnant_spawn(_n,_r.gx,_r.gy),"World: drop and pickup cannot duplicate");
    var _source=undefined;
    for (var _i=0; _i<array_length(nodes); ++_i) if (nodes[_i].active) { _source=nodes[_i]; break; }
    _source.spawn_in=0;
    balance.first_spawn_chance=1; // Force the success branch; chance tuning is checked below.
    sim_tick(0.05);
    balance.first_spawn_chance=0.03;
    unit_test_assert(_source.spawned==1,"World: active infestation starts spawning enemies after pickup");
    balance.remnant_chance=0.20;
    // Existing final ritual remains available after three recovered relics.
    remnant_count=3; gui_prop=0;
    for (var _i=0; _i<array_length(units); ++_i) units[_i].selected=false;
    gui_inspected=undefined;
    unit_test_assert(ritual_start(),"World: three Remnants still unlock the City ritual");
    ritual_tick(0.05);
    unit_test_assert(ritual.wave==1 && ritual.spawned==1,"World: ritual can use historical node origins");
    balance_tests();
    show_debug_message(unit_test_failed ? "BLOCK5_TEST_FAILED" : "WORLD_TEST_COMPLETE");
};

balance_tests=function() {
    world_rules_tests();
    var _saved_units=units, _saved_count=remnant_count;
    units=[];
    var _ally=unit_spawn(1,8,8), _priest=unit_spawn(0,9,8);
    var _guard=unit_spawn(2,15,15);
    unit_test_assert(_ally.pace==2.1 && _priest.pace==2.1 && _guard.pace==0.8,"Balance: allied speed doubled, monster speed unchanged");
    remnant_count=0;
    unit_test_assert(enemy_spawn_chance()==0,"Balance: no monsters before first pickup");
    remnant_count=1; enemy_assign_raiders(); unit_buckets(); unit_think(_guard);
    unit_test_assert(enemy_spawn_chance()==0.03 && !_guard.city_raider && is_undefined(_guard.field),"Balance: first pickup has rare spawns and idle guards");
    _ally.gx=_guard.gx+0.4; _ally.gy=_guard.gy;
    unit_buckets(); unit_think(_guard);
    unit_test_assert(_guard.target==_ally,"Balance: idle monster detects nearby allies");
    remnant_count=2;
    unit_test_assert(enemy_spawn_chance()==0.08,"Balance: second pickup raises chance slightly");
    units=[];
    for (var _i=0; _i<40; ++_i) unit_spawn(2,15,15);
    unit_test_assert(array_length(units)==40 && is_undefined(unit_spawn(2,15,15)),"Balance: production enemy cap is exactly 40");
    enemy_assign_raiders();
    var _count=0;
    for (var _i=0; _i<array_length(units); ++_i) if (units[_i].city_raider) _count++;
    unit_test_assert(_count==0,"Balance: second pickup still cannot send raiders");
    remnant_count=3; enemy_assign_raiders();
    _count=0;
    for (var _i=0; _i<array_length(units); ++_i) if (units[_i].city_raider) _count++;
    unit_test_assert(_count==8 && enemy_spawn_chance()==1,"Balance: third pickup sends at most eight city raiders");
    units[0].hp=0; enemy_assign_raiders();
    _count=0;
    for (var _i=0; _i<array_length(units); ++_i) if (units[_i].hp>0 && units[_i].city_raider) _count++;
    unit_test_assert(_count==8,"Balance: fallen city raider frees exactly one slot");
    unit_test_assert(balance.node_interval==45 && gui_costs[2]==20,"Balance: a new node pulse every 45 seconds and tower costs 20 gold");
    units=_saved_units; remnant_count=_saved_count; unit_buckets();

    // Exercise actual removal and insertion, including incoming diagonal edges.
    var _saved_props=props, _p=props[0];
    props=[]; array_copy(props,0,_saved_props,0,array_length(_saved_props));
    array_delete(props,0,1);
    for (var _pass=0; _pass<2; ++_pass) {
    if (_pass==1) props=_saved_props;
    var _started=get_timer();
    nav_rebuild(_p.gx,_p.gy,_p.span);
    var _local_us=get_timer()-_started;
    var _solid=[], _edges=[];
    array_copy(_solid,0,nav.solid,0,nav.count); array_copy(_edges,0,nav.edges,0,nav.count);
    _started=get_timer(); nav_rebuild(); var _full_us=get_timer()-_started;
    var _same=true;
    for (var _i=0; _i<nav.count; ++_i) {
        if (_solid[_i]!=nav.solid[_i] || array_length(_edges[_i])!=array_length(nav.edges[_i])) { _same=false; break; }
        for (var _j=0; _j<array_length(_edges[_i]); ++_j)
            if (_edges[_i][_j]!=nav.edges[_i][_j]) _same=false;
    }
    unit_test_assert(_same,"Performance: local obstacle removal/insertion matches full navigation graph, pass "+string(_pass));
    show_debug_message("NAV_REBUILD_BENCHMARK: local_us="+string(_local_us)+", full_us="+string(_full_us));
    }
};

// World creation is a cooperative job. Each Step returns to the engine after
// at most a few milliseconds, including both navigation build passes.
app_state="menu";
menu_start_rect=[520,480,400,58]; menu_controls_rect=[520,548,400,44]; menu_quit_rect=[520,604,400,44];
pause_menu=false; controls_open=false; controls_was_paused=false;
player_controls=[
    ["Left click","Select a unit or inspect an object"],
    ["Left drag / Shift + click","Select a group / add to selection"],
    ["Right click ground","Move selected units"],
    ["Right click enemy","Order Militia to attack"],
    ["Right click Infestation","Send Ecclesians to cleanse the node"],
    ["Right click Ecclesian","Assign selected Militia as an escort"],
    ["Ecclesian near a Remnant","Pick it up automatically"],
    ["E / H","Select all allies / hold position"],
    ["WASD / middle drag / edges","Pan the camera"],
    ["Mouse wheel / Home","Zoom / return to the City"],
    ["Space","Pause or resume"],
    ["Esc","Cancel placement or a panel; open pause menu"],
    ["F1","Show or close these controls"]
];
player_button=function(_rect,_text) {
    gui_artwork(spr_gui_button,_rect[0],_rect[1],_rect[2],_rect[3],gui_hit(_rect) ? c_white : make_colour_rgb(190,190,175));
    gui_button_text(gui_body_font,_text,_rect[0],_rect[1],_rect[2],_rect[3],gui_ink);
};
player_action=function(_action) {
    av_sound(snd_ui_click,0.55);
    dragging=false;
    switch (_action) {
        case "controls":
            if (controls_open) { controls_open=false; paused=controls_was_paused; }
            else { controls_was_paused=paused; controls_open=true; if (app_state=="playing") paused=true; }
            break;
        case "pause":
            if (app_state!="playing" || sim_over) return;
            paused=!paused; pause_menu=paused;
            break;
        case "resume": paused=false; pause_menu=false; break;
        case "menu":
            av_clear_world(); controls_open=false; pause_menu=false; paused=false;
            gui_place=-1; gui_menu=-1; gui_prop=-1; gui_inspected=undefined;
            app_state="menu"; av_set_music(mus_title);
            break;
        case "again":
            global.map_start_pending=true;
            room_restart();
            break;
    }
};
player_input=function() {
    if (keyboard_check_pressed(vk_f1)) { player_action("controls"); return true; }
    if (controls_open) {
        if (keyboard_check_pressed(vk_escape) || (mouse_check_button_pressed(mb_left) && gui_hit([570,710,300,40]))) player_action("controls");
        return true;
    }
    if (app_state!="playing") return false;
    if (sim_over) {
        if (keyboard_check_pressed(vk_enter) || (mouse_check_button_pressed(mb_left) && gui_hit([570,375,300,31]))) player_action("again");
        else if (keyboard_check_pressed(vk_escape) || (mouse_check_button_pressed(mb_left) && gui_hit([570,420,300,31]))) player_action("menu");
        return true;
    }
    if (keyboard_check_pressed(vk_space)) { player_action("pause"); return true; }
    if (keyboard_check_pressed(vk_escape)) {
        if (gui_place>=0 || gui_menu>=0) { gui_place=-1; gui_menu=-1; av_sound(snd_ui_click,0.55); return true; }
        player_action(pause_menu ? "resume" : "pause"); return true;
    }
    if (!pause_menu) return false;
    if (mouse_check_button_pressed(mb_left)) {
        if (gui_hit([550,315,340,42])) player_action("resume");
        else if (gui_hit([550,380,340,42])) player_action("controls");
        else if (gui_hit([550,445,340,42])) player_action("menu");
    }
    return true;
};
player_overlay_draw=function() {
    if (!controls_open && !pause_menu) return;
    draw_set_alpha(0.72); draw_set_colour(c_black);
    draw_rectangle(gui_window_bounds[0],gui_window_bounds[1],gui_window_bounds[2],gui_window_bounds[3],false);
    draw_set_alpha(1); draw_set_colour(make_colour_rgb(20,24,28));
    var _r=controls_open ? [280,140,880,650] : [480,220,480,330];
    draw_rectangle(_r[0],_r[1],_r[0]+_r[2],_r[1]+_r[3],false);
    draw_set_colour(gui_muted); draw_rectangle(_r[0],_r[1],_r[0]+_r[2],_r[1]+_r[3],true);
    draw_set_halign(fa_center);
    gui_text(gui_heading_font,controls_open ? "Controls" : "Paused",720,controls_open ? 165 : 250,gui_ink);
    if (controls_open) {
        draw_set_halign(fa_left);
        for (var _i=0; _i<array_length(player_controls); ++_i) {
            gui_text(gui_body_font,player_controls[_i][0],310,225+_i*29,gui_ink);
            gui_text(gui_body_font,player_controls[_i][1],650,225+_i*29,gui_muted);
        }
        draw_set_halign(fa_center);
        gui_text(gui_body_font,"Hire units and build with the four bottom panels.",720,620,gui_ink);
        gui_text(gui_small_font,"With 3 Remnants, select the City and begin the final ritual.",720,653,gui_muted);
        player_button([570,710,300,40],"Back");
    } else {
        player_button([550,315,340,42],"Resume");
        player_button([550,380,340,42],"Controls");
        player_button([550,445,340,42],"Main menu");
    }
    draw_set_halign(fa_left); draw_set_font(-1); draw_set_colour(c_white); draw_set_alpha(1);
};
menu_map_rect=function(_index) { return [360+250*_index,350,220,92]; };
menu_choose_map=function(_index) {
    if (app_state!="menu") return;
    av_sound(snd_ui_click,0.55);
    menu_map_preset=clamp(_index,0,array_length(map_presets)-1);
    global.map_preset=menu_map_preset;
};
menu_start_game=function() {
    global.map_preset=menu_map_preset;
    if (map_size!=map_presets[menu_map_preset].side) {
        // Recreate all size-dependent arrays and centred settlement together.
        // The next Create enters the staged loader directly, without a menu flash.
        global.map_start_pending=true;
        room_restart();
        return;
    }
    worldgen_begin(world_seed);
    av_sound(snd_ui_click,0.55);
};
if (map_test_mode && !variable_global_exists("map_test_state")) {
    global.map_test_state={index:0,ready_frames:0,menu_frames:0,failed:false};
}
generation_test_mode=environment_get_variable("UNGODLY_GENERATION_TEST")!="";
generation_test_tick=0;
generation_test_cancelled=false;
generation_test_seeds=[17,7103,9127]; generation_test_seed_index=0;
generation_test_ready_frames=0; generation_test_max_us=0; generation_test_steps=0;
generation={stage:0,cursor:0,progress:0,label:"",seed:17,steps:0,max_us:0,started:0,forests:0,mills:0};
world_seed=17;
if (!startup_test_mode && !generation_test_mode && !map_test_mode && !player_test_mode) {
    randomise(); world_seed=irandom(1000000);
}
world_node_sites=[[city.gx+11,city.gy+8],[city.gx-12,city.gy+5],[city.gx+4,city.gy-12]];
// A lattice hash picks one of eight unit gradients. Interpolating their dot
// products with the quintic fade is gradient Perlin noise, not value noise.
worldgen_hash=function(_ix,_iy,_seed) {
    var _h=(_ix*374761393+_iy*668265263+_seed*69069) mod 2147483647;
    _h=(_h*48271) mod 2147483647;
    return abs(_h)/2147483647;
};
worldgen_dot=function(_ix,_iy,_dx,_dy,_seed) {
    var _g=floor(worldgen_hash(_ix,_iy,_seed)*8);
    switch (_g) {
        case 0: return _dx;
        case 1: return -_dx;
        case 2: return _dy;
        case 3: return -_dy;
        case 4: return (_dx+_dy)*0.70710678;
        case 5: return (_dx-_dy)*0.70710678;
        case 6: return (-_dx+_dy)*0.70710678;
        default: return (-_dx-_dy)*0.70710678;
    }
};
worldgen_perlin=function(_px,_py,_seed) {
    var _ix=floor(_px), _iy=floor(_py), _dx=_px-_ix, _dy=_py-_iy;
    var _u=_dx*_dx*_dx*(_dx*(_dx*6-15)+10);
    var _v=_dy*_dy*_dy*(_dy*(_dy*6-15)+10);
    var _a=worldgen_dot(_ix,_iy,_dx,_dy,_seed);
    var _b=worldgen_dot(_ix+1,_iy,_dx-1,_dy,_seed);
    var _c=worldgen_dot(_ix,_iy+1,_dx,_dy-1,_seed);
    var _d=worldgen_dot(_ix+1,_iy+1,_dx-1,_dy-1,_seed);
    return lerp(lerp(_a,_b,_u),lerp(_c,_d,_u),_v);
};
worldgen_reserved=function(_gx,_gy,_padding=0) {
    // A broad dry settlement and three dry, continuous approaches guarantee
    // that a random shore cannot imprison the starting army or its first goals.
    if (point_distance(_gx,_gy,city.gx,city.gy)<10+_padding) return true;
    for (var _i=0; _i<array_length(world_node_sites); ++_i) {
        var _n=world_node_sites[_i];
        if (point_distance(_gx,_gy,_n[0],_n[1])<3.7+_padding) return true;
        var _vx=_n[0]-city.gx, _vy=_n[1]-city.gy;
        var _t=clamp(((_gx-city.gx)*_vx+(_gy-city.gy)*_vy)/(_vx*_vx+_vy*_vy),0,1);
        if (point_distance(_gx,_gy,city.gx+_vx*_t,city.gy+_vy*_t)<1.9+_padding) return true;
    }
    return false;
};
worldgen_water=function(_gx,_gy,_seed) {
    if (worldgen_reserved(_gx,_gy)) return false;
    var _coast=worldgen_perlin(_gx/7.3+0.37,_gy/7.3+0.59,_seed);
    var _detail=worldgen_perlin(_gx/2.9+5.17,_gy/2.9+8.61,_seed+31);
    var _edge=min(_gx,_gy,map_size-1-_gx,map_size-1-_gy);
    // Broken shore patches taper out inside ten tiles. Interior pools need a
    // rare high peak of a separate broad field and remain small and clustered.
    if (_edge<9 && _coast*0.8+_detail*0.2>_edge*0.075-0.24) return true;
    var _pool=worldgen_perlin(_gx/5.7+23.4,_gy/5.7+11.8,_seed+103);
    return _edge>=9 && _pool>0.47 && _detail>0.04;
};
worldgen_begin=function(_seed) {
    av_clear_world();
    app_state="loading"; paused=false; dragging=false;
    generation_test_ready_frames=0;
    generation={stage:0,cursor:0,progress:0,label:"Shaping the land",seed:_seed,
        steps:0,max_us:0,started:get_timer(),forests:0,mills:0};
    units=[]; nodes=[]; next_unit_id=0;
    sim_time=0; sim_over=false; sim_won=false; gold=250; gold_clock=0;
    growth_clock=0; node_clock=0; scourge_awake=false;
    remnants=[]; remnant_count=0;
    ritual={active:false,elapsed:0,duration:60,wave:0,spawned:0,pending:0,retry:0};
    alert_text=""; alert_until=0; alert_count=0;
    gui_prop=-1; gui_menu=-1; gui_place=-1; gui_inspected=undefined;
    gui_notice=""; gui_notice_time=0; city.hp=city.max_hp;
    for (var _i=0; _i<array_length(props); ++_i)
        if (props[_i].id<=2 && variable_struct_exists(props[_i],"max_hp")) props[_i].hp=props[_i].max_hp;
    nav.fields=[];
    fog_visible=array_create(map_size*map_size,false); fog_cells=[];
    fog_seen=array_create(map_size*map_size,false); fog_terrain=array_create(map_size*map_size,0);
    corruption_owner=array_create(map_size*map_size,-1);
    if (!startup_fixture) {
        for (var _i=array_length(props)-1; _i>=0; --_i)
            if (props[_i].id>2) array_delete(props,_i,1);
        terrain=array_create(map_size*map_size,0);
    }
};
worldgen_cancel=function() {
    if (app_state!="loading") return false;
    av_clear_world();
    app_state="menu";
    return true;
};
worldgen_step=function(_budget_us=3000) {
    var _started=get_timer(), _deadline=_started+_budget_us, _work=0;
    generation.steps++;
    // The count cap also prevents a fast machine from doing all stages in one
    // frame, so loading always paints and cancellation is always processed.
    while (get_timer()<_deadline && _work<128 && app_state=="loading") {
        _work++;
        switch (generation.stage) {
            case 0:
                if (startup_fixture) { generation.cursor=map_size*map_size; }
                if (generation.cursor>=map_size*map_size) {
                    generation.stage=1; generation.cursor=0; generation.label="Placing rare landmarks"; break;
                }
                var _i=generation.cursor++, _gx=_i mod map_size, _gy=_i div map_size;
                terrain[_i]=worldgen_water(_gx,_gy,generation.seed) ? 1 : 0;
                var _patch=worldgen_perlin(_gx/5.2+0.23,_gy/5.2+0.43,generation.seed+211);
                terrain_style[_i]=clamp(floor((_patch+0.65)/1.3*array_length(grass_sprites)),0,array_length(grass_sprites)-1);
                generation.progress=0.42*generation.cursor/(map_size*map_size);
                break;
            case 1:
                if (startup_fixture) generation.cursor=map_size*map_size;
                if (generation.cursor>=map_size*map_size) {
                    generation.stage=2; generation.label="Opening paths"; nav_rebuild_begin(false); break;
                }
                var _i=generation.cursor++, _gx=_i mod map_size, _gy=_i div map_size;
                if (_gx<3 || _gy<3 || _gx>map_size-4 || _gy>map_size-4 || _gx mod 3!=0 || _gy mod 3!=0) break;
                if (worldgen_reserved(_gx,_gy,2)) break;
                var _dry=true;
                for (var _dy=-2; _dy<=2; ++_dy) for (var _dx=-2; _dx<=2; ++_dx)
                    if (terrain[(_gy+_dy)*map_size+_gx+_dx]!=0) _dry=false;
                if (!_dry) break;
                var _density=worldgen_perlin(_gx/8.1+1.57,_gy/8.1+4.63,generation.seed+307);
                var _roll=worldgen_hash(_gx,_gy,generation.seed+401), _sprite=-1, _label="";
                if (_density>0.08 && _roll<0.16 && generation.forests<32) {
                    _sprite=forest_sprites[floor(_roll*1000) mod array_length(forest_sprites)]; _label="Forest"; generation.forests++;
                } else if (_roll>0.975 && generation.mills<3) {
                    _sprite=spr_windmill; _label="Windmill"; generation.mills++;
                }
                if (_sprite>=0) array_push(props,{id:1000+_i,label:_label,spr:_sprite,gx:_gx+0.5,gy:_gy+0.5,
                    span:2,fps:0,unit:-1,offset_x:0,offset_y:0,scale:1});
                generation.progress=0.42+0.13*generation.cursor/(map_size*map_size);
                break;
            case 2:
                // Navigation owns its own count and time caps; leave this Step
                // immediately so it never receives the entire budget twice.
                var _ready=nav_rebuild_step(max(1,_deadline-get_timer()));
                generation.progress=0.55+0.37*nav.rebuild_progress;
                if (_ready) { generation.stage=3; generation.cursor=0; generation.label="Seeding the infestation"; }
                generation.max_us=max(generation.max_us,get_timer()-_started);
                return false;
            case 3:
                var _n=world_node_sites[generation.cursor++];
                node_spawn(_n[0],_n[1]);
                generation.progress=0.92+0.02*generation.cursor;
                if (generation.cursor>=array_length(world_node_sites)) {
                    generation.stage=4; generation.label="Connecting the world"; nav_components_begin();
                }
                // Node footprints use a small local rebuild, one per frame.
                generation.max_us=max(generation.max_us,get_timer()-_started);
                return false;
            case 4:
                var _ready=nav_rebuild_step(max(1,_deadline-get_timer()));
                generation.progress=0.98+0.019*nav.rebuild_progress;
                if (_ready) generation.stage=5;
                generation.max_us=max(generation.max_us,get_timer()-_started);
                return false;
            case 5:
                unit_spawn(0,7.5+start_offset,7+start_offset); unit_spawn(0,7+start_offset,8+start_offset);
                for (var _i=0; _i<6; ++_i) unit_spawn(1,8+start_offset+(_i mod 3)*0.5,7+start_offset+(_i div 3)*0.6);
                fog_update(); sentrion_tick(); unit_buckets();
                generation.progress=1; generation.label="Ready"; app_state="playing";
                show_debug_message("WORLD_GENERATED: seed="+string(generation.seed)+", steps="+string(generation.steps)
                    +", forest="+string(generation.forests)+", mills="+string(generation.mills));
                break;
        }
    }
    generation.max_us=max(generation.max_us,get_timer()-_started);
    return app_state=="playing";
};
worldgen_tests=function() {
    unit_test_assert(generation.progress==1 && generation.steps>10,"Generation: job completes across frames");
    unit_test_assert(nav.labels_valid,"Generation: completed obstacle graph has connected-region labels before play");
    unit_test_assert(array_length(units)>=8 && array_length(nodes)==3,"Generation: starting allies and all three nodes have valid sites");
    if (!startup_fixture) {
        unit_test_assert(generation.forests<=32 && generation.mills<=3,"Generation: forest and mill populations stay sparse");
        var _seeds=[17,7103,9127], _signatures=[];
        for (var _s=0; _s<array_length(_seeds); ++_s) {
            var _edge_water=0, _inland_water=0, _safe=true, _signature=0;
            for (var _gy=0; _gy<map_size; ++_gy) for (var _gx=0; _gx<map_size; ++_gx) {
                var _water=worldgen_water(_gx,_gy,_seeds[_s]);
                if (worldgen_reserved(_gx,_gy) && _water) _safe=false;
                if (_water) {
                    _signature=(_signature+(_gy*map_size+_gx)*13) mod 1000000007;
                    if (min(_gx,_gy,map_size-1-_gx,map_size-1-_gy)<9) _edge_water++; else _inland_water++;
                }
            }
            array_push(_signatures,_signature);
            unit_test_assert(_safe && _edge_water>40 && _inland_water<40 && _edge_water>_inland_water*4,
                "Generation: seed "+string(_seeds[_s])+" has broken shores, rare inland pools and dry start approaches");
        }
        unit_test_assert(_signatures[0]!=_signatures[1] && _signatures[1]!=_signatures[2],"Generation: different seeds make different maps");
        var _near=0, _far=0;
        for (var _gy=0; _gy<map_size-1; ++_gy) for (var _gx=0; _gx<map_size-1; ++_gx) {
            var _i=_gy*map_size+_gx;
            if (terrain_style[_i]==terrain_style[_i+1]) _near++;
            if (terrain_style[_i]==terrain_style[((_gy+23) mod map_size)*map_size+((_gx+29) mod map_size)]) _far++;
        }
        unit_test_assert(_near>_far*1.5,"Generation: adjacent ground variants cluster more often than distant variants");
    }
    // Walk the actual final navigation graph, including every prop footprint.
    // Reserved terrain alone is insufficient evidence of a reachable start.
    var _visited=array_create(nav.count,false), _queue=array_create(nav.count,0), _head=0, _tail=0;
    var _start=nav_index(units[0].gx,units[0].gy);
    _queue[_tail++]=_start; _visited[_start]=true;
    while (_head<_tail) {
        var _at=_queue[_head++], _links=nav.edges[_at];
        for (var _j=0; _j<array_length(_links); ++_j) {
            var _next=_links[_j];
            if (!_visited[_next]) { _visited[_next]=true; _queue[_tail++]=_next; }
        }
    }
    var _reachable=true;
    for (var _i=0; _i<array_length(units); ++_i)
        if (!_visited[nav_index(units[_i].gx,units[_i].gy)]) _reachable=false;
    for (var _i=0; _i<array_length(nodes); ++_i) {
        var _n=nodes[_i], _approach=nav_nearest(_n.gx-1.7,_n.gy-1.7);
        if (_approach<0 || !_visited[_approach]) _reachable=false;
    }
    unit_test_assert(_reachable,"Generation: all starting allies and node approaches share a connected walkable region");
};
map_preset_tests=function() {
    var _state=global.map_test_state, _preset=map_presets[_state.index];
    unit_test_assert(menu_map_preset==_state.index && map_size==_preset.side
        && array_length(terrain)==sqr(_preset.side) && array_length(terrain_style)==sqr(_preset.side),
        "Map preset: "+_preset.name+" rebuilds both terrain arrays at the selected size");
    unit_test_assert(nav.side==map_size*3 && nav.count==sqr(map_size*3)
        && array_length(nav.search_stamp)==nav.count && array_length(nav.search_heap)==nav.count
        && bucket_side==map_size*2 && array_length(buckets)==sqr(bucket_side),
        "Map preset: "+_preset.name+" resizes navigation and spatial buckets together");
    unit_test_assert(city.gx==(map_size-1)*0.5 && city.gy==(map_size-1)*0.5
        && balance.ally_limit==_preset.ally_limit && balance.enemy_limit==40,
        "Map preset: "+_preset.name+" centres the settlement and applies its allied limit");
    worldgen_tests();
    var _alive=array_length(units);
    for (var _i=_alive; _i<_preset.ally_limit; ++_i)
        unit_spawn(1,city.gx+4+(_i mod 6)*0.34,city.gy+4+(_i div 6)*0.34);
    unit_test_assert(array_length(units)==_preset.ally_limit
        && is_undefined(unit_spawn(0,city.gx+4,city.gy+4)),
        "Map preset: "+_preset.name+" enforces the shared Ecclesian/Militia population cap");
    gui_prop=0;
    var _gold=gold;
    unit_test_assert(!gui_recruit(0) && gold==_gold,
        "Map preset: capped recruitment does not charge gold");
    _state.failed=_state.failed || unit_test_failed;
    show_debug_message("MAP_PRESET_COMPLETE: "+_preset.name+", side="+string(map_size)+", allied_limit="+string(balance.ally_limit));
};
// Existing VM suites and a menu-requested resize enter the staged loader.
var _start_pending=variable_global_exists("map_start_pending") && global.map_start_pending;
if (_start_pending) global.map_start_pending=false;
if (startup_test_mode || _start_pending) worldgen_begin(world_seed);

// Isolated regressions for exact construction footprints and mature-node spread.
av_tests=function() {
    var _sounds=[snd_ui_click,snd_build,snd_unit_spawn,snd_alert,snd_infestation_spawn,snd_infestation_ambient,
        snd_militia_attack_1,snd_militia_attack_2,snd_militia_attack_3,snd_scourge_death,snd_purification,snd_ritual,mus_gameplay,mus_title];
    for (var _i=0; _i<array_length(_sounds); ++_i) unit_test_assert(audio_exists(_sounds[_i]),"AV: imported sound "+audio_get_name(_sounds[_i]));
    av_cleanup(); app_state="menu"; av_tick(0);
    var _title_voice=av_music_voice;
    av_tick(0);
    unit_test_assert(av_music_asset==mus_title && av_music_voice==_title_voice,"AV: title music is reused in menu");
    var _click_voice=av_sound(snd_ui_click,0.55);
    av_tick(0);
    unit_test_assert(audio_is_playing(_click_voice),"AV: menu reconciliation lets UI clicks finish naturally");
    app_state="playing"; av_tick(0);
    unit_test_assert(av_music_asset==mus_gameplay && !audio_is_playing(_title_voice),"AV: gameplay music replaces title voice");

    av_clear_world(); sim_over=false; paused=false; lab_mode=0;
    units=[]; nodes=[]; terrain=array_create(map_size*map_size,0);
    fog_visible=array_create(map_size*map_size,true); fog_seen=array_create(map_size*map_size,true);
    var _gx=city.gx+4, _gy=city.gy;
    var _w=iso_to_world(_gx,_gy); camera_x=_w[0]; camera_y=_w[1];
    var _evil=unit_spawn(2,_gx,_gy), _human=unit_spawn(1,_gx+1,_gy);
    unit_test_assert(!is_undefined(_evil) && !is_undefined(_human),"AV: combat fixture spawns real units");
    unit_hurt(_evil,1); unit_hurt(_human,1);
    unit_test_assert(array_length(av_particles)==3,"AV: spawn and both impact assets create one transient each");
    var _transients=[];
    for (var _i=0; _i<array_length(av_particles); ++_i) array_push(_transients,av_particles[_i].system);
    unit_hurt(_evil,999);
    unit_test_assert(array_length(av_voices)==1,"AV: enemy death plays a single sound");
    av_tick(1/60);
    var _emitted=true;
    for (var _i=0; _i<array_length(av_particles); ++_i)
        if (part_particles_count(av_particles[_i].system)<=0) _emitted=false;
    unit_test_assert(_emitted,"AV: all burst systems actually emit their authored particles");
    repeat (120) av_tick(1/60);
    var _destroyed=true;
    for (var _i=0; _i<array_length(_transients); ++_i) if (part_system_exists(_transients[_i])) _destroyed=false;
    unit_test_assert(_destroyed && array_length(av_particles)==0,"AV: expired bursts destroy every particle system");

    var _idx=fog_index(_gx,_gy), _key="c"+string(_idx);
    terrain[_idx]=2; av_tick(1/60);
    var _corrupt=av_particle_keys[$ _key];
    repeat (120) av_tick(1/60);
    unit_test_assert(array_length(av_particles)==1 && av_particle_keys[$ _key].system==_corrupt.system
        && part_particles_count(_corrupt.system)>0,"AV: corruption streams continuously without duplicating its system");
    paused=true;
    var _steps=_corrupt.steps, _count=part_particles_count(_corrupt.system);
    repeat (60) av_tick(1/60);
    unit_test_assert(_corrupt.steps==_steps && part_particles_count(_corrupt.system)==_count,"AV: pause freezes particle simulation");
    var _old_system=_corrupt.system;
    paused=false; fog_visible[_idx]=false; av_tick(0);
    unit_test_assert(!variable_struct_exists(av_particle_keys,_key) && !part_system_exists(_old_system),"AV: losing vision releases corruption system");
    fog_visible[_idx]=true; av_tick(1/60); _corrupt=av_particle_keys[$ _key];
    _old_system=_corrupt.system;
    camera_x+=100000; av_tick(0);
    unit_test_assert(!variable_struct_exists(av_particle_keys,_key) && !part_system_exists(_old_system),"AV: panning away releases offscreen system");
    camera_x=_w[0]; av_tick(1/60); _corrupt=av_particle_keys[$ _key];
    _old_system=_corrupt.system;
    terrain[_idx]=0; av_tick(0);
    unit_test_assert(!part_system_exists(_old_system) && array_length(av_particles)==0,"AV: cleansing ground releases its system immediately");

    var _node={gx:_gx,gy:_gy,span:2,active:true}; nodes=[_node];
    var _priest=unit_spawn(0,_gx+1.3,_gy);
    _priest.gx=_gx+1.3; _priest.gy=_gy; _priest.order=2; _priest.objective=_node; unit_action(_priest,2);
    av_tick(1/60);
    unit_test_assert(variable_struct_exists(av_particle_keys,"h0") && variable_struct_exists(av_loops,"purification")
        && variable_struct_exists(av_loops,"infestation"),"AV: active purification owns holy particles and two bounded audio loops");
    var _holy=av_particle_keys.h0.system, _purification_voice=av_loops.purification;
    repeat (60) av_tick(1/60);
    unit_test_assert(av_particle_keys.h0.system==_holy && av_loops.purification==_purification_voice,"AV: sustained prayer reuses effects and loop voice");
    paused=true; av_tick(0);
    unit_test_assert(array_length(variable_struct_get_names(av_loops))==0 && !audio_is_playing(_purification_voice),"AV: pause stops environmental loops");
    paused=false; av_tick(0);
    unit_test_assert(variable_struct_exists(av_loops,"purification"),"AV: resume restarts active purification loop");
    _priest.order=1; unit_action(_priest,1); av_tick(0);
    unit_test_assert(!part_system_exists(_holy) && !variable_struct_exists(av_loops,"purification"),"AV: new order ends purification particles and audio");
    _node.active=false; av_tick(0);
    unit_test_assert(!variable_struct_exists(av_loops,"infestation"),"AV: inactive node stops ambient audio");

    _node.active=true; _priest.order=2; unit_action(_priest,2); av_tick(1/60);
    sim_finish("AV test finished");
    unit_test_assert(array_length(av_particles)==0 && array_length(variable_struct_get_names(av_loops))==0,"AV: match finish releases all world effects");
    sim_over=false; av_tick(1/60);
    global.av_restart_systems=[]; global.av_restart_voices=[];
    for (var _i=0; _i<array_length(av_particles); ++_i) array_push(global.av_restart_systems,av_particles[_i].system);
    var _keys=variable_struct_get_names(av_loops);
    for (var _i=0; _i<array_length(_keys); ++_i) array_push(global.av_restart_voices,av_loops[$ _keys[_i]]);
    array_push(global.av_restart_voices,av_music_voice);
    global.av_restart_pending=true;
    show_debug_message(unit_test_failed ? "AV_TEST_FAILED" : "AV_TEST_COMPLETE");
    if (unit_test_failed) { game_end(); return; }
    room_restart();
};

player_capture_frame=function() {
    if (!player_test_mode || player_test_capture=="") return;
    if (aspect_test_mode) {
        // screen_save crops away letterbox margins; capture the back buffer
        // explicitly so the regression can inspect the actual screen edges.
        var _position=application_get_position();
        screen_save_part(game_save_id+player_test_capture+".png",0,0,
            round(_position[0]+_position[2]),round(_position[1]+_position[3]));
    } else screen_save(game_save_id+player_test_capture+".png");
    show_debug_message("PLAYER_CAPTURE: "+game_save_id+player_test_capture+".png");
    player_test_capture="";
};
aspect_tests_tick=function() {
    aspect_test_frame++;
    var _size=aspect_test_sizes[aspect_test_index];
    if (aspect_test_frame==1) {
        pause_menu=false; controls_open=false;
        if (_size[0]==0) window_set_fullscreen(true);
        else window_set_size(_size[0],_size[1]);
    }
    if (aspect_test_frame==8) player_test_capture="aspect_base_"+string(aspect_test_index);
    if (aspect_test_frame==10) pause_menu=true;
    if (aspect_test_frame==12) player_test_capture="aspect_pause_"+string(aspect_test_index);
    if (aspect_test_frame==14) controls_open=true;
    if (aspect_test_frame==16) player_test_capture="aspect_controls_"+string(aspect_test_index);
    if (aspect_test_frame==18) {
        var _position=application_get_position();
        var _scale_x=(_position[2]-_position[0])/lab_width;
        var _scale_y=(_position[3]-_position[1])/lab_height;
        var _mouse_x=(window_mouse_get_x()-_position[0])/_scale_x;
        var _mouse_y=(window_mouse_get_y()-_position[1])/_scale_y;
        unit_test_assert(abs(device_mouse_x_to_gui(0)-_mouse_x)<=2 && abs(device_mouse_y_to_gui(0)-_mouse_y)<=2,
            "Aspect: GUI mouse coordinates match the preserved canvas at case "+string(aspect_test_index));
        show_debug_message("ASPECT_LAYOUT: case="+string(aspect_test_index)+", window="+string(window_get_width())+"x"+string(window_get_height())
            +", application="+string(_position)+", gui="+string(display_get_gui_width())+"x"+string(display_get_gui_height())
            +", bounds="+string(gui_window_bounds));
    }
    if (aspect_test_frame==20) {
        aspect_test_index++; aspect_test_frame=0;
        if (aspect_test_index>=array_length(aspect_test_sizes)) {
            show_debug_message(unit_test_failed ? "ASPECT_TEST_FAILED" : "ASPECT_TEST_COMPLETE");
            game_end();
        }
    }
};
player_tests_tick=function() {
    if (variable_global_exists("player_restart_pending") && global.player_restart_pending) {
        unit_test_failed=global.player_test_failed;
        unit_test_assert(app_state=="loading" && sim_time==0 && array_length(units)==0,"Player: Play again starts a fresh loading job");
        unit_test_assert(!part_system_exists(global.player_old_system) && !audio_is_playing(global.player_old_voice),"Player: Play again cleans up old particles and audio");
        show_debug_message(unit_test_failed ? "PLAYER_TEST_FAILED" : "PLAYER_TEST_COMPLETE");
        game_end(); return true;
    }
    player_test_frame++;
    switch (player_test_stage) {
        case 0:
            if (player_test_frame==1) {
                unit_test_assert(app_state=="menu","Player: normal launch enters title screen");
                if (!web_layout) window_set_size(1280,720);
            }
            if (player_test_frame==2) player_test_capture="player_menu";
            if (player_test_frame==3) player_action("controls");
            if (player_test_frame==4) {
                unit_test_assert(controls_open && app_state=="menu","Player: controls open over the title screen");
                if (web_layout_test) {
                    show_debug_message("WEB_LAYOUT: logical="+string(lab_width)+"x"+string(lab_height)
                        +", bottom="+string(gui_bottom)+", hire_bottom="+string(gui_create_rect[1]+gui_create_rect[3])
                        +", ratio_error="+string(abs(lab_width/lab_height-1440/900)));
                    unit_test_assert(camera_get_view_width(view_camera[0])==1440 && camera_get_view_height(view_camera[0])==900
                        && view_wport[0]==1440 && view_hport[0]==900
                        && surface_get_width(application_surface)==1440 && surface_get_height(application_surface)==900,
                        "Web: camera, viewport and application surface use the original 1440x900 resolution");
                    unit_test_assert(abs(lab_width/lab_height-1440/900)<0.001
                        && gui_create_rect[1]+gui_create_rect[3]<lab_height && abs(gui_bottom+296-lab_height)<0.001
                        && 790<lab_height,"Web: HUD, recruitment, footer and controls fit the uniform-scale canvas");
                    var _slots_fit=true;
                    for (var _i=0; _i<array_length(gui_slots); ++_i)
                        if (gui_slots[_i][1]<gui_bottom || gui_slots[_i][1]+gui_slots[_i][3]>lab_height) _slots_fit=false;
                    unit_test_assert(_slots_fit,"Web: all four hiring/building hit rectangles stay inside their artwork");
                    var _w=gui_to_world(387,278), _s=world_to_gui(_w[0],_w[1]);
                    unit_test_assert(abs(_s[0]-387)<0.001 && abs(_s[1]-278)<0.001,
                        "Web: world picking and rendering share the adjusted camera centre");
                    var _position=application_get_position();
                    var _scale=(_position[2]-_position[0])/lab_width;
                    unit_test_assert(abs(device_mouse_x_to_gui(0)-(window_mouse_get_x()-_position[0])/_scale)<2
                        && abs(device_mouse_y_to_gui(0)-(window_mouse_get_y()-_position[1])/_scale)<2,
                        "Web: device mouse mapping matches the uniformly scaled GUI");
                    show_debug_message(unit_test_failed ? "WEB_LAYOUT_FAILED" : "WEB_LAYOUT_COMPLETE");
                }
                player_test_capture="player_controls";
            }
            if (player_test_frame==5) {
                player_action("controls"); menu_start_game();
                player_test_stage=1; player_test_frame=0;
            }
            break;
        case 1:
            if (app_state=="playing") {
                player_test_stage=2; player_test_frame=0;
                player_test_units=array_length(units);
                player_test_keys=[vk_tab,ord("G"),ord("O"),ord("P"),ord("1"),ord("2"),ord("3"),ord("4"),vk_f5,ord("B"),ord("R")];
            }
            break;
        case 2:
            var _key_index=(player_test_frame-1) div 2;
            if (_key_index<array_length(player_test_keys)) {
                var _key=player_test_keys[_key_index];
                if (player_test_frame mod 2==1) keyboard_key_press(_key);
                else {
                    keyboard_key_release(_key);
                    unit_test_assert(lab_mode==0 && !show_grid && !show_anchors && array_length(units)==player_test_units,
                        "Player: retired debug key "+string(_key)+" cannot change the match");
                }
            } else {
                units[0].selected=true; gui_inspected=units[0]; gui_menu=0;
                player_test_capture="player_hire";
                player_test_stage=3; player_test_frame=0;
            }
            break;
        case 3:
            if (player_test_frame==1) {
                player_action("pause"); player_test_time=sim_time; player_test_gold=gold_clock;
                player_test_capture="player_pause";
            }
            if (player_test_frame==3) {
                unit_test_assert(paused && pause_menu && sim_time==player_test_time && gold_clock==player_test_gold,"Player: pause menu freezes the match and income");
                player_action("controls"); player_action("controls");
                unit_test_assert(paused && pause_menu,"Player: closing controls preserves an existing pause");
                player_action("resume"); gui_menu=-1;
                player_test_stage=4; player_test_frame=0;
            }
            break;
        case 4:
            if (player_test_frame==2) {
                unit_test_assert(!paused && !pause_menu && sim_time>player_test_time,"Player: Resume continues the same match");
                player_action("controls"); player_action("controls");
                unit_test_assert(!paused,"Player: F1 controls restore an unpaused match");
                sim_finish("RITUAL COMPLETE - VICTORY",true);
                player_test_capture="player_result";
                player_test_stage=5; player_test_frame=0;
            }
            break;
        case 5:
            if (player_test_frame==2) {
                player_action("menu");
                unit_test_assert(app_state=="menu" && !controls_open && !pause_menu && array_length(av_particles)==0
                    && array_length(variable_struct_get_names(av_loops))==0,"Player: Main menu clears match effects and closes overlays");
            }
            if (player_test_frame==3) { menu_start_game(); player_test_stage=6; player_test_frame=0; }
            break;
        case 6:
            if (app_state=="playing") {
                unit_test_assert(sim_time==0 && gold==250 && array_length(units)==8,"Player: New game resets the army, economy and clock");
                global.player_old_system=av_create_particle(ps_appear_evil,units[0].gx,units[0].gy).system;
                global.player_old_voice=av_music_voice;
                global.player_test_failed=unit_test_failed; global.player_restart_pending=true;
                player_action("again"); return true;
            }
            break;
    }
    return false;
};

world_rules_tests=function() {
    var _saved_units=units, _saved_props=props, _saved_nodes=nodes, _saved_city=city;
    var _saved_terrain=terrain, _saved_owner=corruption_owner;
    var _saved_seen=fog_seen, _saved_visible=fog_visible;
    var _saved_over=sim_over, _saved_ritual=ritual.active;
    var _saved_chance=balance.node_branch_chance, _saved_limit=balance.node_limit;
    units=[]; props=[]; nodes=[]; city={gx:4,gy:4,span:2,hp:1000,max_hp:1000};
    sim_over=false; ritual.active=false;
    terrain=array_create(map_size*map_size,0); corruption_owner=array_create(map_size*map_size,-1);
    fog_seen=array_create(map_size*map_size,true); fog_visible=array_create(map_size*map_size,true);
    nav_rebuild();
    var _gx=10.5, _gy=10.5;
    // The old +/-1 samples incorrectly included this fifth, outside tile.
    terrain[fog_index(12,10)]=1;
    unit_test_assert(gui_can_build(_gx,_gy),"Placement: span-2 footprint does not include an outside third column");
    fog_visible[fog_index(10,10)]=false; fog_visible[fog_index(11,10)]=false;
    unit_test_assert(gui_can_build(_gx,_gy),"Placement: two explored cells may be in fog");
    fog_visible[fog_index(10,11)]=false;
    unit_test_assert(!gui_can_build(_gx,_gy),"Placement: three hidden footprint cells require more vision");
    fog_visible[fog_index(10,11)]=true; fog_seen[fog_index(10,10)]=false;
    unit_test_assert(!gui_can_build(_gx,_gy),"Placement: an unexplored footprint cell always blocks building");
    fog_seen[fog_index(10,10)]=true; terrain[fog_index(10,10)]=2;
    unit_test_assert(!gui_can_build(_gx,_gy),"Placement: infestation blocks construction even under fog");
    terrain[fog_index(10,10)]=0;
    units=[{gx:_gx+1.2,gy:_gy,hp:65,radius:0.13}];
    unit_test_assert(gui_can_build(_gx,_gy),"Placement: adjacent unit outside actual footprint permits building");
    units[0].gx=_gx+1.1;
    unit_test_assert(!gui_can_build(_gx,_gy),"Placement: intersecting live unit blocks building");
    units[0].hp=0;
    unit_test_assert(gui_can_build(_gx,_gy),"Placement: a corpse does not block building");
    units=[];
    props=[{gx:_gx+2,gy:_gy,span:2,spr:spr_outpost,unit:-1}];
    unit_test_assert(gui_can_build(_gx,_gy),"Placement: touching building edges do not overlap");
    props[0].gx=_gx+1.9;
    unit_test_assert(!gui_can_build(_gx,_gy),"Placement: true building overlap remains blocked");

    props=[]; terrain=array_create(map_size*map_size,0); nav_rebuild();
    balance.node_limit=18; balance.node_branch_chance=1;
    unit_test_assert(node_spawn(20.5,20.5),"Nodes: isolated parent has a valid site");
    var _parent=nodes[0];
    var _owned=0;
    for (var _i=0; _i<array_length(corruption_owner); ++_i) if (corruption_owner[_i]==0) _owned++;
    unit_test_assert(_owned==9 && _parent.owned_cells==_owned,"Nodes: half-cell anchor infects nine distinct initial cells");
    unit_test_assert(!node_is_mature(_parent) && !node_branch(),"Nodes: new nine-cell node cannot reproduce");
    for (var _step=0; _step<16; ++_step) corruption_grow();
    unit_test_assert(_parent.owned_cells==25 && node_is_mature(_parent),"Nodes: sixteen growth steps mature a 25-cell node");
    balance.node_branch_chance=0;
    unit_test_assert(!node_branch() && array_length(nodes)==1,"Nodes: zero branch chance creates no extra node");
    balance.node_branch_chance=1;
    unit_test_assert(node_branch() && array_length(nodes)==2,"Nodes: mature parent can create exactly one nearby node");
    var _child_valid=false;
    if (array_length(nodes)>1) {
        var _child=nodes[1], _distance=point_distance(_parent.gx,_parent.gy,_child.gx,_child.gy);
        _child_valid=_distance>=7 && _distance<=12 && !node_is_mature(_child);
    }
    unit_test_assert(_child_valid,"Nodes: offspring stays nearby and starts immature");
    ritual.active=true;
    unit_test_assert(!node_branch() && array_length(nodes)==2,"Nodes: ritual prevents reproduction");
    ritual.active=false; balance.node_limit=2;
    unit_test_assert(!node_branch() && array_length(nodes)==2,"Nodes: reproduction respects active-node cap");
    _parent.active=false;
    unit_test_assert(!node_is_mature(_parent),"Nodes: cleansed mature node cannot reproduce");

    units=_saved_units; props=_saved_props; nodes=_saved_nodes; city=_saved_city;
    terrain=_saved_terrain; corruption_owner=_saved_owner;
    fog_seen=_saved_seen; fog_visible=_saved_visible;
    sim_over=_saved_over; ritual.active=_saved_ritual;
    balance.node_branch_chance=_saved_chance; balance.node_limit=_saved_limit;
    nav_rebuild();
};
