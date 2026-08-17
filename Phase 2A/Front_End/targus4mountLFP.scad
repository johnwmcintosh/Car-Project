include <../robot_settings.scad>

module targus4mount()
{
   spacer = 5;
  
  // spacers to allow for better usb fit
  // main spacer
  translate([0,4, lfp_main_box_z + spacer])
  cube([lfp_main_box_x,  38, spacer]);
  
//  // right side spacer
//  translate([lfp_main_box_x -15, 0, lfp_main_box_z + spacer])
//  cube([15, 3, spacer]);
  
  // small right side wall filler
//  translate([lfp_main_box_x -19.8, 4, lfp_main_box_z + spacer + 1])
//  cube([4.8, 2, spacer - 1]);
  
//  // left side spacer
//  translate([0, 0, lfp_main_box_z + spacer])
//  cube([15, 4, spacer]);
  
  // holders for Targus 4 port
  difference() {
    // end wall
    translate([lfp_main_box_x - 5, 4, lfp_main_box_z + usbhub_thickness / 2 ])
    cube([5, usbhub_depth + .3, usbhub_thickness + usbhub_thickness / 2 + spacer - 1]);
    
    // usb cutout
     color("green")
    translate([lfp_main_box_x - 6, usbhub_depth / 2 -4 , lfp_main_box_z + usbhub_end_port_height])
    cube([7, usbhub_end_port_width + 3, usbhub_end_port_height]);
  }

  // end roof
  translate([lfp_main_box_x - 9, 4.3, lfp_main_box_z + usbhub_thickness + usbhub_thickness / 2 + spacer])
  cube([9, usbhub_depth, 5]);
  
  // side right wall
  translate([lfp_main_box_x - usbhub_front_face_safe_zone_right - 5, 0, lfp_main_box_z + 5])
  cube([usbhub_front_face_safe_zone_right + 5, 4, usbhub_thickness  + usbhub_thickness / 2 + spacer]);
  
  // side right roof
   translate([lfp_main_box_x - usbhub_front_face_safe_zone_right - 5, 0, lfp_main_box_z + usbhub_thickness + usbhub_thickness / 2 + spacer])
   cube([usbhub_front_face_safe_zone_right + 5, 9, 5]);
 
  // side left wall
  translate([0, 0, lfp_main_box_z + 5])
  cube([usbhub_front_face_safe_zone_left , 4, usbhub_thickness  + usbhub_thickness / 2 + spacer]);
  
  // side left roof
  translate([0, 0, lfp_main_box_z + usbhub_thickness + usbhub_thickness / 2  + spacer])
   cube([usbhub_front_face_safe_zone_left, 9, 5]);
 
}
targus4mount();