include <tobsun_parts.scad>
include <../robot_settings.scad>
use <robot_rail.scad>
use <../rear_end/pico2.scad>
use <../rear_end/RP5.scad>

module battery_box() {

  translate([0,0,6])
  difference() {
      // battery box
      cube([main_box_x, main_box_y, main_box_z]);

      // battery box cutout    
      translate([wall_thickness - .2, wall_thickness, wall_thickness])
      cube([main_box_x - 2 * wall_thickness, main_box_y + wall_thickness, main_box_z - 2 * wall_thickness]);

      // side windows
      translate([-wall_thickness, wall_thickness + 4 * wall_thickness, main_box_z / 2 - main_box_z /6])
      cube([main_box_x + 2 * wall_thickness, main_box_y - 10 * wall_thickness, main_box_z / 4]);

      // back window
      translate([main_box_x / 4, -wall_thickness, main_box_z / 4])
      cube([main_box_x / 2, 4 * wall_thickness, main_box_z / 2]);
  }

  // rp5 mounting pegs - top right
  RP5();
 
  // pico extender
  translate([main_box_x + 2, main_box_y / 2, 45])
  pico_mounts();

// tobsun
translate([main_box_x / 2 - tobsun_shelf_width / 2, main_box_y - tobsun_shelf_length, main_box_z + rail_gap + 2 * wall_thickness])
tobsun_tray();

  // rail attachments
  difference() {
    union() {
      color("green")
      cube([rail_gap + .1, main_box_y, rail_inset]);
      cube([rail_inset, main_box_y, rail_gap]);
      
      color("green")
      translate([main_box_x - rail_gap - .1, 0, 0]) 
      cube([rail_gap + .1, main_box_y, rail_inset]);
      translate([main_box_x - rail_inset, 0 ,0])
      cube([rail_inset, main_box_y, rail_gap]);
    }
    
    // peg cutout
    translate([-3, 20, 4])
    rotate([0, 90, 0])
    cylinder(h = 100, d = 3);
  }
  
  // usb hub holder
 //color("black")
 //translate([-usbhub_width + 10, 4.3, main_box_z + usbhub_thickness / 2 + 0])
 // cube([usbhub_width, usbhub_depth, usbhub_thickness]);
  
  // usb hub mount
  difference() {
    // end wall
    translate([main_box_x - 5, 4, main_box_z + usbhub_thickness / 2 ])
    cube([5, usbhub_depth + .3, usbhub_thickness + usbhub_thickness / 2 - 1]);
    
    // usb cutout
    color("green")
    translate([main_box_x - 6, usbhub_depth / 2 - 6 , main_box_z + 1])
    cube([7, usbhub_end_port_width + 3, usbhub_thickness + usbhub_thickness / 2]);
  }
  // end roof
  translate([main_box_x - 9, 4.3, main_box_z + usbhub_thickness + usbhub_thickness / 2 + .3])
  cube([9, usbhub_depth, 5]);
  
  // side right wall
  translate([main_box_x - usbhub_front_face_safe_zone_right - 5, 0, main_box_z])
  cube([usbhub_front_face_safe_zone_right + 5, 4, usbhub_thickness  + usbhub_thickness / 2 + 3]);
  
  // side right roof
   translate([main_box_x - usbhub_front_face_safe_zone_right - 5, 0, main_box_z + usbhub_thickness + usbhub_thickness / 2 + .3])
   cube([usbhub_front_face_safe_zone_right + 5, 9, 5]);
 
  // side left wall
  translate([0, 0, main_box_z])
  cube([usbhub_front_face_safe_zone_left , 4, usbhub_thickness  + usbhub_thickness / 2 + 3]);
  
  // side left roof
  translate([0, 0, main_box_z + + usbhub_thickness + usbhub_thickness / 2 + .3])
   cube([usbhub_front_face_safe_zone_left, 9, 5]);
 
}
battery_box();