include <../robot_settings.scad>
use <../spring_library.scad>
use <dc_motor.scad>
use <../Front_End/axle_for_custom_hub.scad>
use <../Front_End/tire_rim.scad>
use <../Front_End/tire_apparatus.scad>

$fn = 50;
    
 module rear_apparatus2(
      flip_apparatus = true, 
      include_motor = false, 
      include_coupler = false, 
      include_apparatus = true,
      motor_z_offset = 0)
 {
 
 difference() {
      tire_apparatus(
          include_armature = false, 
          include_axle = false,
          rotate = !flip_apparatus,
          include_apparatus = include_apparatus,
          include_motor =  include_motor, 
          include_steering_coupler = include_coupler,
          motor_z_offset = motor_z_offset);
          
          // holes that provide a pathway for an allen wrench to screw the motor to the frame.
          translate([-10, 8,0])
          rotate([0, 90, 0])
          cylinder(h = 20, r = 2);
          
          translate([-10, -8,0])
          rotate([0, 90, 0])
          cylinder(h = 20, r = 2);
        }

       if (include_apparatus) {
         // suspension
         if (flip_apparatus) {
             difference() {
                translate([0, 0,  ball_bearing_outer_diameter - 4])
                springLeaf(width = ball_bearing_height, len =  30, height = 10, thickness = 3);
                
                // remove the bit of the spring leaf from the inner circle
                translate([-1, 0, 0])
                 rotate([0, 90, 0])
                 cylinder(h = 5, d = ball_bearing_outer_diameter + 1);
             }
         }
         else {
             difference() {
                translate([0, 0,  ball_bearing_outer_diameter - 4])
                springLeaf(width = ball_bearing_height, len =  30, height = 10, thickness = 3);
                
                // remove the bit of the spring leaf from the inner circle
                translate([-4, 0, 0])
                 rotate([0, 90, 0])
                 cylinder(h = 5, d = ball_bearing_outer_diameter + 1);
             }
          }
      

       translate([0, 0, -2.5]) {
            // body connector 
            difference() {
                translate([
                    0, 0, 2 * ball_bearing_outer_diameter
                   ])
                  // the rail cutout for this is 
                  // x-> ball_bearing_height - .3
                  // y -> 25.2
                    cube([ball_bearing_height - .75, 24.5, ball_bearing_outer_diameter + 7], center = true);
                 
                    // cutout for peg
                   translate([
                      0,0, 2 * ball_bearing_outer_diameter + rail_thickness
                   ]) 
                   rotate([90,0,90])
                   cylinder(h = ball_bearing_outer_diameter + 2, d = apparatus_locking_peg_d, center = true);
               }
              
              // stability bar
              translate(
                  [
                      -2 * ball_bearing_height,
                      -ball_bearing_height, 
                       2 * ball_bearing_outer_diameter - rail_thickness + 0.5
                 ])
                cube([4 * ball_bearing_height, 15, 4]);
            
            // attachment bar supports
            
            larger_x = flip_apparatus
                ? 2 * ball_bearing_height - 12
                : -ball_bearing_height / 2 - 10.5;          
            
            // larger one
            
            // side wall
              translate([
                  larger_x, 6, 2 * ball_bearing_outer_diameter - 11
                ])
                cube([12,2,5]);
            
            // side wall
            translate([
                larger_x, -7, 2 * ball_bearing_outer_diameter - 11
              ])
              cube([12,2,5]);
     
            // angled reinformace
            if (flip_apparatus) {
                 translate([
                    larger_x, 6, 2 * ball_bearing_outer_diameter - 13.9
                    ])
                rotate([0, -25, 0])
                cube([12,2,4]);
          }
            else {
               translate([
                      larger_x, 6, 2 * ball_bearing_outer_diameter - 8.8
                    ])
                rotate([0, 25, 0])
                cube([12,2,4]);
            }
            
             // angled reinformace
            if (flip_apparatus) {
                translate([
                     larger_x, -7, 2 * ball_bearing_outer_diameter - 13.9
                    ])
                rotate([0, -25,0])
                cube([12,2,4]);
            }
            else { 
                 translate([
                     larger_x, -7, 2 * ball_bearing_outer_diameter - 8.8
                    ])
                rotate([0, 25,0])
                cube([12,2,4]);
            }

          // smaller one
            if (flip_apparatus) {
               translate([
                  -ball_bearing_height /2 - 10.5, 6, 2 * ball_bearing_outer_diameter - 8
                ])
                cube([12,2,2]);
         
               translate([
                  -ball_bearing_height /2 - 10.5, -7, 2 * ball_bearing_outer_diameter - 8
                ])
                cube([12,2,2]);
            }
            else {
               translate([
                  ball_bearing_height /2 - 1.5, 6, 2 * ball_bearing_outer_diameter - 8
                ])
                cube([12,2,2]);
         
               translate([
                  ball_bearing_height /2 - 1.5, -7, 2 * ball_bearing_outer_diameter - 8
                ])
                cube([12,2,2]);
             }
         }
     }
 }
 rear_apparatus2();