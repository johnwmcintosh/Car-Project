include <../robot_settings.scad>

use <physical_ball_bearing.scad>
use <full_aparatus.scad>
use <dc_motor_mount.scad>
use <pull_bar.scad>
use <steering_rack.scad>
use <../Rear_End/front_end_jack.scad>
use <../spring_library.scad>
use <gear.scad>

$fn = 50;

module front_robot_rail(
  show_steering_apparatus = true,
  show_jackstand = false
 ){
 
  difference() {
        // rail
        //    
        cube([
          rail_width - rail_gap * wall_thickness, 
          rail_length, 
          rail_thickness], 
          center = true
        );
          
       // right attachment cutouts for extension
      translate([-20,  rail_length / 2 - 5, 0])
      cylinder(h = 2 * rail_thickness, d = 3, center = true);

       // left attachment cutouts for extension
      translate([20,  rail_length / 2 - 5, 0])
      cylinder(h = 2 * rail_thickness, d = 3, center = true);
    }
    
    translate([0, main_box_y, -35])
    full_apparatus();
 
    if (show_jackstand)
    {
      translate([0, rail_length / 2 + 5.5, -108])
      rotate([0,0, 180])
        front_end_jack();
    }

}

front_robot_rail();