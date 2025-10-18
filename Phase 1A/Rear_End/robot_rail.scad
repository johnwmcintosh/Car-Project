include <../robot_settings.scad>

use <../Front_End/robot_rail.scad>
use <../Front_End/tire_apparatus.scad>
use <../Front_End/dc_motor_mount.scad>
use <../spring_library.scad>
use <../Front_End/MCAD/involute_gears.scad>
use <../Front_End/OpenSCAD_Gear_Library_with_Customizer/files/gears.scad>
use <../Front_End/Battery_box_2.scad>

use <rear_apparatus.scad>
use <power_bar.scad>
use <drv8871.scad>
use <drv8871mount.scad>
$fn = 50;


module rear_robot_rail(
    include_apparatus = false, 
    include_battery_box = false,
    include_power_bar = false
    ) 
    {
    difference() {
      front_robot_rail(show_steering_apparatus = false);
      
      // tire apparatus cutouts
      translate([-rail_width / 2 + 25, -rail_length / 2 + 35, -rail_thickness])
       cube([ball_bearing_height - .3, 25.2, ball_bearing_outer_diameter], center = true);
      
      translate([rail_width / 2 - 25, -rail_length / 2 + 35, -rail_thickness])
       cube([ball_bearing_height - .3, 25.2, ball_bearing_outer_diameter], center = true); 
   
      // power bar wire passthrough cutouts
      translate([0,  power_bar_y / 2 + 5, 0])
      cube([power_bar_x, power_bar_y / 3, 2 * rail_thickness], center = true);
   
      // power bar wire passthrough cutouts
      translate([0,  -power_bar_y / 2 - 5, 0])
      cube([power_bar_x, power_bar_y / 3, 2 * rail_thickness], center = true);
    }
      
    if (include_apparatus) {
        translate([rail_width / 2 - 25, -rail_length / 2 + 35, -45])
          rear_apparatus();
        translate([-rail_width / 2 + 25, -rail_length / 2 + 35, -45])
          rotate([0,0,180])
          rear_apparatus();
      }

    // engine support
      translate([-5, -rail_length / 2 + 30, -43])
      cube([10, 10, 46]);
     
      difference() {
          //color("red")
          translate([-74, -rail_length / 2 + 35, -49])
          rotate([0, 90, 0])
          cylinder(h = 149, d = dc_motor_cutout_d);

          translate([-76, -rail_length / 2 + 35, -46])
          rotate([0, 90, 0])
          cylinder(h = 69, d = dc_motor_cutout_d + 1);
          
          translate([7, -rail_length / 2 + 35, -46])
          rotate([0, 90, 0])
          cylinder(h = 69, d = dc_motor_cutout_d + 1);   

          // curcuit board connector cutout
          translate([15, -rail_length / 2 + 45, -54])
          cube([7, 3,  5]);

          // curcuit board connector cutout
          translate([-22, -rail_length / 2 + 45, -54])
          cube([7, 3,  5]);   
      }

      
    // rail attachments
    translate([0,  -rail_length / 2, rail_thickness / 2 - .9]) {
      color("blue")
      translate([-main_box_x / 2 + rail_inset - 2.9, 0, 0]) {
        translate([ .7, 0, 0]) 
        cube([rail_gap, main_box_y, rail_inset - 1.7]);
        translate([-4.4, 0, rail_inset - rail_gap - 1.7])
        cube([rail_inset + .1, main_box_y, rail_gap + 1.5]);
      }

    //color("yellow")
      translate([main_box_x / 2 - rail_inset - 4.65, 0, 0]) {
        translate([0, 0, 0])
        cube([rail_gap, main_box_y, rail_inset - 1.7]);
        translate([0 , 0, rail_inset - rail_gap - 1.7])
        cube([rail_inset - .1, main_box_y, rail_gap + 1.5]);
      }
    }
    
    // drv8871 platform
    translate([- drv8871_screw_distance - 25, -rail_length / 2 + 3 * drv8871_y, -rail_thickness / 2 + .25])
    rotate([180,0,90])
    drv8871mount();
       
    // drv8871 platform
    translate([drv8871_screw_distance + 25, -rail_length / 2 + 3 * drv8871_y, -rail_thickness / 2  + .25 ])
    rotate([180,0,-90])
    drv8871mount();
    

    if (include_power_bar) {
      translate([0, 0, rail_thickness / 2 + power_bar_standoff_z])
        power_bar();
    }
    
    // power bar stand
    translate([- power_bar_screw_distance / 2, 0,  rail_thickness / 2 - .6 ])
    cylinder(h = power_bar_standoff_z, d = power_bar_standoff_d);

    // power bar stand
    translate([power_bar_screw_distance / 2, 0,  rail_thickness / 2 - .6 ])
    cylinder(h = power_bar_standoff_z, d = power_bar_standoff_d);
    
    // power bar label
    color("red")
    translate([power_bar_screw_distance / 2 + 5, power_bar_y / 2 - 6,  rail_thickness / 2])
      linear_extrude(1)
      text("12 V", 6);
    
    // power bar label
    color("green")
    translate([power_bar_screw_distance / 2 + 5, -power_bar_y / 2,  rail_thickness / 2])
    linear_extrude(1)
      text("5 V", 6);
    
    if (include_battery_box) {
        translate([-rail_width / 4, -rail_length / 2, 3.6])
        battery_box();
    }

}
rear_robot_rail();
