include <../robot_settings.scad>
$fn = 50;

module RP5() {

 difference() {
    translate([
              -raspberry_pi_peg_h + .2, 
              main_box_y / 2 - raspberry_pi_screw_seperation_y / 2, 
              main_box_z / 2 - main_box_z /6 + main_box_z / 2 + 9])
    rotate([0,90,0])
    cylinder(h = raspberry_pi_peg_h, d = ball_bearing_inner_diameter);
    
    // screw hole
    translate([
              -raspberry_pi_peg_h - .2, 
              main_box_y / 2 - raspberry_pi_screw_seperation_y / 2, 
              main_box_z / 2 - main_box_z /6 + main_box_z / 2 + 9])
    rotate([0,90,0])
    cylinder(h = raspberry_pi_peg_h, d = power_bar_screw_d / 2 +.5);
  }

  // rp5 mounting pegs - top left
  difference() {
    translate([
              -raspberry_pi_peg_h + .2,
              main_box_y / 2 + raspberry_pi_screw_seperation_y / 2, 
              main_box_z / 2 - main_box_z /6 + main_box_z / 2 + 9])
    rotate([0,90,0])
    cylinder(h = raspberry_pi_peg_h, d = ball_bearing_inner_diameter);

    // screw hole
    translate([
              -raspberry_pi_peg_h - .2,
              main_box_y / 2 + raspberry_pi_screw_seperation_y / 2, 
              main_box_z / 2 - main_box_z /6 + main_box_z / 2 + 9])
    rotate([0,90,0])
    cylinder(h = raspberry_pi_peg_h, d = power_bar_screw_d / 2 + .5);
  }

  // rp5 mounting pegs - bottom right
  // rp5 mounting pegs - top right
  difference() {
    translate([
              -raspberry_pi_peg_h + .2, 
              main_box_y / 2 - raspberry_pi_screw_seperation_y / 2, 
              main_box_z / 2 - main_box_z /6 + main_box_z / 2 - raspberry_pi_screw_seperation_z + 9])
    rotate([0,90,0])
    cylinder(h = raspberry_pi_peg_h, d = ball_bearing_inner_diameter);
    
    // screw hole
    translate([
              -raspberry_pi_peg_h - .2, 
              main_box_y / 2 - raspberry_pi_screw_seperation_y / 2, 
              main_box_z / 2 - main_box_z /6 + main_box_z / 2 - raspberry_pi_screw_seperation_z + 9])
    rotate([0,90,0])
  cylinder(h = raspberry_pi_peg_h, d = power_bar_screw_d / 2 + .5);  
  }

  // rp5 mounting pegs - bottom left
  difference() {
  translate([
            -raspberry_pi_peg_h + .2,
            main_box_y / 2 + raspberry_pi_screw_seperation_y / 2, 
            main_box_z / 2 - main_box_z /6 + main_box_z / 2 -raspberry_pi_screw_seperation_z + 9])
  rotate([0,90,0])
  cylinder(h = raspberry_pi_peg_h, d = ball_bearing_inner_diameter);

  translate([
            -raspberry_pi_peg_h - .2,
            main_box_y / 2 + raspberry_pi_screw_seperation_y / 2, 
            main_box_z / 2 - main_box_z /6 + main_box_z / 2 -raspberry_pi_screw_seperation_z + 9])
  rotate([0,90,0])
  cylinder(h = raspberry_pi_peg_h, d = power_bar_screw_d / 2 + 1);
  }
}
RP5();
  