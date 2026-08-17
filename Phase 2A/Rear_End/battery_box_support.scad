include <../robot_settings.scad>
use <support_angle.scad>

module battery_box_support()
{
      // battery box support right
      translate([-main_box_x / 3 - 3,  9, 3])
      rotate([0, 0, 180])
      support_angle(height = 40, depth = 30);
  
      // battery box support right
      translate([main_box_x / 3 - 5, 9, 3])
      rotate([0, 0, 180])
      support_angle(height = 40, depth = 30);
      
      // cross bar for side support
      translate([-2, 5, 20])
      cube([main_box_x + 7, 5, 13], center = true);
      
      // left side support
      color("green")
      translate([- main_box_x / 2 - 4, 13.5, 20]) {
        cube([3, 15, 13], center = true);
        translate([9, -6, 0])
        cube([16, 3, 13], center = true);
      }
          
      // right side support
      color("red")
      translate([main_box_x / 2, 13.5, 20]) {
        cube([3, 15, 13], center = true);
        translate([-9, -6, 0])
        cube([16, 3, 13], center = true);
      }
    }
    battery_box_support();