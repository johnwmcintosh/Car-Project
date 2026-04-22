include <../robot_settings.scad>

use <../Rear_End/dc_motor.scad>
use <gears_overlay.scad>
use <tire_apparatus.scad>
use <steering_motor_holder.scad>

$fn = 50;

module full_apparatus(
      show_motor = true,
      show_gear = true,
      show_left_apparatus = true,
      show_right_apparatus = true,
      show_lower_crossbar = true,
      show_upper_crossbar = true
 )
{
  if (show_motor) {
      translate([0, -93, 2])
      rotate([0, 0, 90])
      dc_motor();
    
      translate([0, -108.5, 6])
      rotate([0, 0, 90])
      steering_motor_holder();
  }

if (show_gear) {
    // gear with d-bore for the motor. This gear matches the rack on the lower crossbar
    translate([0, -32, 2]) {
      translate([0, 0, 0])
        rotate([90, 8, 0])
        color("green")
        gears_overlay("spur_gear");
        
        translate([1.7,-dc_motor_axle_cutout_z + 2, -(dc_motor_axle_cutout_z - 2) / 2 + 1.5])
        cube([dc_motor_axle_cutout_d - 2, dc_motor_axle_cutout_d + 3.5,dc_motor_axle_cutout_z - 5]); 
    }
}
  
    // left apparatus
    if (show_left_apparatus) {
        difference() {
          translate([-main_box_x + 4 * ball_bearing_height, 0,0])
            rotate([0, 180, 0])
              color("yellow")
              tire_apparatus(include_ball_bearing = false, include_axle = false);
            
           // lower left apparatus pilot hole
            translate([-main_box_x + 3 * ball_bearing_height,  -35, -15])
            cylinder(30, d = 3);          
          }
          
          difference() {
            // upper left apparatus pole
            translate([-main_box_x + 3 * ball_bearing_height,  0, 20])
            cylinder(40, d = ball_bearing_inner_diameter - .4);
           
            // peg cutout
            translate([-main_box_x + 3 * ball_bearing_height, 0, 55])    
            rotate([90,0,90])
              cylinder(h = ball_bearing_outer_diameter + 2, d = apparatus_locking_peg_d, center = true);
          }
      }

    // right apparatus
    if (show_right_apparatus) {
      difference() {
        translate([main_box_x - 4 *  ball_bearing_height, 0,0])
        tire_apparatus(include_ball_bearing = false, include_axle = false, axle_rotation = true);

        // lower left apparatus pilot hole
        translate([main_box_x - 3 * ball_bearing_height,  -35, -15])
        cylinder(30, d = 3);
        }
      
        // upper right apparatus pole
        difference() {
            translate([main_box_x - 3 * ball_bearing_height,  0, 20])
            cylinder(40, d = ball_bearing_inner_diameter - .4);
            
            // peg cutout
            translate([main_box_x - 3 * ball_bearing_height, 0, 55])    
            rotate([90,0,90])
              cylinder(h = ball_bearing_outer_diameter + 2, d = apparatus_locking_peg_d, center = true);
        }
      }
      
      if (show_upper_crossbar) {
          translate([0, 0, 13.5]) {
              difference() {
                  // top  crossbar aparatus connector
                  translate([- main_box_x +  2 * ball_bearing_height, -35 - 5, -3])
                      cube([2 * main_box_x - 3 * ball_bearing_height, 10, 5]);
                 
                // top right crossbar hole cutout
                translate([-main_box_x + 3 *  ball_bearing_height, -35, 0])
                    cylinder  (h = 10, d = M4_diameter, center = true);
                  
                // top left crossbar hole cutout
                  translate([main_box_x - 3 * ball_bearing_height + 7, -35, 0])
                    cylinder  (h = 10, d = M4_diameter, center = true);                
             }
           
            translate([0, -40,  -4])
            rotate([-90, 0, 0])
             color("yellow")
            gears_overlay("rack");
           }
      }
         
        if (show_lower_crossbar) {
           translate([0, 0, -13]) {
           difference() {
                 // lower  crossbar aparatus connector
                translate([- main_box_x + 2 * ball_bearing_height, -35 - 5, -3])
                    cube([2 * main_box_x - 3 * ball_bearing_height, 10, 5]);
                          
              // top right crossbar hole cutout
              translate([-main_box_x + 3 *  ball_bearing_height, -35, 0])
                  cylinder  (h = 10, d = M4_diameter, center = true);
                
              // top left crossbar hole cutout
                translate([main_box_x -3 * ball_bearing_height + 7, -35, 0])
                  cylinder  (h = 10, d = M4_diameter, center = true);       
            }
          }
       }
}

full_apparatus();