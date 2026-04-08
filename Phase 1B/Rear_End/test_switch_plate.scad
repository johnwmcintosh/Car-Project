include <../robot_settings.scad>
$fn = 50;

difference() {
cube([40, 40, rail_thickness], center = true);


      // switch cutout
      translate([0, 0, - rail_thickness + 2])
      cylinder(rail_thickness + 4, d = switch_cutout_d);
      
      // switch bump cutout
      color("green")
      translate([0, 0, - rail_thickness + 1.7 * switch_bump_h])
      cube([switch_w, switch_bump_l,  switch_bump_h], center = true);
}