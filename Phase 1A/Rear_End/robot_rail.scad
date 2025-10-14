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


module rear_robot_rail(include_apparatus = false, include_battery_box = false) {
  difference() {
    front_robot_rail(show_steering_apparatus = false);
    
    // tire apparatus cutouts
    translate([-rail_width / 2 + 25, -rail_length / 2 + 35, -rail_thickness])
     cube([ball_bearing_height - .3, 25.2, ball_bearing_outer_diameter], center = true);
    
    translate([rail_width / 2 - 25, -rail_length / 2 + 35, -rail_thickness])
     cube([ball_bearing_height - .3, 25.2, ball_bearing_outer_diameter], center = true);    
  }
    
  if (include_apparatus) {
      translate([rail_width / 2 - 25, -rail_length / 2 + 35, -45])
        rear_apparatus();
      translate([-rail_width / 2 + 25, -rail_length / 2 + 35, -45])
        rotate([0,0,180])
        rear_apparatus();
    }

  // engine support
    translate([-5, -rail_length / 2 + 30, -45])
    cube([10, 10, 48]);
   
    difference() {
        translate([-35, -rail_length / 2 + 35, -53])
        rotate([0, 90, 0])
        cylinder(h = 70, d = dc_motor_cutout_d);

        translate([-36, -rail_length / 2 + 35, -51])
        rotate([0, 90, 0])
        cylinder(h = 23, d = dc_motor_cutout_d);
        
        translate([13, -rail_length / 2 + 35, -51])
        rotate([0, 90, 0])
        cylinder(h = 23, d = dc_motor_cutout_d);   
    }

 
// rail attachments
translate([0,  -rail_length / 2, rail_thickness / 2 - .9]) {
  //color("blue")
  translate([-main_box_x / 2 + rail_inset - 2.8, 0, 0]) {
    translate([ .7, 0, 0]) 
    cube([rail_gap, main_box_y, rail_inset - 1.7]);
    translate([-4.3, 0, rail_inset - rail_gap - 1.7])
    cube([rail_inset, main_box_y, rail_gap + 1.5]);
  }

//color("yellow")
  translate([main_box_x / 2 - rail_inset - 4.8, 0, 0]) {
    translate([0, 0, 0])
    cube([rail_gap, main_box_y, rail_inset - 1.7]);
    translate([0 , 0, rail_inset - rail_gap - 1.7])
    cube([rail_inset, main_box_y, rail_gap + 1.5]);
  }
}

  if (include_battery_box) {
      translate([-rail_width / 4, -rail_length / 2, 3.6])
      battery_box();
  }

}
rear_robot_rail();
