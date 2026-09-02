include <../robot_settings.scad>

module steering_motor_holder(end_cap_offset = dc_motor_75_1_z) {
        translate([0, 0, 0]) {
            //difference() {
                color("red")
                difference() {
                  translate([0, 0, -7])
                  rotate([0, 90, 0])
                  cylinder(h =  end_cap_offset + 9.5, d = dc_motor_cutout_d);
          
                 // axle hole
                translate([end_cap_offset, 0, -4])
                  rotate([0, 90, 0])
                  cylinder(h = 20, d = dc_motor_screw_offset);
                 
                 // screw hole
                translate([end_cap_offset, dc_motor_screw_offset, -4])
                 rotate([0, 90, 0])
                 cylinder(h = 20, d = dc_motor_screw_d);
                 
                 // screw hole
                translate([end_cap_offset, -dc_motor_screw_offset, -4])
                 rotate([0, 90, 0])
                 cylinder(h = 20, d = dc_motor_screw_d);
   
                color("green") 
                translate([4, 0, -4])
                rotate([0, 90, 0])
                cylinder(h = end_cap_offset + 2, d = dc_motor_cutout_d + 1);   

                // curcuit board connector cutout
                translate([7.5, 10, -12])
                cube([7, 3,  5]);
          }
      }

              //}
    }
    steering_motor_holder();