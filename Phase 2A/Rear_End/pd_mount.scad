include <../robot_settings.scad>
$fn = 50;

module pdmount()
{
  // base
  cube([pdmount_x, pdmount_y, pdmount_z + 3], center = true);
  
  // left wall and cutout for the circuit board
  difference() {
    translate([pdmount_x / 2, 0, 3.5])
    cube([drv8871mount_edge_wall, pdmount_y, pdmount_z + 10], center = true);
  
    translate([0, 1, drv8871mount_z + drv8871_solder_points_z])
    cube([pdmount_x, pdmount_y, pdmount_z], center = true);

    translate([0, 7.1, drv8871mount_z + drv8871_solder_points_z + 1.5])
    cube([pdmount_x - 1, pdmount_y - 14, pdmount_z + .1], center = true);
   }
  
 // right wall and cutout for the circuit board
 difference() {
    translate([-pdmount_x / 2, 0, 3.5])
    cube([drv8871mount_edge_wall, pdmount_y, pdmount_z + 10], center = true);
  
    translate([0, 1, drv8871mount_z + drv8871_solder_points_z])
    cube([pdmount_x, pdmount_y, pdmount_z], center = true);

    translate([0, 7.1, drv8871mount_z + drv8871_solder_points_z + 1.5])
    cube([pdmount_x - 1, pdmount_y - 14, pdmount_z + .1], center = true);
   } 
}

pdmount();