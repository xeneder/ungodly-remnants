/// Render the game in a fixed logical viewport; world coordinates stay in pixels.
draw_set_alpha(1);
draw_set_colour(make_colour_rgb(18,22,23));
draw_rectangle(gui_window_bounds[0],gui_window_bounds[1],gui_window_bounds[2],gui_window_bounds[3],false);
draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (app_state!="playing") {
    // The menu is cheap to paint while the world job yields between chunks.
    draw_set_colour(make_colour_rgb(11,16,19));
    draw_rectangle(gui_window_bounds[0],gui_window_bounds[1],gui_window_bounds[2],gui_window_bounds[3],false);
    draw_set_alpha(0.18);
    for (var _row=0; _row<12; ++_row) for (var _col=0; _col<16; ++_col) {
        var _sx=(_col-_row)*90+690, _sy=(_row+_col)*43+30;
        diamond(_sx,_sy,180,86,make_colour_rgb(75,88,71));
    }
    draw_set_alpha(1);
    draw_sprite_ext(spr_city_state,0,720,384,1.15,1.15,0,make_colour_rgb(145,154,140),0.50);
    draw_set_halign(fa_center);
    draw_set_font(gui_heading_font); draw_set_colour(gui_ink);
    draw_text(720,180,"UNGODLY REMNANTS");
    draw_set_font(gui_body_font); draw_set_colour(gui_muted);
    draw_text(720,240,"Recover the Remnants. Keep the City alive.");
    if (app_state=="menu") {
        draw_set_font(gui_small_font); draw_set_colour(gui_muted); draw_text(720,315,"MAP SIZE");
        for (var _i=0; _i<array_length(map_presets); ++_i) {
            var _r=menu_map_rect(_i), _preset=map_presets[_i], _selected=menu_map_preset==_i;
            draw_set_colour(make_colour_rgb(18,22,23)); draw_set_alpha(0.92);
            draw_rectangle(_r[0],_r[1],_r[0]+_r[2],_r[1]+_r[3],false); draw_set_alpha(1);
            gui_artwork(spr_gui_button,_r[0],_r[1],_r[2],52,_selected || gui_hit(_r) ? c_white : make_colour_rgb(145,145,135));
            gui_button_text(gui_body_font,_preset.name,_r[0],_r[1],_r[2],52,_selected ? gui_ink : gui_muted);
            draw_set_font(gui_small_font); draw_set_colour(_selected ? gui_ink : gui_muted);
            draw_text(_r[0]+_r[2]*0.5,_r[1]+62,string(_preset.side)+" x "+string(_preset.side)+"  |  Army "+string(_preset.ally_limit));
            if (_selected) {
                draw_set_colour(make_colour_rgb(203,169,99));
                draw_rectangle(_r[0]-2,_r[1]-2,_r[0]+_r[2]+2,_r[1]+_r[3]+2,true);
            }
        }
        var _r=menu_start_rect, _hover=gui_hit(_r);
        gui_artwork(spr_gui_button,_r[0],_r[1],_r[2],_r[3],_hover ? c_white : make_colour_rgb(190,190,175));
        gui_button_text(gui_heading_font,"New game",_r[0],_r[1],_r[2],_r[3],gui_ink);
        player_button(menu_controls_rect,"Controls");
        _r=menu_quit_rect; _hover=gui_hit(_r);
        gui_artwork(spr_gui_button,_r[0],_r[1],_r[2],_r[3],_hover ? c_white : make_colour_rgb(160,160,145));
        gui_button_text(gui_body_font,"Quit",_r[0],_r[1],_r[2],_r[3],gui_ink);
        draw_set_font(gui_small_font); draw_set_colour(gui_muted);
        draw_text(720,685,"LEFT / RIGHT or 1 / 2 / 3 choose map   |   ENTER start   |   F1 controls");
        draw_text(720,720,"WASD / middle mouse pan   |   Wheel zoom   |   Right click command");
        draw_set_font(gui_body_font); draw_text(720,min(805,lab_height-55),"WolK Xeneder");
    } else {
        draw_set_font(gui_heading_font); draw_set_colour(gui_ink);
        draw_text(720,465,"Creating a new world");
        draw_set_colour(make_colour_rgb(35,42,42)); draw_rectangle(420,528,1020,548,false);
        draw_set_colour(make_colour_rgb(164,159,99)); draw_rectangle(423,531,423+594*generation.progress,545,false);
        draw_set_font(gui_body_font); draw_set_colour(gui_muted);
        draw_text(720,572,generation.label+"  "+string(floor(generation.progress*100))+"%");
        draw_set_font(gui_small_font);
        draw_text(720,638,map_presets[menu_map_preset].name+"  "+string(map_size)+" x "+string(map_size)
            +"   |   ESC return to menu");
    }
    draw_set_halign(fa_left); draw_set_font(-1); draw_set_colour(c_white); draw_set_alpha(1);
    if (aspect_test_mode) draw_clear(make_colour_rgb(120,120,120));
    player_overlay_draw();
    player_capture_frame();
    if (map_test_mode && app_state=="menu" && global.map_test_state.menu_frames==2) {
        screen_save(game_save_id+"map_sizes_menu.png");
        show_debug_message("MAP_CAPTURE: "+game_save_id+"map_sizes_menu.png");
    }
    if (generation_test_mode && (generation_test_tick==2 || generation_test_tick==8)) {
        var _file=generation_test_tick==2 ? "generation_menu.png" : "generation_loading.png";
        screen_save(game_save_id+_file); show_debug_message("GENERATION_CAPTURE: "+game_save_id+_file);
    }
    exit;
}

