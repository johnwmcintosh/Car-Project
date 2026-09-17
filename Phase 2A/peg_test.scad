include <robot_settings.scad>
use <Battery/lfp_battery_box_peg_mounts.scad>

battery_box_peg_mounts(show_mounts = true, show_points = true);
cube([lfp_main_box_x, lfp_main_box_y, 5], center =  true);