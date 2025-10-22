include <../robot_settings.scad>
$fn = 50;

module power_bar() {
  difference() {
    color("orange")
    cube([power_bar_cutout_x, power_bar_y, power_bar_z], center = true);
    
    translate([-power_bar_screw_distance / 2, 0, 0])
    cylinder(h = 10, d = power_bar_screw_d, center = true);
    
    translate([power_bar_screw_distance / 2, 0, 0])
    cylinder(h = 10, d = power_bar_screw_d, center = true);
  }
}

power_bar();