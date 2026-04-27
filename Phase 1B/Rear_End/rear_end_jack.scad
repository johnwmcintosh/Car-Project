   include <../robot_settings.scad>
   use <clampipe.scad>
   
   // front end jack
  module back_jack(
    show_pipe = false,
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
         
          // pipe carve out
          translate([0, 0, 108])
          rotate([0, 90, 0])
          cylinder(h = rail_width * 2, d = 20.2, center = true);

          // right turnbox carve out
          translate([-rail_width / 3 - 30, -10, 90])
          cube([rail_width / 4, 50,  dc_motor_cutout_d + 25]); 

          // right turnbox carve out
          translate([rail_width / 3 - 20, -10, 90])
          cube([rail_width / 4, 50,  dc_motor_cutout_d + 25]); 
    
        // flatten the top front holder structure to allow for more angles of freedom of the clam pipe
        translate([- rail_width / 2 - 1, 7, 120])
          cube([rail_width + 2, 20, 20]);
        
          // carve out the top so that the pipe can be added removed
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
        
        // left top reinforcment
        translate([-44, -15, 77])
        cube([8, 19, 10]);
        
        // left back support
        translate([-40,  -26, 55])
        rotate([-25, 0, 0])
        cube([8, 8, 120], center = true);
        
        // center post
        translate([0, 0, 108/2])
        cube([8,8, 108], center = true);
        
        // left top reinforcment
        translate([-4, -15, 77])
        cube([8, 19, 10]);
       
        // center back support 
        translate([0,  -26, 55])
        rotate([-25, 0, 0])
        cube([8, 8, 120], center = true);
        
        // right post
        translate([40, 0, 108/2])
        cube([8,8, 108], center = true);
        
        // left top reinforcment
        translate([36, -15, 77])
        cube([8, 19, 10]);
        
        // right back support 
        translate([40,  -26, 55])
        rotate([-25, 0, 0])
        cube([8, 8, 120], center = true);
      }
     
      // carve out for clam pipe (otherwise the support columns get in the way
       translate([50, 0, 108])
        rotate([0, 90, 0])
        cylinder(h = 2 * rail_width, d =21, center = true);
    }
}


  if (show_pipe) {
      // clam pipe
       translate([0, 0, 108]) {
         rotate([33, 0, 0])
         clam_pipe();
       }
  }
}
back_jack();