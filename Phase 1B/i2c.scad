
include <robot_settings.scad>


$fn = 100;

module i2c() {
  difference() {
    cube([i2c_w, i2c_l, i2c_circuitboard_thickness], center = true);
    
    translate([ -i2c_w / 2 + i2c_screw_hole_offset,  i2c_l / 2 - i2c_screw_hole_offset, -2.5])
    cylinder(5, d = i2c_screw_hole_d);
    
    translate([i2c_w / 2 - i2c_screw_hole_offset, i2c_l / 2 - i2c_screw_hole_offset, - 2.5])
    cylinder(5, d = i2c_screw_hole_d);
    
    translate([i2c_w / 2 - i2c_screw_hole_offset, -i2c_l / 2 + i2c_screw_hole_offset, - 2.5])
    cylinder(5, d = i2c_screw_hole_d);
    
    translate([-i2c_w / 2 + i2c_screw_hole_offset, -i2c_l / 2 + i2c_screw_hole_offset, - 2.5])
    cylinder(5, d = i2c_screw_hole_d);
    
    translate([i2c_w / 2 - i2c_bottom_notch_w, -i2c_l / 2 + i2c_bottom_notch_depth - 5/2, -i2c_circuitboard_thickness / 2])
    cube([i2c_bottom_notch_w,  5, 5], center = true);
    }
    
    // pins
    translate([i2c_all_pins_l / 2, i2c_l / 2 - i2c_pin_offset, -2])
    cylinder(h = i2c_pin_l, d = i2c_pin_d);
    
    translate([i2c_all_pins_l / 2 - i2c_pin_separation, i2c_l / 2 - i2c_pin_offset, -2])
    cylinder(h = i2c_pin_l, d = i2c_pin_d);
        
    translate([i2c_all_pins_l / 2 - 2*  i2c_pin_separation, i2c_l / 2 - i2c_pin_offset, -2])
    cylinder(h = i2c_pin_l, d = i2c_pin_d);
    
    translate([i2c_all_pins_l / 2 - 3 * i2c_pin_separation, i2c_l / 2 - i2c_pin_offset, -2])
    cylinder(h = i2c_pin_l, d = i2c_pin_d);
    
    // screen
    color("black")
    translate([0, i2c_l / 2 - i2c_screen_w + i2c_screen_offset, -i2c_circuitboard_thickness / 2 - i2c_screen_thickness / 2 + .1])
    cube([i2c_screen_d, i2c_screen_w, i2c_screen_thickness], center = true);
    }

i2c();