if (lab_mode == 0) {
    var _has_selection=false;
    for (var _i=0; _i<array_length(units); ++_i)
        if (units[_i].team==0 && units[_i].hp>0 && units[_i].selected) { _has_selection=true; break; }
    // Back-to-front ground pass, then all props ordered by their ground contact Y.
    // Invert the viewport first: visit only visible tiles at every map size.
    var _half_w=cell_width*0.5, _half_h=cell_height*0.5;
    var _left=camera_x+(-128*map_zoom-720)/map_zoom;
    var _right=camera_x+(lab_width+128*map_zoom-720)/map_zoom;
    var _top=camera_y+(-128*map_zoom-gui_world_centre_y)/map_zoom;
    var _bottom=camera_y+(lab_height+128*map_zoom-gui_world_centre_y)/map_zoom;
    var _sum0=max(0,ceil(_top/_half_h)), _sum1=min(map_size*2-2,floor(_bottom/_half_h));
    for (var _sum = _sum0; _sum <= _sum1; ++_sum) {
        var _gx0=max(0,_sum-map_size+1,ceil((_sum+_left/_half_w)*0.5));
        var _gx1=min(map_size-1,_sum,floor((_sum+_right/_half_w)*0.5));
        for (var _gx = _gx0; _gx <= _gx1; ++_gx) {
            var _gy = _sum - _gx;
            if (_gy < 0 || _gy >= map_size) continue;
            var _w = iso_to_world(_gx, _gy);
            var _s = world_to_gui(_w[0], _w[1]);
            if (_s[0]<-128*map_zoom || _s[0]>lab_width+128*map_zoom
                || _s[1]<-128*map_zoom || _s[1]>lab_height+128*map_zoom) continue;
            var _idx=_gy*map_size+_gx;
            var _terrain = fog_terrain[_idx];
            var _tint=fog_visible[_idx] ? c_white : (fog_seen[_idx] ? make_colour_rgb(75,80,95) : make_colour_rgb(12,15,22));
            var _spr = grass_sprites[startup_fixture ? ((_gx*3+_gy*7) mod array_length(grass_sprites)) : terrain_style[_idx]];
            var _frame = 0;
            if (_terrain == 1) _spr = water_sprites[(_gx+_gy) mod array_length(water_sprites)];
            if (_terrain == 2) {
                _spr = corruption_sprites[(_gx+_gy*3) mod array_length(corruption_sprites)];
                _frame = floor((fog_visible[_idx] ? anim_time : 0)*4) mod sprite_get_number(_spr);
            }
            draw_sprite_ext(_spr,_frame,_s[0],_s[1],map_zoom,map_zoom,0,_tint,1);
            if (show_grid && !_has_selection) {
                draw_set_alpha(0.28);
                diamond(_s[0],_s[1],cell_width*map_zoom,cell_height*map_zoom,make_colour_rgb(110,190,200));
                draw_set_alpha(1);
            }
        }
    }
    if (!unit_grid_draw() && gui_place<0 && hover_gx >= 0 && hover_gx < map_size && hover_gy >= 0 && hover_gy < map_size
        && mouse_gui_y > gui_top && mouse_gui_y < gui_bottom) {
        var _w = iso_to_world(hover_gx,hover_gy);
        var _s = world_to_gui(_w[0],_w[1]);
        var _blocked = !fog_can_see(hover_gx,hover_gy) || !nav_open(hover_gx,hover_gy);
        diamond(_s[0],_s[1],cell_width*map_zoom,cell_height*map_zoom,_blocked ? c_red : c_lime);
    }
    av_draw(true);
    sim_draw();
    av_draw(false);
    if (gui_place>=0 && mouse_gui_y>gui_top && mouse_gui_y<gui_bottom) {
        var _g=gui_placement_cell(), _w=iso_to_world(_g[0],_g[1]), _s=world_to_gui(_w[0],_w[1]);
        var _valid=gui_can_build(_g[0],_g[1]);
        draw_sprite_ext(gui_place==3 ? spr_outpost : spr_sentrion_work,0,_s[0],_s[1],map_zoom,map_zoom,0,_valid ? c_white : c_red,0.55);
        diamond(_s[0],_s[1],cell_width*2*map_zoom,cell_height*2*map_zoom,_valid ? c_lime : c_red);
    }
    var _prop=gui_get_prop(gui_prop);
    if (!is_undefined(_prop)) {
        var _w=iso_to_world(_prop.gx,_prop.gy), _s=world_to_gui(_w[0],_w[1]);
        diamond(_s[0],_s[1],cell_width*_prop.span*map_zoom,cell_height*_prop.span*map_zoom,c_aqua);
    }
}

