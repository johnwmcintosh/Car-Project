include <robot_settings.scad>
$fn=50;
  
 print_front_rack_grab_bar_peg = true;
 print_apparatus_peg = false;
  

// this applies to all locking pegs
module apparatus_peg()
{
  translate([20, 0, 0])
  cylinder(h = ball_bearing_outer_diameter + 2, 
      d = apparatus_locking_peg_d - .38 , center = true);
}
if (print_apparatus_peg)
    apparatus_peg();

// this applies to the front grab bar
module front_rack_grab_bar_peg()
{
  translate([40, 0, 0])
   cylinder(h = armature_holder_height + 8, 
      r = pull_bar_peg_r - .2, center = true);
}
if (print_front_rack_grab_bar_peg)
  front_rack_grab_bar_peg();