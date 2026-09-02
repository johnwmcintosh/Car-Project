include <../robot_settings.scad>

module targus4mount()
{
   spacer = 5;
  
  translate([-main_box_x / 2, 0, 0]) {
      
      // spacers to allow for better usb fit
      // main spacer
      translate([0, 6,  spacer])
      cube([main_box_x,  35, spacer]);
      
      // right side spacer
      translate([main_box_x -15, 0,  spacer])
      cube([15, usbhub_depth, spacer]);
      
      // small right side wall filler
      translate([main_box_x -19.8, 4, spacer])
      cube([4.8, 2, spacer]);
      
      // left side spacer
     translate([0, 0,  spacer])
      cube([15, usbhub_depth, spacer]);
      
      // holders for Targus 4 port
      difference() {
        // end wall
        translate([main_box_x - 5, 3.2,  usbhub_thickness / 2 ])
        cube([5, usbhub_depth + .3, usbhub_thickness + usbhub_thickness / 2 + spacer - 3]);
        
        // usb cutout
         color("green")
        translate([main_box_x - 6, usbhub_depth / 2 -4 ,  usbhub_end_port_height])
        cube([7, usbhub_end_port_width + 3, usbhub_end_port_height]);
      }

      // end roof
      translate([main_box_x - 9, 3.5,  usbhub_thickness + usbhub_thickness / 2 + spacer - 1.2])
      cube([9, usbhub_depth, 5]);
      
      // side right wall
      translate([main_box_x - usbhub_front_face_safe_zone_right - 5, 0, 5])
      cube([usbhub_front_face_safe_zone_right + 5, 4, usbhub_thickness  + usbhub_thickness / 2 + spacer - 4]);
      
      // side right roof
       translate([main_box_x - usbhub_front_face_safe_zone_right - 5, 0, usbhub_thickness + usbhub_thickness / 2 + spacer - 1.2])
       cube([usbhub_front_face_safe_zone_right + 5, 9, 5]);
     
      // side left wall
      translate([0, 0, 5])
      cube([usbhub_front_face_safe_zone_left , 4, usbhub_thickness  + usbhub_thickness / 2 + spacer - 5]);
      
      // side left roof
      translate([0, 0, usbhub_thickness + usbhub_thickness / 2  + spacer - 1.2])
       cube([usbhub_front_face_safe_zone_left, 9, 5]);
  }
}
targus4mount();