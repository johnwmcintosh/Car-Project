$fn = 50;
include <robot_settings.scad>

 module stepper_motor_mount(show_steering_shaft = true, show_mount = true) {

if (show_mount) {
    // mount with hole
    difference() {
      cube([stepper_mount_x, stepper_mount_y, stepper_mount_z], center = true);
      translate([0,0,-6])
        cylinder(
          h = stepper_steering_shaft_cutout_z, 
          d = stepper_steering_shaft_cutout_d
      );
    }
  }  
 
  if (show_steering_shaft) {
      // motor connection
        // shorten the main shaft
      translate([0,0, -steering_shaft_z + stepper_mount_z - 5]) {
      cylinder(h = steering_shaft_z - stepper_mount_z, d = ball_bearing_inner_diameter);
        union()
       difference() 
        {
           // so that a 1 mm in diameter larger cap is on top
          translate([0, 0, steering_shaft_z - stepper_mount_z])
            cylinder(h = stepper_mount_z, d = steering_shaft_motor_fitting_d);
                   
          translate([0, 0, steering_shaft_z - stepper_axle_mount_z])
            cylinder(h = stepper_axle_mount_z + 1, d = stepper_axle_mount_d);
          
          // axle insert
          translate([0, 0, steering_shaft_z - stepper_mount_z + 2.11]) 
          {
              difference() {
                  cylinder(
                    h = stepper_axle_cutout_z, 
                    d = stepper_axle_cutout_d
                  );
                
                  translate([0, stepper_axle_cutout_side + .25, stepper_axle_cutout_z / 2]) 
                  cube([6, stepper_axle_cutout_side, stepper_axle_cutout_z + 1], center = true);

                  translate([0, -stepper_axle_cutout_side - .25, stepper_axle_cutout_z / 2]) 
                  cube([6, stepper_axle_cutout_side, stepper_axle_cutout_z + 1], center = true);  
                }
              }      
          }
      }
  }
}
stepper_motor_mount();