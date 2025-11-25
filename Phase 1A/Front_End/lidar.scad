include <../robot_settings.scad>

$fn=50;

module lidar_cutouts() {
  translate([-lidar_narrow_screws / 2, 0, 0])
  cylinder(h = 2 * rail_thickness, d = lidar_screw_d, center = true);
  
  translate([lidar_narrow_screws / 2, 0, 0])
  cylinder(h = 2 * rail_thickness, d = lidar_screw_d, center = true);
  
  translate([0, lidar_front_to_back_screws, 0])
  {
    translate([lidar_wide_screws / 2, 0, 0])
    cylinder(h = 2 * rail_thickness, d = lidar_screw_d, center = true);

    translate([-lidar_wide_screws / 2, 0, 0])
    cylinder(h = 2* rail_thickness, d = lidar_screw_d, center = true);
  }
}
lidar_cutouts();