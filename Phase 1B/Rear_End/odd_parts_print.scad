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

      // U structures holding the engine supports - seperate the verical bars by at least an engine width so manuerving the motors into the cradle is possible.
      wall_thickness = 5;
      post_thickness_x_y = 10;
      post_wallside_position_y = 12.5;
      post_separation_y = 47.5;
      post_x_position = 60.5; //note the four end positions are not "mirrored" because the zero point for each bar is on the left edge. 
      
      // posts
      translate([0, -rail_length / 2, -57.5]) {
          // center
          translate([-5, post_wallside_position_y, 0])
          cube([post_thickness_x_y, post_thickness_x_y, 64]);
//          translate([-5, post_separation_y, 0])
//          cube([post_thickness_x_y, post_thickness_x_y, 64]);
          translate([-5, 17.5, 0])
          cube([post_thickness_x_y, 40, post_thickness_x_y]);
          
          // left
          translate([-post_x_position - 10, post_wallside_position_y, 0])
          cube([post_thickness_x_y, post_thickness_x_y, 64.5]);
          translate([-post_x_position - 10, post_separation_y, 0])
          cube([post_thickness_x_y, post_thickness_x_y, 64.5]);      
                  
          // right
          translate([post_x_position, post_wallside_position_y, 0])
          cube([post_thickness_x_y, post_thickness_x_y, 64.5]);
          translate([post_x_position, post_separation_y, 0])
          cube([post_thickness_x_y, post_thickness_x_y, 64.5]); 
      }
      
      // walls and floor
      translate([0, -rail_length / 2 + 35, -55.5]) {

        // front cradle wall
        translate([0, -15, 10])
        cube([2 * post_x_position, wall_thickness, 22], center = true);
      
        // cradle floor
        translate([0, 0, .5])
        cube([2 * (post_x_position + post_thickness_x_y), 35, wall_thickness], center = true);


         translate([ -post_x_position - post_thickness_x_y, 0, 14.5]) {
             // end wall plus cutouts
            difference() {
              
                  // side wall
                  color("orange")
                  translate([0, -post_separation_y / 2 + 2.5, -14.5])
                    cube([wall_thickness, post_separation_y - 5, 22]);
                
                  // cutout for axle ring
                  translate([-dc_motor_axle_ring_z / 2, 0, 1])
                     rotate([0, 90, 0])
                        cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_axle_notch_cutout_z + 2);
                    
                    // cutouts for screws
                    translate([-dc_motor_axle_ring_z / 2, -dc_motor_screw_offset, 1])
                    rotate([0, 90, 0])
                        cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_screw_head_d + .2);
                            
                    translate([-dc_motor_axle_ring_z / 2, dc_motor_screw_offset, 1])
                    rotate([0, 90, 0])
                        cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_screw_head_d + .2);  
                } // difference
                
                difference() {
                  // inner setback wall (for countersinking)
                  translate([dc_motor_screw_head_z, -post_separation_y / 2 + 2.5, -14.5])
                      cube([wall_thickness - dc_motor_screw_head_z, post_separation_y - 5, 22]);
                      
                  // cutout for axle ring
                  translate([-dc_motor_axle_ring_z / 2, 0, 1])
                     rotate([0, 90, 0])
                        cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_axle_notch_cutout_z + 2);
                        
                    // cutouts for screws
                    translate([-dc_motor_axle_ring_z / 2, -dc_motor_screw_offset, 1])
                    rotate([0, 90, 0])
                        cylinder(h = dc_motor_axle_ring_z + 5, d = M3_shaft_d + .2);
                            
                    translate([-dc_motor_axle_ring_z / 2, dc_motor_screw_offset, 1])
                    rotate([0, 90, 0])
                        cylinder(h = dc_motor_axle_ring_z + 5, d = M3_shaft_d + .2);  
                }
                
        }  // translate

        translate([post_x_position + post_thickness_x_y - wall_thickness, 0, 14.5]) {
            // end wall plus cutouts
            difference() {
            
                // side wall
                color("green")
                translate([0, -post_separation_y / 2 + 2.5, -14.5])
                cube([wall_thickness, post_separation_y - 5, 22]);
                
                 // cutout for axle ring
                 translate([-dc_motor_screw_head_d / 2 + 1, 0, 1])
                 rotate([0, 90, 0])
                    cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_axle_notch_cutout_z + 2);

                // cutouts for screws
                translate([-dc_motor_screw_head_d / 2 + 1, -dc_motor_screw_offset, 1])
                rotate([0, 90, 0])
                    cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_screw_head_d + .2);
                        
                translate([-dc_motor_screw_head_d / 2 + 1, dc_motor_screw_offset, 1])
                rotate([0, 90, 0])
                    cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_screw_head_d + .2);
               }
               
                               
                difference() {
                 // inner setback wall (for countersinking)

                  translate([0, -post_separation_y / 2 + 2.5, -14.5])
                      cube([wall_thickness - dc_motor_screw_head_z, post_separation_y - 5, 22]);
                      
                  // cutout for axle ring
                  translate([-dc_motor_axle_ring_z / 2, 0, 1])
                     rotate([0, 90, 0])
                        cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_axle_notch_cutout_z + 2);
                        
                    // cutouts for screws
                    translate([-dc_motor_axle_ring_z / 2, -dc_motor_screw_offset, 1])
                    rotate([0, 90, 0])
                        cylinder(h = dc_motor_axle_ring_z + 5, d = M3_shaft_d + .2);
                            
                    translate([-dc_motor_axle_ring_z / 2, dc_motor_screw_offset, 1])
                    rotate([0, 90, 0])
                        cylinder(h = dc_motor_axle_ring_z + 5, d = M3_shaft_d + .2);  
                }
          }
    }
}
