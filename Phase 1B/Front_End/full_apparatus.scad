include <../robot_settings.scad>

use <../Rear_End/dc_motor.scad>
use <gears_overlay.scad>
use <tire_apparatus.scad>
use <steering_coupler.scad>

$fn = 50;

module full_apparatus(
      show_motor = true,
      show_turn_arm = true,
      show_coupler_bar = true,
      show_left_apparatus = true,
      show_right_apparatus = true,
      show_crossbar = true
 )
{
      if (show_motor) {
          translate([0, -133, 20]) {
            translate([0, 0, 10])
            rotate([0, 0, 90])
            dc_motor();
        }
      }
      
        // coupler
        translate([0, 65, 10])
        rotate([90, 0, 0])
        steering_coupler();
      
      if (show_turn_arm) {
        // rotation arm that connects to coupler
        translate([0, 65, 10])
        rotate([-90, 0, 0])
        cylinder(h = 20, d = ball_bearing_inner_diameter);
        translate([-4, 78, -16])
         cube([ball_bearing_inner_diameter, ball_bearing_inner_diameter, 32]);
        
        // rotation arm circle 
        difference() {
          translate([0, 78, -20])
          rotate([-90, 0, 0])
          cylinder(h=8, d=ball_bearing_inner_diameter + 4);
          
          translate([0, 77, -20])
          rotate([-90, 0, 0])
          cylinder(h=10, d=ball_bearing_inner_diameter + 1 );
        }
      }
//      
      if (show_coupler_bar) {
        // coupler bar
        translate([0, 0, 0]){
          rotate([-90, 0, 0])
          cylinder(h = 50, d = ball_bearing_inner_diameter - 0.5);
          rotate([-90, 0, 0])
          cylinder(h = 3, d  = 2 * ball_bearing_inner_diameter);
          }
      }
  
    // left apparatus
    if (show_left_apparatus) {
        difference() {
          translate([-rail_width / 2 + 3 * ball_bearing_height, 0,0])
            rotate([0, 180, 0])
              color("yellow")
              tire_apparatus(include_ball_bearing = false, include_axle = true,  rotate = false, include_steering_coupler = false, include_motor=false);
            
           // lower left apparatus pilot hole
            translate([-rail_width / 2 + 3 * ball_bearing_height,  -35, -15])
            cylinder(30, d = 3);          
          }
          
          difference() {
            // upper left apparatus pole
            translate([-rail_width / 2 + 3 * ball_bearing_height,  0, 20])
            cylinder(40, d = ball_bearing_inner_diameter - .4);
           
            // peg cutout
            translate([-rail_width / 2 + 3 * ball_bearing_height, 0, 55])    
            rotate([90,0,90])
              cylinder(h = ball_bearing_outer_diameter + 2, d = apparatus_locking_peg_d, center = true);
          }
      }

    // right apparatus
    if (show_right_apparatus) {
      difference() {
        translate([rail_width / 2 - 3 *  ball_bearing_height, 0,0])
        tire_apparatus(include_ball_bearing = false, include_axle = true, rotate = false, include_steering_coupler = false, include_motor=false);

        // lower left apparatus pilot hole
        translate([rail_width / 2 - 3 * ball_bearing_height,  -35, -15])
        cylinder(30, d = 3);
        }
      
        // upper right apparatus pole
        difference() {
            translate([rail_width / 2 - 3 * ball_bearing_height,  0, 20])
            cylinder(40, d = ball_bearing_inner_diameter - .4);
            
            // peg cutout
            translate([rail_width / 2 - 3 * ball_bearing_height, 0, 55])    
            rotate([90,0,90])
              cylinder(h = ball_bearing_outer_diameter + 2, d = apparatus_locking_peg_d, center = true);
        }
      }
      
      if (show_crossbar) {
          translate([0, 0, 13.5]) {
              difference() {
                  // top  crossbar aparatus connector
                  translate([- rail_width / 2 +  2 * ball_bearing_height, -35 - 5, -3])
                      cube([2 * rail_width / 2 - 4 * ball_bearing_height, 10, 5]);
                 
                // top right crossbar hole cutout
                translate([-rail_width / 2 + 3 *  ball_bearing_height, -35, 0])
                    cylinder  (h = 10, d = M4_diameter, center = true);
                  
                // top left crossbar hole cutout
                  translate([rail_width / 2 - 4 * ball_bearing_height + 7, -35, 0])
                    cylinder  (h = 10, d = M4_diameter, center = true);                
             }
           }         

         translate([0, 0, -13]) {
             difference() {
                   // lower  crossbar aparatus connector
                  translate([- rail_width / 2 + 2 * ball_bearing_height, -35 - 5, -3])
                      cube([2 * rail_width / 2 - 4 * ball_bearing_height, 10, 5]);
                            
                // top right crossbar hole cutout
                translate([-rail_width / 2 + 3 *  ball_bearing_height, -35, 0])
                    cylinder  (h = 10, d = M4_diameter, center = true);
                  
                // top left crossbar hole cutout
                  translate([rail_width / 2 - 4 * ball_bearing_height + 7, -35, 0])
                    cylinder  (h = 10, d = M4_diameter, center = true);       
              }
            }
         
           // bar connector
 
              difference() {
                translate([-7.5, -40, -15])
                  cube([15, 10, 30]);

                translate([0, -25, 0])
                    rotate([90, 0, 0])
                              cylinder(h = 20, d = 8);
                }
          }
}

full_apparatus();