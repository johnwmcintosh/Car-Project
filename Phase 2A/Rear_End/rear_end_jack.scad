   include <../robot_settings.scad>
   use <clampipe.scad>
   $fn = 100;
   
   // front end jack
  module back_jack(
    show_pipe = false,
    show_structure = true
    ) {
      
  if (show_structure == true) {
      // platform
      translate([0,  0, 0])
      color("brown")
      cube([200, 110, 8], center = true);
      
      thickness_offset = 10;
      rail_width_offset = 50;
      pipe_cutout_depth = 19.9; 
 
      translate([0, 0, -16]) {
      // top holder structure
          difference() {
              translate([0, 0, 100]) {
                  union() {
                      color("orange")
                      cube([rail_width + rail_width_offset, 50, dc_motor_cutout_d - thickness_offset], center = true);
                      
                      color("red")
                      translate([rail_width / 2 + 17, 0, dc_motor_cutout_d])
                      cube([16, rail_width_offset, 2 * dc_motor_cutout_d ], center = true);

                      color("yellow")
                      translate([rail_width / 2 - 55, 0,  dc_motor_cutout_d - 10])
                      cube([16, rail_width_offset, 2 * dc_motor_cutout_d - 20 ], center = true);

                      color("green")
                      translate([-rail_width / 2 - 17, 0, dc_motor_cutout_d])
                      cube([16, rail_width_offset, 2 * dc_motor_cutout_d ], center = true);

                      color("pink")
                      translate([-rail_width / 2 + 55, 0,  dc_motor_cutout_d - 10])
                      cube([16, rail_width_offset, 2 * dc_motor_cutout_d - 20], center = true);
                      
                      color("cyan")
                      translate([0, -17.5, dc_motor_cutout_d])
                      cube([rail_width + 20, 15, dc_motor_cutout_d + 25], center = true);
                  }
              }
              
              pipe_cutout_h = 98 + 41;

              translate([rail_width / 2 - 55, 0, pipe_cutout_h])
              cube([18, pipe_cutout_depth, dc_motor_cutout_d + 10], center = true);
              
              translate([rail_width / 2 + 17, 0, pipe_cutout_h])
              cube([18, pipe_cutout_depth, dc_motor_cutout_d + 10], center = true);

              translate([-rail_width / 2 + 55, 0, pipe_cutout_h])
              cube([18, pipe_cutout_depth, dc_motor_cutout_d + 10], center = true);
              
              translate([-rail_width / 2 - 17, 0, pipe_cutout_h])
              cube([18, pipe_cutout_depth, dc_motor_cutout_d + 10], center = true);

              //imu cutout
              translate([-30/2, -30, dc_motor_cutout_d + 90])
             cube([ 30,  2 * pipe_cutout_depth,  40]);
              
              translate([0,0, 98+ 25])
              clam_pipe(show_blades = false, length_offset = 80, diameter = 20); 
        }
  }

    difference() {
      
      union () {
         // left post
        translate([-65, 0, 40])
        color("cyan")
        cube([8, 8, 80], center = true);
        
        // left back support
        translate([-65,  -26, 40])
        rotate([-25, 0, 0])
        color("cyan")
        cube([8, 8, 84], center = true);
        
        // center post
        translate([0, 0, 40])
        color("gray")
        cube([8,8, 80], center = true);
       
        // center back support 
        translate([0,  -26, 40])
        rotate([-25, 0, 0])
        color("gray")
        cube([8, 8, 84], center = true);
        
        // right post
        translate([65, 0, 40])
        color("magenta")
        cube([8, 8, 80], center = true);
        
        // right back support 
        translate([65,  -26, 40])
        rotate([-25, 0, 0])
        color("magenta")
        cube([8, 8, 84], center = true);
      }
     
      // carve out for clam pipe (otherwise the support columns get in the way
       translate([50, 0, 108])
        rotate([0, 90, 0])
        cylinder(h = 2 * rail_width, d =21, center = true);
    }
}


  if (show_pipe) {
      // clam pipe
       translate([0, 0, 107]) {
         rotate([0, 0, 0])
         clam_pipe();
       }
  }
  }
back_jack();