$fn = 50;
include <../robot_settings.scad>

use <physical_ball_bearing.scad>
use <tire_apparatus.scad>
use <dc_motor_mount.scad>
use <../spring_library.scad>
use <MCAD/involute_gears.scad>
use <OpenSCAD_Gear_Library_with_Customizer/files/gears.scad>
use <../Front_End/axle_for_custom_hub.scad>
use <../Rear_End/rear_apparatus.scad>
use <../Front_End/Battery_box_2.scad>


    cube([
      rail_width - rail_gap * wall_thickness -50, 
      rail_length - 120, 
      rail_thickness], 
      center = true
    );
    
    translate([-main_box_x / 2, -main_box_y / 2, rail_thickness / 2])
    battery_box();
    

  
// rail attachments
translate([0,  -rail_length / 2, rail_thickness / 2 - .3]) {
  color("blue")
  translate([-main_box_x / 2 + rail_inset - 2.5, 0, 0]) {
    translate([ .7, 0, 0]) 
    cube([rail_gap, main_box_y, rail_inset - 2]);
    translate([-4.3, 0, rail_inset - rail_gap - 2])
    cube([rail_inset, main_box_y, rail_gap]);
  }

  color("yellow")
  translate([main_box_x / 2 - rail_inset - 4.8, 0, 0]) {
    translate([0, 0, 0])
    cube([rail_gap, main_box_y, rail_inset - 2]);
    translate([0 , 0, rail_inset - rail_gap - 2])
    cube([rail_inset, main_box_y, rail_gap]);
  }
 