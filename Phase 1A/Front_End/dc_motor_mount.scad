$fn = 50;
include <../robot_settings.scad>

 module dc_motor_mount(show_steering_shaft = false, show_mount = true) {

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
      
    translate([0,0, -steering_shaft_z - 15.5]) {
      difference() {
      color("blue")
      cylinder(h = steering_shaft_z, d = ball_bearing_inner_diameter);
      // axle cutout
      translate([0, 0, -dc_motor_axle_cutout_z + steering_shaft_z + .2])
            cylinder(h = dc_motor_axle_cutout_z , d = dc_motor_axle_cutout_d - .4);
      }
      // key
      translate([ball_bearing_inner_diameter - 3, 0, 22])
        cube([ball_bearing_inner_diameter /3 , 1.9, 30], center = true);
      
        // d brace
       translate([-dc_motor_axle_cutout_d / 2, dc_motor_axle_notch_cutout + 1.24, steering_shaft_z - ball_bearing_height - 1.8  ])
      color("green")
       cube([dc_motor_axle_cutout_d, dc_motor_axle_notch_cutout , ball_bearing_height + 2]);
      
      union()
        
      difference() 
       {
           // so that a 1 mm in diameter larger cap is on top
          translate([0, 0, steering_shaft_z ])
            color("red")
            cylinder(h = ball_bearing_height, d = ball_bearing_inner_diameter + .05);
         
         // axle cutout
          translate([0, 0, -dc_motor_axle_cutout_z + steering_shaft_z + ball_bearing_height + 2])
            cylinder(h = dc_motor_axle_cutout_z , d = dc_motor_axle_cutout_d - .4);          
         
       }
                
          // d brace
         translate([-dc_motor_axle_cutout_d / 2 , dc_motor_axle_notch_cutout + 1.24, steering_shaft_z - 2])
         cube([dc_motor_axle_cutout_d, dc_motor_axle_notch_cutout , ball_bearing_height]);
      
    }

  }
}
dc_motor_mount(show_steering_shaft = true);