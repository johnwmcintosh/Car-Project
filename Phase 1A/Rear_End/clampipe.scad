   include <../robot_settings.scad>

module clam_pipe() {
      // clam pipe
       translate([0, 0, 0]) {
          rotate([0, 90, 0])
          cylinder(h = rail_width + 10, d = 19, center = true);
       }

       blade_length = 48;
       filling_length = 26;
      
      // clams
       translate([0, 13, 0])
       {
         // right upper clam blade -71.43 = 200 / 2.8 -> -76.43 /  200 = 1/2.62
        translate([-rail_width / 2.62,  15, rail_thickness])
        cube([rail_width / 5,  blade_length, rail_thickness], center = true);
         
         // right filling
         translate([-rail_width / 2.62, 2, -1])
         cube([rail_width / 5, filling_length, rail_thickness + 2], center = true);
         
         // right lower clam blade
        translate([-rail_width / 2.62,  15, -rail_thickness])
        cube([rail_width / 5,  blade_length, rail_thickness], center = true);
         
         // left filling
         translate([rail_width / 2.62, 2, -1])
         cube([rail_width / 5, filling_length, rail_thickness + 2], center = true);
         
        // left upper clam blade
        translate([rail_width / 2.62,  15, rail_thickness])
        cube([rail_width / 5,  blade_length, rail_thickness], center = true);
        
         // left lower clam blade
        translate([rail_width / 2.62,  15, -rail_thickness])
        cube([rail_width / 5,  blade_length, rail_thickness], center = true);
      }
    }
    clam_pipe();