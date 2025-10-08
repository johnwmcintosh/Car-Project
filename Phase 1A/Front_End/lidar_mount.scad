  include <../robot_settings.scad>      
  $fn = 50;
  
  module lidar_mount()
  {
    peg_height = 20;

    cube([lidar_mount_x, lidar_mount_y, rail_thickness], center = true);
    
    // peg 1
    translate([
      -lidar_mount_x / 2 + lidar_mount_x / 5, 
      -lidar_mount_y / 2, 
      -peg_height -rail_thickness / 2
    ])
    
    cylinder(
      h = peg_height, 
      d = ball_bearing_inner_diameter
    );
    
    // peg 2
    translate([
      -lidar_mount_x / 2 + lidar_mount_x / 5, 
      -lidar_mount_y / 2, 
      -peg_height -rail_thickness / 2
    ])
    
    cylinder(
      h = peg_height, 
      d = ball_bearing_inner_diameter
    );
  }
  
  lidar_mount();