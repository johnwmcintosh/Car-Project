include <../robot_settings.scad>
use <../spring_library.scad>

use <rear_apparatus_leaf.scad>

use <../Front_End/axle_for_custom_hub.scad>
use <../Front_End/tire_rim.scad>
use <../Front_End/tire_apparatus.scad>

$fn = 50;
    
 module rear_apparatus2(
      flip_apparatus = false, 
      include_motor = true, 
      include_coupler = true, 
      include_apparatus = true,
      include_leaf = true,
      motor_x_offset = 0,
      motor_z_offset = 0)
 {
 
 difference() {
      tire_apparatus(
          include_armature = false, 
          include_axle = true,
          rotate = !flip_apparatus,
          include_apparatus = include_apparatus,
          include_motor =  include_motor, 
          include_steering_coupler = include_coupler,
          motor_x_offset = motor_x_offset,
          motor_z_offset = motor_z_offset);
          
          // holes that provide a pathway for an allen wrench to screw the motor to the frame.
//          translate([-10, 8,0])
//          rotate([0, 90, 0])
//          cylinder(h = 20, r = 2);
//          
//          translate([-10, -8,0])
//          rotate([0, 90, 0])
//          cylinder(h = 20, r = 2);
        }

       if (include_leaf) {
         // suspension
         translate([0,0,0])
          rear_apparatus_leaf();
     }
 }
 rear_apparatus2();