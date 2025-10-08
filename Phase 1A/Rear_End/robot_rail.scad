include <../robot_settings.scad>

use <../Front_End/robot_rail.scad>
use <../Front_End/tire_apparatus.scad>
use <../Front_End/dc_motor_mount.scad>
use <../spring_library.scad>
use <../Front_End/MCAD/involute_gears.scad>
use <../Front_End/OpenSCAD_Gear_Library_with_Customizer/files/gears.scad>
use <../Front_End/Battery_box_2.scad>

use <rear_apparatus.scad>
$fn = 50;


module rear_robot_rail(include_apparatus = false) {
  difference() {
    front_robot_rail(show_steering_apparatus = false);
      
    translate([-rail_width / 2 + 24.8, -rail_length / 2 + 25, -rail_thickness])
    cylinder(h = rail_thickness + 8, d = ball_bearing_inner_diameter + .2);
    
    translate([-rail_width / 2 + 24.8, -rail_length / 2 + 45, -rail_thickness])
    cylinder(h = rail_thickness + 8, d = ball_bearing_inner_diameter + .2);
    
    translate([rail_width / 2 - 25.5, -rail_length / 2 + 25, -rail_thickness])
    cylinder(h = rail_thickness + 8, d = ball_bearing_inner_diameter + .2);
    
    translate([rail_width / 2 - 25.5, -rail_length / 2 + 45, -rail_thickness])
    cylinder(h = rail_thickness + 8, d = ball_bearing_inner_diameter + .2);
  }
  
  // support for apparatus connection to body
  difference() {
    translate([-rail_width / 2 + 15, -rail_length / 2 + 20, 0])
    cube([5, 10, 13]);
    
    // M3 screw hole
    translate([-rail_width / 2 + 10, -rail_length / 2 + 25, 10])
    rotate([0,90,0])
     cylinder(h = 25, d = dc_motor_screw_d);
  }
  
  difference() {
    translate([-rail_width / 2 + 15, -rail_length / 2 + 40, 0])
    cube([5, 10, 13]);

    // M3 screw hole
    translate([-rail_width / 2 + 10, -rail_length / 2 + 45, 10])
    rotate([0,90,0])
     cylinder(h = 25, d = dc_motor_screw_d);
  }

  difference() {
    translate([rail_width / 2 - 20, -rail_length / 2 + 20, 0])
    cube([5, 10, 13]);
  
    // M3 screw hole
    translate([rail_width / 2 - 25, -rail_length / 2 + 25, 10])
    rotate([0,90,0])
     cylinder(h = 25, d = dc_motor_screw_d);
  }
  
  difference() {
    translate([rail_width / 2 -20, -rail_length / 2 + 40, 0])
    cube([5, 10, 13]);
  
      // M3 screw hole
    translate([rail_width / 2 - 25, -rail_length / 2 + 45, 10])
    rotate([0,90,0])
     cylinder(h = 25, d = dc_motor_screw_d);
  }
  
  if (include_apparatus) {
    translate([rail_width / 2 - 25, -rail_length / 2 + 35, -45])
    rear_apparatus();
    
    translate([-rail_width / 2 + 25, -rail_length / 2 + 35, -45])
    rotate([0,0,180])
    rear_apparatus();
  }
  
  // rail system for battery box
  translate([-rail_width / 4 + 7.2, -rail_length /2, 2])
  cube([rail_gap, main_box_y, 5.1]);
  translate([-rail_width / 4 + 2.2, -rail_length /2, 5.1])
  cube([rail_inset, main_box_y, rail_gap]); 
  
  // rail system for battery box
  translate([rail_width / 4 - 13.7, -rail_length /2, 2])
  cube([rail_gap, main_box_y, 5.1]);
  translate([rail_width / 4 - 13.7, -rail_length /2, 5.1])
  cube([rail_inset, main_box_y, rail_gap]); 
  
  translate([-rail_width / 4, -rail_length / 2, 3])
  battery_box();

}
rear_robot_rail();
