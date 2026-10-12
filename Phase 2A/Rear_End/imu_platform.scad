include <../robot_settings.scad>

$fn = 100;

module imu_platform(show_imu = false, show_platform = true)
{
       blade_length = 48;
       filling_length = 23;          
       tower_depth = blade_length / 2 - filling_length + 1.5;

       if (show_platform) {
          // right upper clam blade -71.43 = 200 / 2.8 -> -76.43 /  200 = 1/2.62
          translate([rail_width / 7 + post_thickness_x_y,  15, rail_thickness + .3])
          cube([blade_length / 2,  blade_length, rail_thickness], center = true);
        
          translate([-rail_width / 7 - post_thickness_x_y,  15, rail_thickness + .3])
          cube([blade_length / 2,  blade_length, rail_thickness], center = true);
        
          translate([0,  2.5, rail_thickness + .3])
          cube([rail_width / 3 + 17.5, 23, rail_thickness], center = true);
         
         // right filling
         translate([0, 2.5, -1])
         cube([rail_width / 5, filling_length, rail_thickness + 3], center = true);
           
           // right lower clam blade
         difference() {
            translate([0,  15, -rail_thickness])
            cube([rail_width / 5,  blade_length, rail_thickness], center = true);
            
            translate([0,  filling_length + 3, -rail_thickness])
            cube([post_thickness_x_y + 1, blade_length/ 2 + 3, 2 * rail_thickness], center = true);
          }
          
          translate([0, 7.1, 0]) {
             difference() {
                  // tower
                  translate([0, tower_depth, 15 + 1.5 * rail_thickness])
                  cube([ blade_length / 2 - 1, rail_width / 7, 40 - rail_thickness], center = true);
                    
                  // pins carveout
                  translate([0, tower_depth /  2 + imu_depth / 8, 42.8]) {
                    translate([-imu_depth / 2 + imu_underside_pin_h - .2, 0, -imu_underside_pin_h])
                      rotate([0,90,90]) 
                      color("yellow")
                      cylinder(h = imu_width + .4, r = imu_underside_pin_h + .4, center = true);
          
                      // screw hole
                      translate([ imu_depth / 2 - 2 * imu_screw_corner_border, imu_width / 2 - 2 * imu_screw_corner_border, -imu_thickness/2 - 3])
                      cylinder(10, d = i2c_screw_hole_d, center = true);
                      
                      // screw hole
                      translate([ imu_depth / 2 - 2 * imu_screw_corner_border,-imu_width / 2 + 2 * imu_screw_corner_border, -imu_thickness/2 - 3])
                      cylinder(10, d = i2c_screw_hole_d, center = true);
                   }
               }
            }
       }
       
       if (show_imu) {
            // imu holder
              translate([0, tower_depth /  2 + imu_depth / 8, 45]) {

                // pins
                translate([-imu_depth / 2 + imu_underside_pin_h - .2, 0, -imu_underside_pin_h])
                rotate([0,90,90]) 
                color("yellow")
                cylinder(h = imu_width - .2, r = imu_underside_pin_h, center = true);

                difference() {
                    color("green")      
                    cube([ imu_depth, imu_width, imu_thickness], center = true);
                   
                    // screw hole
                    translate([ imu_depth / 2 - 2 * imu_screw_corner_border, imu_width / 2 - 2 * imu_screw_corner_border, -imu_thickness/2])
                    cylinder(10, d = imu_screw_d, center = true);
                    
                    // screw hole
                    translate([ imu_depth / 2 - 2 * imu_screw_corner_border, -imu_width / 2 + 2 * imu_screw_corner_border, -imu_thickness/2])
                    cylinder(10, d = imu_screw_d, center = true);        
                }
            }
         }
}
imu_platform();