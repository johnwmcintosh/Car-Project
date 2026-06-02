include <tobsun_parts.scad>
include <../robot_settings.scad>
use <robot_rail.scad>
use <../rear_end/pico2.scad>
use <../rear_end/RP5.scad>

use<battery_box_peg_mounts.scad>
use <targus4mount.scad>

module battery_box() {

  translate([-main_box_x / 2, -main_box_y / 2,6])
  difference() {
      // battery box
    translate([0, -1, 0])
      cube([main_box_x, main_box_y + 1, main_box_z]);

      // battery box cutout    
      translate([wall_thickness - .2, wall_thickness, wall_thickness])
      cube([main_box_x - 2 * wall_thickness, main_box_y + wall_thickness + 2, main_box_z - 2 * wall_thickness]);

      // side windows
      translate([-wall_thickness, wall_thickness + 4 * wall_thickness, main_box_z / 2 - main_box_z /6])
      cube([main_box_x + 2 * wall_thickness, main_box_y - 10 * wall_thickness, main_box_z / 4]);

      // back window
      translate([main_box_x / 4, -wall_thickness, main_box_z / 4])
      cube([main_box_x / 2, 4 * wall_thickness, main_box_z / 2]);
  
    // notch on the back wall because the battery has a little bump there.
    translate([2 * wall_thickness - .1, wall_thickness - 1.5, wall_thickness + rail_gap - 6]) {
        difference() {
          color("yellow")
            translate([- wall_thickness + .1, 0, wall_thickness + rail_gap + .5 ])
            cube([main_box_x -2 * wall_thickness - .6, 3, main_box_z - wall_thickness - rail_gap - .6]);
          
            translate([6 - wall_thickness - .7,  -1.5, wall_thickness + rail_gap + 5])
            cube([main_box_x - wall_thickness  - 13, 6, main_box_z - wall_thickness - rail_gap - 10]);
          }
      }  
  }

  // rp5 mounting pegs - top right
  translate([-main_box_x / 2, -main_box_y / 2, 0])
  RP5();
 
  // pico extender
  // orientate it so that gpios are easy to access the wires
  translate([main_box_x / 2 + 2, -main_box_y +100, 45])
  rotate([90, 0, 0])
  pico_mounts();
 
// tobsun
translate([ - tobsun_shelf_width / 2, -main_box_y/11.3, main_box_z + rail_gap + 2 * wall_thickness])
tobsun_tray();

battery_box_peg_mounts(show_mounts = true, show_points = false);

translate([-main_box_x / 2, - main_box_y / 2 , 0])
  // usb hub mount
  targus4mount();
  
}
battery_box();