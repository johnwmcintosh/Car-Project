include <../robot_settings.scad>

module steering_motor_holder() {
        translate([0, 0, 0]) {
            difference() {
                color("red")
                difference() {
                  translate([0, 0, -7])
                  rotate([0, 90, 0])
                  cylinder(h = 67, d = dc_motor_cutout_d);
          
                 // axle hole
                translate([60, 0, -4])
                  rotate([0, 90, 0])
                  cylinder(h = 20, d = dc_motor_screw_offset);
                 
                 // screw hole
                translate([60, dc_motor_screw_offset, -4])
                 rotate([0, 90, 0])
                 cylinder(h = 20, d = dc_motor_screw_d);
                 
                 // screw hole
                translate([60, -dc_motor_screw_offset, -4])
                 rotate([0, 90, 0])
                 cylinder(h = 20, d = dc_motor_screw_d);
              }
 
             color("green") 
              translate([4, 0, -4])
              rotate([0, 90, 0])
              cylinder(h = 59.5, d = dc_motor_cutout_d + 1);   

              // curcuit board connector cutout
              translate([7.5, 10, -12])
              cube([7, 3,  5]);
          }
      }
    }
    steering_motor_holder();