gui_draw();
gui_draw_threat();
if (aspect_test_mode) draw_clear(make_colour_rgb(120,120,120));
player_overlay_draw();
player_capture_frame();

draw_set_colour(c_white); draw_set_alpha(1);
if (map_test_mode && global.map_test_state.ready_frames==1) {
    var _capture="map_"+string_lower(map_presets[menu_map_preset].name)+".png";
    screen_save(game_save_id+_capture); show_debug_message("MAP_CAPTURE: "+game_save_id+_capture);
}
if (gui_test_mode && gui_test_tick==140) {
    screen_save(game_save_id+"gui_threat_arrow.png");
    show_debug_message("GUI_CAPTURE: "+game_save_id+"gui_threat_arrow.png");
}
if (generation_test_mode && generation_test_seed_index==array_length(generation_test_seeds)-1 && generation_test_ready_frames==1) {
    screen_save(game_save_id+"generation_ready.png");
    show_debug_message("GENERATION_CAPTURE: "+game_save_id+"generation_ready.png");
}
if (gui_test_mode && (gui_test_tick==10 || gui_test_tick==25 || gui_test_tick==40 || gui_test_tick==55 || gui_test_tick==70 || gui_test_tick==85 || gui_test_tick==100 || gui_test_tick==115 || gui_test_tick==130)) {
    screen_save(game_save_id+"gui_"+string(gui_test_tick)+".png");
    show_debug_message("GUI_CAPTURE: "+game_save_id+"gui_"+string(gui_test_tick)+".png");
}
if (unit_test_mode && unit_test_tick==20) {
    var _capture=game_save_id+"unit_smoke.png";
    screen_save(_capture);
    show_debug_message("UNIT_CAPTURE: "+_capture);
}

if (block5_test_mode && block5_test_tick==5) {
    screen_save(game_save_id+"block5_start.png");
    show_debug_message("BLOCK5_CAPTURE: "+game_save_id+"block5_start.png");
}

if (block5_test_mode && (block5_test_tick==15 || block5_test_tick==25)) {
    var _file=block5_test_tick==15 ? "block5_explored.png" : "block5_remembered.png";
    screen_save(game_save_id+_file);
    show_debug_message("BLOCK5_CAPTURE: "+game_save_id+_file);
}
if (av_test_mode && av_test_frame==32) {
    screen_save(game_save_id+"av_effects.png");
    show_debug_message("AV_CAPTURE: "+game_save_id+"av_effects.png");
}
