include <../robot_settings.scad>
$fn=50;

module battery_box_peg()
{
  
  // note: the diameter of the hole to lock in the battery box to the rail is smaller than the other pin holders. It is 3 not ball_bearing_inner_diameter / 2.
  // also, the rail hole is only a couple milimeters from the platform.
  cylinder(h = ball_bearing_outer_diameter + 2, d = 2.8 , center = true);
  translate([0, 0, ball_bearing_outer_diameter - 15])
  {
    difference() {
    cylinder(h = 2, d = ball_bearing_outer_diameter / 2, center = true);
    translate([-5, 2.5, -2.5])
     cube([10, 5, 5]);
    }
  }
}
battery_box_peg();