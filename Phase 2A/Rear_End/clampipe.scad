   include <../robot_settings.scad>

module clam_pipe(show_blades = true, length_offset = 50, diameter = 19 ) {
      // clam pipe
       translate([0, 0, 0]) {
          rotate([0, 90, 0])
          cylinder(h = rail_width + length_offset, d = diameter, center = true);
       }

       blade_length = 48;
       filling_length = 26;
      
      // clams
      if (show_blades)
       translate([0, 13, 0])
       {
         // right upper clam blade -71.43 = 200 / 2.8 -> -76.43 /  200 = 1/2.62
         color("red")
        translate([-rail_width / 2 + 19,  15, rail_thickness])
        cube([rail_width / 5,  blade_length, rail_thickness], center = true);
         
         // right filling
         color("red")
         translate([-rail_width / 2 + 19, 2, -1])
         cube([rail_width / 5, filling_length, rail_thickness + 2], center = true);
         
         // right lower clam blade
         color("red")
        translate([-rail_width / 2 + 19,  15, -rail_thickness])
        cube([rail_width / 5,  blade_length, rail_thickness], center = true);
         
         // left filling
         color("green")
         translate([rail_width / 2 - 19, 2, -1])
         cube([rail_width / 5, filling_length, rail_thickness + 2], center = true);
         
        // left upper clam blade
        color("green")        
        translate([rail_width / 2 - 19,  15, rail_thickness])
        cube([rail_width / 5,  blade_length, rail_thickness], center = true);
        
         // left lower clam blade
        translate([rail_width / 2 - 19,  15, -rail_thickness])
        color("green")
        cube([rail_width / 5,  blade_length, rail_thickness], center = true);
      }
    }
    clam_pipe();