   include <../robot_settings.scad>
   
   module breadboard_mount() {
      difference() { 
      // main box
     cube([breadboard_width + breadboard_wall_thickness, breadboard_length + breadboard_wall_thickness, breadboard_height], center = true);
     
     // main box cutout 
     translate([0, 0, wall_thickness])
     cube([breadboard_width, breadboard_length, breadboard_height], center = true);
   
      // left longside notch
      translate([-breadboard_width / 2, breadboard_longside_notch_separation / 2 - 0.4, breadboard_wall_thickness])
      cube([2 *breadboard_wall_thickness, breadboard_notch_width, breadboard_height], center = true);
     
        // right longside notch
        translate([-breadboard_width / 2, -breadboard_longside_notch_separation / 2 + 1.4, breadboard_wall_thickness])
        cube([2 *breadboard_wall_thickness, breadboard_notch_width, breadboard_height], center = true);
     
      // center shortside notch
      translate([0, -breadboard_length / 2, wall_thickness])
      cube([breadboard_notch_width, 2 *breadboard_wall_thickness, breadboard_height], center = true);
     
       // right shortside notch
       translate([-breadboard_shortside_notch_separation, -breadboard_length / 2, breadboard_wall_thickness])
       cube([breadboard_notch_width, 2 *breadboard_wall_thickness, breadboard_height], center = true);
     
      // left shortside notch
      translate([breadboard_shortside_notch_separation, -breadboard_length / 2, breadboard_wall_thickness])
      cube([breadboard_notch_width, 2 *breadboard_wall_thickness, breadboard_height], center = true);
  }
}
breadboard_mount();