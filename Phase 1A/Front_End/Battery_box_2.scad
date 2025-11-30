include <tobsun_parts.scad>
include <../robot_settings.scad>
use <robot_rail.scad>

module battery_box() {

translate([0,0,6])
difference() {
    // battery box
    cube([main_box_x, main_box_y, main_box_z]);

    // battery box cutout    
    translate([wall_thickness - .2, wall_thickness, wall_thickness])
    cube([main_box_x - 2 * wall_thickness, main_box_y + wall_thickness, main_box_z - 2 * wall_thickness]);

    // side windows
    translate([-wall_thickness, wall_thickness + 4 * wall_thickness, main_box_z / 2 - main_box_z /6])
    cube([main_box_x + 2 * wall_thickness, main_box_y - 10 * wall_thickness, main_box_z / 4]);

    // back window
    translate([main_box_x / 4, -wall_thickness, main_box_z / 4])
    cube([main_box_x / 2, 4 * wall_thickness, main_box_z / 2]);
}

// rp5 mounting pegs - top right
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
  cylinder(h = raspberry_pi_peg_h, d = power_bar_screw_d / 2);
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
  cylinder(h = raspberry_pi_peg_h, d = power_bar_screw_d / 2);
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
cylinder(h = raspberry_pi_peg_h, d = power_bar_screw_d / 2);  
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
cylinder(h = raspberry_pi_peg_h, d = power_bar_screw_d / 2);
}

// tobsun
translate([main_box_x / 2 - tobsun_shelf_width / 2, main_box_y - tobsun_shelf_length, main_box_z + rail_gap + 2 * wall_thickness])
tobsun_tray();

  // rail attachments
  difference() {
    union() {
      color("green")
      cube([rail_gap + .1, main_box_y, rail_inset]);
      cube([rail_inset, main_box_y, rail_gap]);
      
      color("green")
      translate([main_box_x - rail_gap - .1, 0, 0]) 
      cube([rail_gap + .1, main_box_y, rail_inset]);
      translate([main_box_x - rail_inset, 0 ,0])
      cube([rail_inset, main_box_y, rail_gap]);
    }
    
    // peg cutout
    translate([-3, 20, 4])
    rotate([0, 90, 0])
    cylinder(h = 100, d = 3);
  }
}
battery_box();