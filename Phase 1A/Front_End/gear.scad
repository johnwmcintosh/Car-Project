include <../robot_settings.scad>
use <MCAD/involute_gears.scad>

module geared() {
      translate([0, 0, 0])
        difference() {
        rotate([0,0,6])
          gear(gear_thickness = pinion_gear_width,
               number_of_teeth = pinion_gear_teeth,
               circular_pitch = gears_module * PI * 1.1,
               bore_diameter = ball_bearing_inner_diameter,
               pressure_angle = 20,
               clearance = 0,
               backlash = .5);
          
          translate([0,-1,-2])
          cube([ball_bearing_inner_diameter - 1, 2, 10]);
        }
    }
    geared();
    