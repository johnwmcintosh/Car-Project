$fn = 50;
include <../robot_settings.scad>

 module dc_motor_mount(show_steering_shaft = true, show_mount = true) {

if (show_mount) {
    // mount with hole
  difference() {
    cube([
      steering_motor_mount_x, 
      steering_motor_mount_y, 
      dc_motor_axle_ring_z
    ], center = true);
    
    translate([0,0, -dc_motor_axle_ring_z / 2 - 1])
        cylinder(
          h = dc_motor_axle_ring_z + 2, 
          d = ball_bearing_inner_diameter
        );
    
    translate([dc_motor_screw_offset,0, -dc_motor_axle_ring_z / 2 - 1])
      cylinder(
        h = dc_motor_axle_ring_z + 2,
        d = dc_motor_screw_d
      );
    
    translate([-dc_motor_screw_offset, 0, -dc_motor_axle_ring_z / 2 - 1])
    cylinder(
      h = dc_motor_axle_ring_z + 2,
      d = dc_motor_screw_d
    ); 
    
    translate([dc_motor_screw_offset,0,-dc_motor_axle_ring_z / 2 - .1])
    cylinder(
      h = dc_motor_screw_head_z,
      d = dc_motor_screw_head_d
    );
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
      
    translate([-40,60, -steering_shaft_z]) {
      cylinder(h = steering_shaft_z, d = ball_bearing_inner_diameter);
        
      union()
        
      difference() 
       {
           // so that a 1 mm in diameter larger cap is on top
          translate([0, 0, steering_shaft_z])
            cylinder(h = ball_bearing_height, d = ball_bearing_inner_diameter);
          
         // axle cutout
          translate([0, 0, -dc_motor_axle_cutout_z + steering_shaft_z + ball_bearing_height])
            cylinder(h = dc_motor_axle_cutout_z + .1, d = dc_motor_axle_cutout_d - .2);           
       }
       
       // d brace
       translate([-dc_motor_axle_cutout_d / 2 , dc_motor_axle_notch_cutout, steering_shaft_z])
       cube([dc_motor_axle_cutout_d, dc_motor_axle_notch_cutout, ball_bearing_height]);
    }
  }
}
dc_motor_mount(show_steering_shaft = true);