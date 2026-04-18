include <../robot_settings.scad>

use <../Front_End/robot_rail.scad>
use <../Front_End/tire_apparatus.scad>
use <../Front_End/tire_rim.scad>
use <../Front_End/dc_motor_mount.scad>
use <../Front_End/axle_for_custom_hub.scad>
//use <../Front_End/MCAD/involute_gears.scad>
use <../Front_End/gears_overlay.scad>
use <../Front_End/Battery_box_2.scad>
use <dc_motor.scad>
use <../spring_library.scad>

use <rear_apparatus.scad>
use <../apparatus_pegs.scad>
use <power_bar.scad>
use <drv8871.scad>
use <drv8871mount.scad>
$fn = 50;
rotate([0, -90, 0])
tirerim();
translate([-16, 0, 0])
axle();

// PROTOTYPE ENGINE HOLDER - still in-work
  /*
        translate([14, 0, -4.1])
        dc_motor();


        translate([0, 0, 0]) {
            difference() {
                color("red")
                difference() {
                  translate([0, 0, -7])
                  rotate([0, 90, 0])
                  cylinder(h = 66, d = dc_motor_cutout_d);
          
                 // axle hole
                translate([60, 0, -4])
                  rotate([0, 90, 0])
                  cylinder(h = 20, d = dc_motor_screw_offset);
                 
                 // screw hole
                translate([60, dc_motor_screw_offset, -4])
                 rotate([0, 90, 0])
                 cylinder(h = 20, d = dc_motor_screw_d);
                 
                 // screw hole
                translate([60, -dc_motor_screw_offset, -4])
                 rotate([0, 90, 0])
                 cylinder(h = 20, d = dc_motor_screw_d);
              }
 
             color("green") 
              translate([4, 0, -4])
              rotate([0, 90, 0])
              cylinder(h = 58.5, d = dc_motor_cutout_d + 1);   

              // curcuit board connector cutout
              translate([4, 10, -12])
              cube([7, 3,  5]);
          }
      }
      */