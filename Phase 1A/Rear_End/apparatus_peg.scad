include <../robot_settings.scad>
$fn=50;

module apparatus_peg()
{
cylinder(h = ball_bearing_outer_diameter + 2, d = ball_bearing_inner_diameter / 2 + 0.1 , center = true);
}
apparatus_peg();