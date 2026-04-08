$fn = 50;
include <../robot_settings.scad>
use <steering_coupler.scad>

 module dc_motor_mount(
      show_steering_shaft = true, 
      show_mount = false, 
      show_coupler = false
      ) 
      {

if (show_mount) {
    // mount with hole
  difference() {
    cube([
      steering_motor_mount_x, 
      steering_motor_mount_y, 
      dc_motor_axle_ring_z
    ], center = true);
    
    // steering rod hole in mount
    translate([0,0, -dc_motor_axle_ring_z / 2 - 1])
        cylinder(
          h = dc_motor_axle_ring_z + 2, 
          d = ball_bearing_inner_diameter
        );
    
    // side screw hole
    translate([dc_motor_screw_offset,0, -dc_motor_axle_ring_z / 2 - 1])
      cylinder(
        h = dc_motor_axle_ring_z + 2,
        d = dc_motor_screw_d
      );
    
    // side scew hole
    translate([-dc_motor_screw_offset, 0, -dc_motor_axle_ring_z / 2 - 1])
    cylinder(
      h = dc_motor_axle_ring_z + 2,
      d = dc_motor_screw_d
    ); 
    
    // couter sink
    translate([dc_motor_screw_offset,0,-dc_motor_axle_ring_z / 2 - .1])
    cylinder(
      h = dc_motor_screw_head_z,
      d = dc_motor_screw_head_d
    );
    
    // counter sink
    translate([-dc_motor_screw_offset,0,-dc_motor_axle_ring_z / 2 - .1])
    cylinder(
      h = dc_motor_screw_head_z,
      d = dc_motor_screw_head_d
    );
   }
  }

  if (show_steering_shaft) {
      // motor connection
        // shorten the main shaft
      
    translate([0,0, -steering_shaft_z - dc_motor_axle_ring_z / 2 - coupler_length + coupler_gear_side_insert]) {
        difference() {
        color("blue")
        cylinder(h = steering_shaft_z, d = ball_bearing_inner_diameter);
     }
      
      // key
      translate([0, ball_bearing_inner_diameter - 3, 15])
        cube([ball_bearing_inner_diameter / 3 - .6 , 1.9, 30], center = true);
     }
    
    if (show_coupler) {
      translate([0, 0,  - coupler_length / 2 - dc_motor_axle_ring_z / 2])
      rotate([0, 0, 90])
      steering_coupler();
    }
  }
}
dc_motor_mount(show_steering_shaft = true);