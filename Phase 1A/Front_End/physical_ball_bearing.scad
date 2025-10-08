include <../robot_settings.scad>

$fs = .1;

module physical_ball_bearing() {
  difference() {
   color("green")
  cylinder(h = ball_bearing_height, d = ball_bearing_outer_diameter, center = true);
  translate([0,0, -.2]);
    cylinder(h = ball_bearing_height + .1, d = ball_bearing_inner_diameter, center = true);
  }
}
physical_ball_bearing();