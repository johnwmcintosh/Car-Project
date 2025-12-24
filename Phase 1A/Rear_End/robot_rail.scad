include <../robot_settings.scad>

use <../Front_End/robot_rail.scad>
use <../Front_End/tire_apparatus.scad>
use <../Front_End/dc_motor_mount.scad>
use <../spring_library.scad>
use <../Front_End/MCAD/involute_gears.scad>
use <../Front_End/OpenSCAD_Gear_Library_with_Customizer/files/gears.scad>
use <../Front_End/Battery_box_2.scad>
use <pd_mount.scad>
use <lidar_circuitboard_mount.scad>

use <rear_apparatus.scad>
use <power_bar.scad>
use <drv8871.scad>
use <drv8871mount.scad>
use <breadboard_mount.scad>
$fn = 50;


module rear_robot_rail(
    include_apparatus = false, 
    include_battery_box = false,
    include_power_bar = false
    ) 
    {
    difference() {
      front_robot_rail(show_steering_apparatus = include_apparatus);
      
      // tire apparatus cutouts
      translate([-rail_width / 2 + 25, -rail_length / 2 + 35, -rail_thickness])
       cube([ball_bearing_height - .3, 25.2, ball_bearing_outer_diameter], center = true);
      
      translate([rail_width / 2 - 25, -rail_length / 2 + 35, -rail_thickness])
      cube([ball_bearing_height - .3, 25.2, ball_bearing_outer_diameter], center = true); 
   
      // power bar wire passthrough cutouts
      translate([rail_width / 3 - 10,  power_bar_y / 2 + 26, 0])
      cube([power_bar_y / 3, power_bar_cutout_x , 2 * rail_thickness], center = true);
        
      // power bar wire passthrough cutouts
      translate([-rail_width / 3 + 10,  power_bar_y / 2 + 26, 0])
      cube([power_bar_y / 3, power_bar_cutout_x, 2 * rail_thickness], center = true);
 
      // Pi's power passthrough
      translate([-rail_width / 3 + 10, power_bar_y / 2 - 75, 0])
      cube([power_bar_y /2.3, 60, 2 * rail_thickness], center = true); // the divisor 2.3 result in a little over 8 mm which allows the min-HDMI plug
      }

    if (include_apparatus) {
        translate([rail_width / 2 - 25, -rail_length / 2 + 35, -45])
          rear_apparatus();
        translate([-rail_width / 2 + 25, -rail_length / 2 + 35, -45])
          rotate([0,0,180])
          rear_apparatus();
      }

    // engine support
      translate([-5, -rail_length / 2 + 30, -41])
      cube([10, 10, 44]);
     
      difference() {
          //color("red")
          translate([-75, -rail_length / 2 + 35, -47])
          rotate([0, 90, 0])
          cylinder(h = 149, d = dc_motor_cutout_d);

          translate([-76, -rail_length / 2 + 35, -44])
          rotate([0, 90, 0])
          cylinder(h = 69, d = dc_motor_cutout_d + 1);
          
          translate([7, -rail_length / 2 + 35, -44])
          rotate([0, 90, 0])
          cylinder(h = 69, d = dc_motor_cutout_d + 1);   

          // curcuit board connector cutout
          translate([15.5, -rail_length / 2 + 45, -52])
          cube([7, 3,  5]);

          // curcuit board connector cutout
          translate([-22.5, -rail_length / 2 + 45, -52])
          cube([7, 3,  5]);   
      }
      
      // engine holder support bar
      difference() {
        translate([-149/2, -rail_length / 2 + 34.5, -58.5])
        rotate([90,0,90])
        cylinder(h = 148, d = 5);
        
        translate([-149/2 - 1, -rail_length / 2 + 29.5, -58.5])
        cube([151, 10, 3]);
      }
   
    // rail attachments
    difference() {
      union() {
        translate([0,  -rail_length / 2, rail_thickness / 2 - .95]) {
            translate([-main_box_x / 2 + rail_inset - 2.9, 0, 0]) {
              color("blue")
              translate([ .5, 0, 0]) 
              cube([rail_gap, main_box_y, rail_inset - 1.7]);
              
              color("red")
              translate([-4.4, -0, rail_inset - rail_gap - 1.8])
              cube([rail_inset - .1, main_box_y, rail_gap + 1.7]);
            }

          //color("yellow")
            translate([main_box_x / 2 - rail_inset - 4.65, 0, 0]) {
              color("blue")
              translate([0, 0, 0])
              cube([rail_gap, main_box_y, rail_inset - 1.7]);
              
              color("yellow")
              translate([0 , 0, rail_inset - rail_gap - 1.8])
              cube([rail_inset - .1, main_box_y, rail_gap + 1.7]);
              }
          }
      }
      
      // peg cutout
      translate([0, -105, 7.5])
      rotate([0, 90, 0])
      cylinder(h = 150, d = 3, center = true); 
    }

      // peg for battery box
     // translate([-3, -105, 7.5])
      //rotate([0, 90, 0])
      //cylinder(h = 97, d = 3.02, center = true); 
    
    // drv8871 Adafruit platform UPPER
    translate([drv8871_screw_distance + drv8871_x, rail_length / 2 - 1.5 * drv8871_y, rail_thickness / 2 - .25])
    drv8871mount();
    
    // drv8871 Teyleten platform UPPER
    translate([drv8871_screw_distance + drv8871_x, rail_length / 2 - 2.9 * drv8871_y, rail_thickness / 2 - .25])
    rotate([0,0,90])
    drv8871mount("Teyleten");

    // lidar circuitboard mound
    translate([-drv8871_screw_distance - drv8871_x, rail_length / 2 - lidar_cord_length, rail_thickness / 2 - .25])
    rotate([0,0,0])
    lidar_circuitboard_mount();
    
    // drv8871 Adafruit platform LOWER LEFT
    translate([- drv8871_screw_distance, -rail_length / 2 + 3 * drv8871_y, -rail_thickness / 2 + .25])
    rotate([180,0,-90])
    drv8871mount();
 
    // drv8871 Teyleten platform LOWER LEFT
    translate([- drv8871_screw_distance, -rail_length / 2 + 4 * drv8871_y, -rail_thickness / 2 + .25])
    rotate([180,0,-90])
    drv8871mount("Teyleten");    
    
    // drv8871 Adafruit platform LOWER RIGHT
    translate([drv8871_screw_distance + 10, -rail_length / 2 + 3 * drv8871_y, -rail_thickness / 2  + .25 ])
    rotate([180,0,90])
    drv8871mount();
      
   // drv8871 Teyleten platform LOWER RIGHT
  translate([drv8871_screw_distance + 10, -rail_length / 2 + 4 * drv8871_y, -rail_thickness / 2  + .25 ])
    rotate([180,0,90])
    drv8871mount("Teyleten"); 
    
    // pd mount
    translate([- drv8871_screw_distance - 60, -rail_length / 2 + 5.1 * pdmount_y, -rail_thickness / 2 - 1])
    rotate([180,0,0])
    pdmount();
    
    // breadboard mount
    translate([0, 7, rail_thickness / 2  + 5])
    rotate([0,0,-90])
    breadboard_mount();
    
    // power bar stand LEFT
    difference() {
      translate([-rail_width / 3 - 10, 80,  rail_thickness / 2 - .6 ])
      cylinder(h = power_bar_standoff_z, d = power_bar_standoff_d);
      
      // pilot hole for screw
      translate([-rail_width / 3 - 10, 80,  rail_thickness / 2 - .5 ])
      cylinder(h = power_bar_standoff_z, d = 1.5);
      }
    
      difference() {
      translate([-rail_width / 3 - 10, 80-power_bar_screw_distance, rail_thickness / 2 - .6])
      cylinder(h = power_bar_standoff_z, d = power_bar_standoff_d);
          
       // pilot hole for screw
      translate([-rail_width / 3 - 10, 80-power_bar_screw_distance, rail_thickness / 2 - .5])
      cylinder(h = power_bar_standoff_z, d = 1.5);
      }
        
    if (include_power_bar) {
      translate([-rail_width / 3 - 10, 80 -power_bar_screw_distance / 2, rail_thickness / 2 + power_bar_standoff_z])
      rotate([0, 0, 90])        
      power_bar();
    }
    
    // power bar label LEFT
    color("blue")
    translate([-rail_width / 3 - power_bar_y / 2, power_bar_y / 2 - 36,  rail_thickness / 2])
    linear_extrude(1)
      text("5V", 6);
     
    color("green")
    translate([-rail_width / 3 - power_bar_y / 2 - 13, power_bar_y / 2 - 36,  rail_thickness / 2])
      linear_extrude(1)
      text("N", 6);
    
    // power bar stand RIGHT
    difference() {
      translate([rail_width / 3 + 10, 80,  rail_thickness / 2 - .6 ])
      cylinder(h = power_bar_standoff_z, d = power_bar_standoff_d);
      
      // pilot hole for screw
      translate([rail_width / 3 + 10, 80,  rail_thickness / 2 - .5 ])
      cylinder(h = power_bar_standoff_z, d = 1.5);
    }

  difference() {
      translate([rail_width / 3 + 10, 80-power_bar_screw_distance, rail_thickness / 2 - .6])
      cylinder(h = power_bar_standoff_z, d = power_bar_standoff_d);

      // pilot hole for screw
      translate([rail_width / 3 + 10, 80-power_bar_screw_distance, rail_thickness / 2 - .5])
      cylinder(h = power_bar_standoff_z, d = 1.5);
  }
    
    if (include_power_bar) {
      translate([rail_width / 3 + 10, 80 -power_bar_screw_distance / 2, rail_thickness / 2 + power_bar_standoff_z])
      rotate([0, 0, 90])
        power_bar();
    }
    
    // power bar label RIGHT
    color("red")
    translate([rail_width / 3 - power_bar_y / 2 + 3, power_bar_y / 2 - 36,  rail_thickness / 2])
      linear_extrude(1)
      text("12V", 6);
      
    color("green")
    translate([rail_width / 3 + power_bar_y / 2 + 5, power_bar_y / 2 - 36,  rail_thickness / 2])
      linear_extrude(1)
      text("N", 6);

    
    if (include_battery_box) {
        translate([-rail_width / 4, -rail_length / 2, 3.6])
        battery_box();
    }

}
rear_robot_rail();
