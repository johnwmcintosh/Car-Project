include <../robot_settings.scad>
$fn = 50;

module drv8871mount()
{
  cube([drv8871mount_x, drv8871mount_y, drv8871mount_z], center = true);
  
  difference() {
  translate([drv8871mount_x / 2, 0, 3.5])
  cube([drv8871mount_edge_wall, drv8871mount_y, drv8871mount_z + 7], center = true);
  
  translate([0, 1, drv8871mount_z + drv8871_solder_points_z])
  cube([drv8871mount_x, drv8871mount_y, drv8871_z], center = true);
  }
  
  difference() {
  translate([-drv8871mount_x / 2, 0, 3.5])
  cube([drv8871mount_edge_wall, drv8871mount_y, drv8871mount_z + 7], center = true);
  
  translate([0, 1, drv8871mount_z + drv8871_solder_points_z])
  cube([drv8871mount_x, drv8871mount_y, drv8871_z], center = true);
  }
  
}

drv8871mount();