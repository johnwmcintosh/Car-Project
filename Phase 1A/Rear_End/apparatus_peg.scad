include <../robot_settings.scad>
$fn=50;

module apparatus_peg()
{
  cylinder(h = ball_bearing_outer_diameter + 2, d = 3 + 0.01 , center = true);
}
apparatus_peg();