$fn = 50;
include <../robot_settings.scad>


  module steering_coupler() {
  color("blue")
  difference() {
    cylinder(h = coupler_length, d = coupler_diameter, center = true);

    // top cutout for motor axle
    translate([0, 0, coupler_length / 2 - dc_motor_axle_notch_cutout_z / 2 + .1])
    cylinder(h = dc_motor_axle_notch_cutout_z, d = dc_motor_axle_cutout_d - dc_motor_axle_notch_cutout, center = true);

    // bottom cutout for steering shaft
    translate([0, 0,  - coupler_gear_side_insert / 2 - .1])
    cylinder(h = coupler_gear_side_insert, d = steering_shaft_d, center = true);

    // top screw cutout
    translate([0, 0, coupler_screw_z_offset])
    rotate([0, 90, 0])
    cylinder(h = coupler_diameter, d = coupler_screw_d, center = true);

    // bottom screw cutout
    translate([0, 0, -coupler_screw_z_offset])
    rotate([0, 90, 0])
    cylinder(h = coupler_diameter, d = coupler_screw_d, center = true);
  }
}


steering_coupler();
