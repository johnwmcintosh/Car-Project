include <../robot_settings.scad>
$fn = 50;

module drv8871() {
  difference() {
    cube([drv8871_x, drv8871_y, drv8871_z], center = true);
    
    translate([drv8871_screw_distance / 2, drv8871_y / 2 - drv8871_screw_d, 0])
    cylinder(h = 2 * drv8871_z, d = drv8871_screw_d, center = true);
    
    translate([-drv8871_screw_distance / 2, drv8871_y / 2 - drv8871_screw_d, 0])
    cylinder(h = 2 * drv8871_z, d = drv8871_screw_d, center = true);
    }
    
    translate([drv8871_solder_inner_points_distance / 2, -drv8871_y / 2 + drv8871_solder_offset_y, -drv8871_z])
    cylinder(h = drv8871_solder_points_z, d = drv8871_solder_points_d, center = true);
    
    translate([-drv8871_solder_inner_points_distance / 2, -drv8871_y / 2 + drv8871_solder_offset_y, -drv8871_z])
    cylinder(h = drv8871_solder_points_z, d = drv8871_solder_points_d, center = true);
    
    translate([drv8871_solder_outer_points_distance / 2, -drv8871_y / 2 + drv8871_solder_offset_y, -drv8871_z])
    cylinder(h = drv8871_solder_points_z, d = drv8871_solder_points_d, center = true);
    
    translate([-drv8871_solder_outer_points_distance / 2, -drv8871_y / 2 + drv8871_solder_offset_y, -drv8871_z])
    cylinder(h = drv8871_solder_points_z, d = drv8871_solder_points_d, center = true);
}

drv8871();