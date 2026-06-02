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
use <../Front_End/full_apparatus.scad>
use <../apparatus_pegs.scad>
use <power_bar.scad>
use <drv8871.scad>
use <drv8871mount.scad>
use <../Front_End/steering_coupler.scad>
$fn = 50;
//rotate([0, -90, 0])
//tirerim();
//translate([-16, 0, 0])
//axle();

// PROTOTYPE ENGINE HOLDER - still in-work
 
        //translate([14, 0, -4.1])
        //dc_motor();
//full_apparatus();
//translate([118, 0, 0])
//axle();
//translate([98, 0, 0])
//rotate([0, -90, 0])
//color("yellow")
//tirerim();

//steering_coupler();

      // U structure holding the engine supports
      translate([-5, -rail_length / 2 + 17.5, -57])
      cube([10, 10, 64]);
      translate([-5, -rail_length / 2 + 42.5, -57])
      cube([10, 10, 64]);
      translate([-5, -rail_length / 2 + 17.5, -57])
      cube([10, 30, 10]);
      
      // engine support - engine cradles
      translate([0, -rail_length / 2 + 35, -55.5]) {
          
          cube([rail_width / 2 + 8, 35, 4], center = true);
          
          difference() {
             translate([0, 15, 10])
              cube([rail_width / 2 + 8, 5, 20], center = true);
              
              // circuit board cutout
              translate([-20.2, 10, 8])
              cube([15, 10, 15]);
          }

              
          difference() {
              translate([0, -15, 10])
              cube([rail_width / 2 + 8, 5, 20], center = true);
              
              // circuit board cutout
              translate([5.1, -20, 8])
              cube([15, 10, 15]);
          }

         // cutouts
        difference() {
            translate([-66.5, -15, 0])
            cube([3, 30, 20]);

            // cutout for axle ring
             translate([-70, 0, 14.5])
             rotate([0, 90, 0])
                cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_axle_notch_cutout_z + 2);
            
            // cutouts for screws
            translate([-70, -dc_motor_screw_offset, 14.5])
            rotate([0, 90, 0])
                cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_screw_head_d);
                    
            translate([-70, dc_motor_screw_offset, 14.5])
            rotate([0, 90, 0])
                cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_screw_head_d);  
        }

        difference() {
            translate([63.5, -15, 0])
            cube([3, 30, 20]);

            // cutout for axle ring
             translate([62, 0, 14.5])
             rotate([0, 90, 0])
                cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_axle_notch_cutout_z + 2);
            
            // cutouts for screws
            translate([63, -dc_motor_screw_offset, 14.5])
            rotate([0, 90, 0])
                cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_screw_head_d);
                    
            translate([63, dc_motor_screw_offset, 14.5])
            rotate([0, 90, 0])
                cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_screw_head_d);  
        }
    }