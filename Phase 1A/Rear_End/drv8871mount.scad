include <../robot_settings.scad>

$fn = 50;

module drv8871mount(dc_motor_drivertype = "Adafruit")
{
  ///////////
  // these are also in robot_settings due to dependency
  isAdafruit = (dc_motor_drivertype == "Adafruit");

  drv8871_x = isAdafruit ? 20.3 : 21.6;
  drv8871_y = isAdafruit ?  24 : 25;
  drv8871mount_x = drv8871_x +  drv8871mount_edge_wall - 2* drv8871mount_edge_x;
  displayLetter = isAdafruit ? "A" : "T";
  ///////////
  
  cube([drv8871mount_x, drv8871mount_y, drv8871mount_z], center = true);
  
  difference() {
    translate([drv8871mount_x / 2, 0, 3.5])
    cube([drv8871mount_edge_wall, drv8871mount_y, drv8871mount_z + 7], center = true);
    
    translate([0, 1, drv8871mount_z + drv8871_solder_points_z])
    cube([drv8871mount_x, drv8871mount_y, drv8871_z], center = true);
  }
       
  translate([drv8871mount_x / 4, drv8871mount_y / 4, 2])
  color("blue")
  rotate([0,0,180])
  linear_extrude(1)
  text(displayLetter);
  
  difference() {
  translate([-drv8871mount_x / 2, 0, 3.5])
  cube([drv8871mount_edge_wall, drv8871mount_y, drv8871mount_z + 7], center = true);
  
  translate([0, 1, drv8871mount_z + drv8871_solder_points_z])
  cube([drv8871mount_x, drv8871mount_y, drv8871_z], center = true);
  }
}

drv8871mount();