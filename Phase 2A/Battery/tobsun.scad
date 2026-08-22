include <../robot_settings.scad>

$fn = 100;

width = 49.7;
depth = 37.9;
height = 18.2;

plate_width = 50.1;
plate_depth = 52.4;
plate_height = 1.6;

wing_protrusion = 7.4;
wing_height = 2.1;
wing_base_length = 17;

screw_hole_offset = 3.2;
screw_diameter = 3;

electrical_connections_floor_offset_from_plate = 5;
electrical_connections_floor_plate_width = 34.3;
electrical_connections_floor_thickness = 5;
electrical_connections_slat_width = 1.3;
electrical_connections_slat_spacing = 7;
electrical_connections_slat_height = 6;
electrical_connections_depth = 12.4;

module tobsun() {
    // electrical connections floor
    color("black")
    translate([-electrical_connections_floor_plate_width / 2, depth / 2, -(height / 2 + plate_height) + electrical_connections_floor_offset_from_plate])
    cube([electrical_connections_floor_plate_width, electrical_connections_depth, electrical_connections_floor_thickness]);

    // right most slat
    color("black")
    translate([- electrical_connections_floor_plate_width/2, depth / 2, -1])
    cube([electrical_connections_slat_width, electrical_connections_depth, electrical_connections_slat_height]);

    // inner right slat
    color("black")
    translate([-electrical_connections_floor_plate_width/2  + 1.7 *  electrical_connections_slat_width + electrical_connections_slat_spacing, depth /2, -1])
    cube([electrical_connections_slat_width, electrical_connections_depth, electrical_connections_slat_height]);

    // center slat
    color("black")
    translate([0, depth / 2, -1])
    cube([electrical_connections_slat_width, electrical_connections_depth, electrical_connections_slat_height]);

    // inner left slat
     color("black")
    translate([electrical_connections_floor_plate_width/2  - 1.7 *  electrical_connections_slat_width - electrical_connections_slat_spacing, depth /2, -1])
    cube([electrical_connections_slat_width, electrical_connections_depth, electrical_connections_slat_height]);

    // left most slat
      color("black")
      translate([electrical_connections_floor_plate_width/2 - electrical_connections_slat_width, depth / 2, -1])
    cube([electrical_connections_slat_width, electrical_connections_depth, electrical_connections_slat_height]);

    // right most terminal screw
    color("silver")
    translate([-electrical_connections_slat_spacing - electrical_connections_slat_spacing / 2 - dc_motor_screw_head_d /4 , depth / 2 + electrical_connections_depth / 2, electrical_connections_floor_thickness - electrical_connections_slat_height])
    cylinder(h = 4, d = dc_motor_screw_head_d);
    
    // right inner terminal screw
    color("silver")   
    translate([-electrical_connections_slat_spacing + dc_motor_screw_head_d - dc_motor_screw_head_d/3, depth / 2 + electrical_connections_depth / 2, electrical_connections_floor_thickness - electrical_connections_slat_height])
    cylinder(h = 4, d = dc_motor_screw_head_d);
    
    // right inner terminal screw
    color("silver")   
    translate([-electrical_connections_slat_spacing + 2.1 *dc_motor_screw_head_d, depth / 2 + electrical_connections_depth / 2, electrical_connections_floor_thickness - electrical_connections_slat_height])
    cylinder(h = 4, d = dc_motor_screw_head_d);
    
    // left most terminal screw
    color("silver")   
    translate([electrical_connections_slat_spacing + dc_motor_screw_head_d/2 + dc_motor_screw_head_d/2, depth / 2 + electrical_connections_depth / 2, electrical_connections_floor_thickness - electrical_connections_slat_height])
    cylinder(h = 4, d = dc_motor_screw_head_d);
    
    // plate
    color("black")    
    cube([width, depth, height], center = true);
    color("black")
    translate([0, (plate_depth - depth) / 2, -height/2])
    cube([plate_width, plate_depth, plate_height], center = true);

    module tri_round_peak(base = wing_base_length, h = wing_protrusion, r = 4) {
        hull() {
            translate([-base/2, 0]) square(0.01, center = true);
            translate([ base/2, 0]) square(0.01, center = true);
            translate([0, h - r]) circle(r = r);   // center pulled down by r
        }
    }

  color("black")
  difference() {
        translate([-width/2, 0, -(height + plate_height) /2 ])
        rotate([0, 0, 90])
        linear_extrude(height = wing_height) tri_round_peak();

        translate([-(plate_width / 2 + screw_hole_offset), 0, -(height + plate_height) /2 - 10])
        cylinder(h = 20, d = screw_diameter);
    }

    color("black")
    difference() {
        translate([width/2, 0, -(height + plate_height) /2 ])
        rotate([0, 0, -90])
        linear_extrude(height = wing_height) tri_round_peak();

        translate([(plate_width / 2 + screw_hole_offset), 0, -(height + plate_height) /2 - 10])
        cylinder(h = 20, d = screw_diameter);
    }
}
tobsun();