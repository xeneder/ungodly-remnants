/// Player controls, match flow and opt-in automated checks.
var _dt=min(delta_time*0.000001,0.05);
player_gui_update();
if (av_test_mode && variable_global_exists("av_restart_pending") && global.av_restart_pending) {
    var _released=true;
    for (var _i=0; _i<array_length(global.av_restart_systems); ++_i)
        if (part_system_exists(global.av_restart_systems[_i])) _released=false;
    for (var _i=0; _i<array_length(global.av_restart_voices); ++_i)
        if (audio_is_playing(global.av_restart_voices[_i])) _released=false;
    unit_test_assert(_released,"AV: actual room restart Clean Up destroys systems and stops all owned voices");
    av_cleanup(); av_cleanup();
    show_debug_message(unit_test_failed ? "AV_TEST_FAILED" : "AV_RESTART_COMPLETE");
    game_end(); exit;
}
// Runs in every app state, including menus/loading and paused matches.
// Gameplay changes are reconciled once more below before the frame is drawn.
if (app_state!="playing") av_tick(0);
mouse_gui_x=device_mouse_x_to_gui(0); mouse_gui_y=device_mouse_y_to_gui(0);
if (aspect_test_mode) { aspect_tests_tick(); exit; }
if (player_test_mode && player_tests_tick()) exit;
if (app_state!="playing" && player_input()) { av_tick(0); last_mouse_x=mouse_gui_x; last_mouse_y=mouse_gui_y; exit; }
if (map_test_mode) {
    var _state=global.map_test_state;
    if (app_state=="menu") {
        _state.menu_frames++;
        if (_state.menu_frames<=2) exit;
        menu_choose_map(_state.index); menu_start_game(); exit;
    }
    if (app_state=="playing") {
        _state.ready_frames++;
        if (_state.ready_frames<=1) exit;
        map_preset_tests();
        _state.index++; _state.ready_frames=0;
        if (_state.index>=array_length(map_presets)) {
            show_debug_message(_state.failed ? "MAP_TEST_FAILED" : "MAP_TEST_COMPLETE");
            game_end(); exit;
        }
        app_state="menu"; menu_choose_map(_state.index); menu_start_game(); exit;
    }
}
if (generation_test_mode) generation_test_tick++;
if (app_state=="menu") {
    if (keyboard_check_pressed(vk_left)) menu_choose_map((menu_map_preset+2) mod 3);
    if (keyboard_check_pressed(vk_right)) menu_choose_map((menu_map_preset+1) mod 3);
    for (var _i=0; _i<array_length(map_presets); ++_i) {
        if (keyboard_check_pressed(ord("1")+_i)) menu_choose_map(_i);
        if (mouse_check_button_pressed(mb_left) && gui_hit(menu_map_rect(_i))) menu_choose_map(_i);
    }
    var _start_hit=gui_hit(menu_start_rect), _quit_hit=gui_hit(menu_quit_rect);
    if (mouse_check_button_pressed(mb_left) && gui_hit(menu_controls_rect)) { player_action("controls"); exit; }
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)
        || (mouse_check_button_pressed(mb_left) && _start_hit)
        || (generation_test_mode && (generation_test_tick==4 || generation_test_tick==13))) {
        menu_start_game();
        if (generation_test_mode && generation_test_tick==13)
            unit_test_assert(generation.cursor==0 && generation.stage==0 && array_length(nodes)==0,"Generation: restarting cancelled job resets its work and nodes");
    }
    else if (keyboard_check_pressed(vk_escape) || (mouse_check_button_pressed(mb_left) && _quit_hit)) game_end();
    last_mouse_x=mouse_gui_x; last_mouse_y=mouse_gui_y;
    exit;
}
if (app_state=="loading") {
    if (keyboard_check_pressed(vk_escape) && !startup_test_mode && !generation_test_mode) { worldgen_cancel(); exit; }
    if (generation_test_mode && generation_test_tick==10) {
        generation_test_cancelled=worldgen_cancel();
        unit_test_assert(generation_test_cancelled && app_state=="menu","Generation: cancellation returns to responsive main menu");
        exit;
    }
    worldgen_step(3000);
    last_mouse_x=mouse_gui_x; last_mouse_y=mouse_gui_y;
    exit;
}
if (generation_test_mode) {
    // Test the actual menu -> staged loading -> playable transition. Drawing
    // remains active throughout, and the gameplay clock starts only after ready.
    generation_test_ready_frames++;
    if (generation_test_ready_frames==1) exit; // Let a complete ready frame paint before capturing it.
    unit_test_assert(app_state=="playing" && sim_time==0,"Generation: menu and loading do not advance the match");
    unit_test_assert(generation_test_cancelled,"Generation: cancelled world successfully starts again");
    worldgen_tests();
    var _spawn_open=true;
    for (var _i=0; _i<array_length(units); ++_i)
        if (!nav_open(units[_i].gx,units[_i].gy)) _spawn_open=false;
    unit_test_assert(_spawn_open,"Generation: starting units occupy open navigation cells");
    generation_test_max_us=max(generation_test_max_us,generation.max_us);
    generation_test_steps+=generation.steps;
    show_debug_message("GENERATION_SEED_COMPLETE: seed="+string(generation.seed)+", steps="+string(generation.steps)
        +", max_step_us="+string(generation.max_us));
    generation_test_seed_index++;
    if (generation_test_seed_index<array_length(generation_test_seeds)) {
        worldgen_begin(generation_test_seeds[generation_test_seed_index]); exit;
    }
    show_debug_message("GENERATION_BENCHMARK: seeds="+string(array_length(generation_test_seeds))
        +", steps="+string(generation_test_steps)+", max_step_us="+string(generation_test_max_us));
    show_debug_message(unit_test_failed ? "GENERATION_TEST_FAILED" : "GENERATION_TEST_COMPLETE");
    game_end(); exit;
}
if (av_test_mode) {
    av_test_frame++;
    if (av_test_frame==1) {
        var _n=nodes[0], _w=iso_to_world(_n.gx,_n.gy);
        camera_x=_w[0]; camera_y=_w[1]-80; map_zoom=0.9;
        fog_visible=array_create(map_size*map_size,true); fog_seen=array_create(map_size*map_size,true);
        array_copy(fog_terrain,0,terrain,0,array_length(terrain));
        units[0].gx=_n.gx+1.3; units[0].gy=_n.gy;
        units[0].order=2; units[0].objective=_n; unit_action(units[0],2);
        av_visual_enemy=unit_spawn(2,_n.gx-2,_n.gy);
    }
    if (av_test_frame==30) {
        av_burst(ps_appear_evil,av_visual_enemy.gx,av_visual_enemy.gy);
        unit_hurt(av_visual_enemy,1); unit_hurt(units[0],1);
    }
    // Restore prayer after showing its hit animation so holy remains visible.
    if (av_test_frame==31) unit_action(units[0],2);
    av_tick(_dt);
    if (av_test_frame>=75) av_tests();
    exit;
}
if (world_test_mode) {
    world_test_tick++;
    if (world_test_tick==3) { world_tests(); game_end(); exit; }
    paused=true;
}
if (block5_test_mode) {
    block5_test_tick++;
    if (block5_test_tick==10) {
        block5_visual_units=[]; array_copy(block5_visual_units,0,units,0,array_length(units));
        block5_visual_terrain=[]; array_copy(block5_visual_terrain,0,terrain,0,array_length(terrain));
        block5_visual_seen=[]; array_copy(block5_visual_seen,0,fog_seen,0,array_length(fog_seen));
        block5_visual_memory=[]; array_copy(block5_visual_memory,0,fog_terrain,0,array_length(fog_terrain));
        block5_visual_known=[];
        for (var _i=0; _i<array_length(props); ++_i) array_push(block5_visual_known,fog_prop_known(props[_i]));
        block5_visual_id=next_unit_id;
        unit_spawn(0,14,11); fog_update();
    }
    if (block5_test_tick==20) {
        units=block5_visual_units;
        terrain[fog_index(14,11)]=2; fog_update();
    }
    if (block5_test_tick==30) {
        terrain=block5_visual_terrain; fog_seen=block5_visual_seen; fog_terrain=block5_visual_memory;
        next_unit_id=block5_visual_id;
        for (var _i=0; _i<array_length(props); ++_i) props[_i].fog_known=block5_visual_known[_i];
        fog_update();
        block5_tests(); game_end(); exit;
    }
    // Draw real fog transitions before running the isolated checks.
    paused=true;
}
if (gui_test_mode) {
    gui_test_tick++;
    paused=true;
    if (gui_test_tick==1) gui_tests();
    if (gui_test_tick==15) {
        gui_prop=-1; units[0].selected=true;
        unit_test_assert(sprite_get_width(global.gui_art_cache[0])==720 && sprite_get_width(global.gui_art_cache[1])==720
            && sprite_get_height(global.gui_art_cache[1])==148,"GUI: interface artwork uses half-resolution cached sprites");
    }
    if (gui_test_tick==30) gui_menu=0;
    if (gui_test_tick==45) { gui_menu=2; }
    if (gui_test_tick==60) { gui_menu=-1; units[0].selected=false; gui_prop=1; }
    if (gui_test_tick==75) { gui_prop=-1; gui_inspected=units[2]; }
    if (gui_test_tick==95) {
        for (var _i=0; _i<array_length(units); ++_i) units[_i].selected=false;
        gui_inspected=undefined; gui_menu=-1; gui_prop=0; remnant_count=3;
    }
    if (gui_test_tick==110) {
        paused=false;
        unit_test_assert(ritual_start(),"GUI: selected City starts ready ritual");
        paused=true; ritual.elapsed=30; ritual.wave=2;
    }
    if (gui_test_tick==124) unit_test_assert(ritual.elapsed==30,"GUI: pause freezes ritual progress");
    if (gui_test_tick==125) { ritual.elapsed=60; sim_finish("RITUAL COMPLETE - VICTORY",true); }
    if (gui_test_tick==135) {
        sim_over=false; sim_won=false; ritual.active=false;
        gui_prop=-1; gui_menu=-1; gui_inspected=undefined; gui_notice_time=0;
        var _threat=unit_spawn(2,city.gx+6,city.gy-6);
        unit_test_assert(!is_undefined(_threat),"Threat: rendered indicator fixture spawns a real enemy");
        if (!is_undefined(_threat)) {
            fog_reveal(_threat.gx,_threat.gy,1);
            var _w=iso_to_world(_threat.gx,_threat.gy);
            camera_x=_w[0]-(lab_width+180-720)/map_zoom; camera_y=_w[1];
            unit_test_assert(!is_undefined(gui_offscreen_threat()),"Threat: real offscreen enemy supplies the rendered arrow");
        }
    }
    if (gui_test_tick==145) { show_debug_message("GUI_SMOKE_COMPLETE"); game_end(); }
}
if (unit_test_mode) {
    unit_test_tick++;
    if (unit_test_tick==1) unit_tests();
    if (unit_test_tick==21) unit_bench_begin();
    if (unit_test_tick==142) { unit_bench_end(); game_end(); }
    _dt=1/60;
}
mouse_gui_x=device_mouse_x_to_gui(0);
mouse_gui_y=device_mouse_y_to_gui(0);
if (player_input()) { gui_tick(_dt); av_tick(0); last_mouse_x=mouse_gui_x; last_mouse_y=mouse_gui_y; exit; }
if (keyboard_check_pressed(vk_home)) { camera_x=0; camera_y=cell_height*(city.gy+2); map_zoom=0.60; gallery_scale=0.85; }
if (lab_mode==0) {
    var _pan=620*_dt/map_zoom;
    var _pan_vector=camera_pan_vector(keyboard_check(ord("D"))-keyboard_check(ord("A")),
        keyboard_check(ord("S"))-keyboard_check(ord("W")),window_mouse_get_x(),window_mouse_get_y(),
        window_get_width(),window_get_height(),window_has_focus() && !sim_over
        && !mouse_check_button(mb_middle) && !startup_test_mode && !player_test_mode);
    camera_x+=_pan_vector[0]*_pan;
    camera_y+=_pan_vector[1]*_pan;
    if (mouse_check_button(mb_middle)) {
        camera_x-=(mouse_gui_x-last_mouse_x)/map_zoom;
        camera_y-=(mouse_gui_y-last_mouse_y)/map_zoom;
    }
    if (mouse_gui_y>gui_top && mouse_gui_y<gui_bottom) {
        var _before=gui_to_world(mouse_gui_x,mouse_gui_y);
        map_zoom=clamp(map_zoom*power(1.15,mouse_wheel_up()-mouse_wheel_down()),0.3,2);
        var _after=gui_to_world(mouse_gui_x,mouse_gui_y);
        camera_x+=_before[0]-_after[0]; camera_y+=_before[1]-_after[1];
    }
    var _world=gui_to_world(mouse_gui_x,mouse_gui_y);
    var _grid=world_to_iso(_world[0],_world[1]);
    hover_gx=_grid[0]; hover_gy=_grid[1];
    if (!gui_input()) sim_input();
    if (!paused) {
        var _before=get_timer();
        sim_tick(_dt);
        if (unit_test_mode && unit_test_tick>=22 && unit_test_tick<=141) {
            var _elapsed=get_timer()-_before;
            unit_bench_total+=_elapsed; unit_bench_max=max(unit_bench_max,_elapsed);
            array_push(unit_bench_samples,_elapsed);
            array_push(unit_bench_frame_samples,delta_time);
        }
        anim_time+=_dt;
    }
}
gui_tick(_dt);
av_tick(_dt);
last_mouse_x=mouse_gui_x; last_mouse_y=mouse_gui_y;
