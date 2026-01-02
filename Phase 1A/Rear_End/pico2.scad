include <../robot_settings.scad>
$fn = 50;

module pico_extender() {
  rotate([90, 0, 90])
  difference() {
      cube([pico_expander_width, pico_expander_height, 2], center = true);

      translate([pico_expander_width / 2 - pico_screw_hole_offset, pico_expander_height / 2 - pico_screw_hole_offset, 0])
      cylinder(5, d = pico_screw_hole_d, center = true);

      translate([pico_expander_width / 2 - pico_screw_hole_offset,  -pico_expander_height / 2 + pico_screw_hole_offset, 0])
      cylinder(5, d = pico_screw_hole_d, center = true);

      translate([- pico_expander_width / 2 + pico_screw_hole_offset,  -pico_expander_height / 2 + pico_screw_hole_offset, 0])
      cylinder(5, d = pico_screw_hole_d, center = true);

      translate([- pico_expander_width / 2 + pico_screw_hole_offset,  pico_expander_height / 2 - pico_screw_hole_offset, 0])
      cylinder(5, d = pico_screw_hole_d, center = true);
    }
}
pico_extender();

module pico_mounts() {
  rotate([90, 0, 90])
  union() {
    difference() {
      // mount
      translate([pico_expander_width / 2 - pico_screw_hole_offset, pico_expander_height / 2 - pico_screw_hole_offset, 0])
       cylinder(raspberry_pi_peg_h, d = ball_bearing_inner_diameter, center = true);
      
      // pilot hole
       translate([pico_expander_width / 2 - pico_screw_hole_offset, pico_expander_height / 2 - pico_screw_hole_offset, 0])
        cylinder(raspberry_pi_peg_h, d =  power_bar_screw_d / 2, center = true);
      }

      difference() {
        // mount
        translate([pico_expander_width / 2 - pico_screw_hole_offset,  -pico_expander_height / 2 + pico_screw_hole_offset, 0])
        cylinder(raspberry_pi_peg_h, d = ball_bearing_inner_diameter, center = true);
        
        // pilot hole
        translate([pico_expander_width / 2 - pico_screw_hole_offset,  -pico_expander_height / 2 + pico_screw_hole_offset, 0])
        cylinder(raspberry_pi_peg_h, d = power_bar_screw_d / 2, center = true);
      }
    
    difference() {
      // mount
      translate([- pico_expander_width / 2 + pico_screw_hole_offset,  -pico_expander_height / 2 + pico_screw_hole_offset, 0])
      cylinder(raspberry_pi_peg_h, d = ball_bearing_inner_diameter, center = true);
      
      // pilot hole
      translate([- pico_expander_width / 2 + pico_screw_hole_offset,  -pico_expander_height / 2 + pico_screw_hole_offset, 0])
      cylinder(raspberry_pi_peg_h, d = power_bar_screw_d / 2, center = true);
    }
      
    difference()  {
      // mount
      translate([- pico_expander_width / 2 + pico_screw_hole_offset,  pico_expander_height / 2 - pico_screw_hole_offset, 0])
      cylinder(raspberry_pi_peg_h, d = ball_bearing_inner_diameter, center = true);
      
      //pilot hole
      translate([- pico_expander_width / 2 + pico_screw_hole_offset,  pico_expander_height / 2 - pico_screw_hole_offset, 0])
      cylinder(raspberry_pi_peg_h, d = power_bar_screw_d / 2, center = true);
      }
    }
}
 pico_mounts();