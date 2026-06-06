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
translate([0, 0, -0]) {

      // U structure holding the engine supports - seperate the verical bars by at least an engine width so manuerving the motors into the cradle is possible.
      translate([-5, -rail_length / 2 + 12.5, -57])
      cube([10, 10, 64]);
      translate([-5, -rail_length / 2 + 47.5, -57])
      cube([10, 10, 64]);
      translate([-5, -rail_length / 2 + 17.5, -57])
      cube([10, 40, 10]);
      
              
      translate([0, -rail_length / 2 + 35, -55.5]) {

        // front cradle wall
        translate([0, -15, 10])
        cube([rail_width / 2 + 12, 5, 20], center = true);
      
        // cradle floor
          cube([rail_width / 2 + 12, 35, 4], center = true);
          
          difference() {
            // back cradle wall
             translate([0, 15, 10])
              cube([rail_width / 2 + 12, 5, 20], center = true);
              
              // circuit board cutout
              translate([-15, 10, 8])
              cube([10, 10, 15]);
              
              // circuit board cutout
              translate([5, 10, 8])
              cube([10, 10, 15]);    
          }

         // cutouts
        difference() {
            translate([-68.5, -15, 0])
            cube([3, 30, 20]);

            // cutout for axle ring
             translate([-70, 0, 14.5])
             rotate([0, 90, 0])
                cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_axle_notch_cutout_z + 2);
            
            // cutouts for screws
            translate([-70, -dc_motor_screw_offset, 14.5])
            rotate([0, 90, 0])
                cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_screw_head_d + .2);
                    
            translate([-70, dc_motor_screw_offset, 14.5])
            rotate([0, 90, 0])
                cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_screw_head_d + .2);  
        }

        difference() {
            translate([65.5, -15, 0])
            cube([3, 30, 20]);
            
            // cutout for axle ring
             translate([63.5, 0, 14.5])
             rotate([0, 90, 0])
                cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_axle_notch_cutout_z + 2);

            // cutouts for screws
            translate([63, -dc_motor_screw_offset, 14.5])
            rotate([0, 90, 0])
                cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_screw_head_d + .2);
                    
            translate([63, dc_motor_screw_offset, 14.5])
            rotate([0, 90, 0])
                cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_screw_head_d + .2);
        }
    }
  }