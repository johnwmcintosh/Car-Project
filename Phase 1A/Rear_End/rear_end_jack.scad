   include <../robot_settings.scad>
   
   // front end jack
  module back_jack(
    show_pipe = true,
    show_structure = true
    ) {
      
  if (show_structure == true) {
      // platform
      translate([0,  0, 0])
      cube([110, 110, 8], center = true);
        
      // top holder structure
      difference() {
          translate([0, 0, 108])
          cube([rail_width, 50, dc_motor_cutout_d + 20], center = true);
          
          
          translate([0, 0, 108])
          rotate([0, 90, 0])
          cylinder(h = rail_width * 2, d = 20.2, center = true);

          // right turnbox carve out
          translate([-rail_width / 3 - 30, -10, 90])
          cube([rail_width / 4, 50,  dc_motor_cutout_d + 25]); 

          // right turnbox carve out
          translate([rail_width / 3 - 20, -10, 90])
          cube([rail_width / 4, 50,  dc_motor_cutout_d + 25]);    

          translate([0, 0, 108])
            difference() {
            translate([0, 0, 22])
            cube([rail_width+ 1, 20, dc_motor_cutout_d + 20], center = true);

            translate([0, 0, 0])
            rotate([0, 90, 0])
            cylinder(h = rail_width + 1.1, d = 20, center = true);
        }
    }

    difference() {
      
      union () {
         // left post
        translate([-40, 0, 54])
        cube([8,8,108], center = true);
        
        // left back support
        translate([-40,  -26, 55])
        rotate([-25, 0, 0])
        cube([8, 8, 120], center = true);
        
        // center post
        translate([0, 0, 108/2])
        cube([8,8, 108], center = true);
       
        // center back support 
        translate([0,  -26, 55])
        rotate([-25, 0, 0])
        cube([8, 8, 120], center = true);
        
        // center post
        translate([40, 0, 108/2])
        cube([8,8, 108], center = true);
       
        // center back support 
        translate([40,  -26, 55])
        rotate([-25, 0, 0])
        cube([8, 8, 120], center = true);
      }
     
      // carve out for claim pipe (otherwise the support 
       translate([50, 0, 108])
        rotate([0, 90, 0])
        cylinder(h = 2 * rail_width, d =21, center = true);
    }
}

  if (show_pipe) {
      // clam pipe
       translate([0, 0, 108]) {
          rotate([0, 90, 0])
          cylinder(h = rail_width + 10, d = 19, center = true);
       }

       // left clam 
       translate([0, 16, 108])
       {
         // right clam
        translate([-rail_width / 2.8,  5, rail_thickness])
        cube([rail_width / 5,  40, rail_thickness], center = true);
        
        translate([-rail_width / 2.8,  5, -rail_thickness])
        cube([rail_width / 5,  40, rail_thickness], center = true);

        // left clam
        translate([rail_width / 2.8,  5, rail_thickness])
        cube([rail_width / 5,  40, rail_thickness], center = true);
        
        translate([rail_width / 2.8,  5, -rail_thickness])
        cube([rail_width / 5,  40, rail_thickness], center = true);
      }
  }
}
back_jack();