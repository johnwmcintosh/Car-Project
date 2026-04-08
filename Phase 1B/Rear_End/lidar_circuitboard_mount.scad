include <../robot_settings.scad>
$fn = 50;

module lidar_circuitboard_mount()
{
  cube([lidar_circuitboard_x, lidar_circuitboard_y, lidar_circuitboard_z + 3], center = true);
  
  difference() {
  translate([lidar_circuitboard_x / 2, 0, 3.5])
  cube([drv8871mount_edge_wall, lidar_circuitboard_y, lidar_circuitboard_z + 10], center = true);
  
  translate([0, 1, lidar_circuitboard_z + drv8871_solder_points_z + 2])
  cube([lidar_circuitboard_x, lidar_circuitboard_y, lidar_circuitboard_z + .5], center = true);
  }
  
  difference() {
  translate([-lidar_circuitboard_x / 2, 0, 3.5])
  cube([drv8871mount_edge_wall, lidar_circuitboard_y, lidar_circuitboard_z + 10], center = true);
  
  translate([0, 1, lidar_circuitboard_z + drv8871_solder_points_z + 2])
  cube([lidar_circuitboard_x, lidar_circuitboard_y, lidar_circuitboard_z + .5], center = true);
  }
  
}

lidar_circuitboard_mount();