include <../robot_settings.scad>

use <physical_ball_bearing.scad>
use <tire_apparatus.scad>
use <dc_motor_mount.scad>
use <pull_bar.scad>
use <steering_rack.scad>
use <../Rear_End/front_end_jack.scad>
use <../spring_library.scad>
use <MCAD/involute_gears.scad>

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
      
      // alan wrench access cutout 
      translate([0,  rail_length / 2 + .1, -3.8])
      rotate([90, 0, 0])
      cylinder(h = 91, d = 3.5);
      
       // left attachment cutouts for extension
      translate([20,  rail_length / 2 - 5, 0])
      cylinder(h = 2 * rail_thickness, d = 3, center = true);
      
    // cutout for tire apparatus
    translate([
      -rail_width / 2 +  ball_bearing_outer_diameter, 
      rail_length / 2 - gears_setback_distance,  
      - rail_thickness / 2 - .1
      ])
      cylinder(
          h = rail_thickness + rail_gap + .2, 
          d = ball_bearing_outer_diameter + .1
          );
     
    // cutout for tire apparatus
    translate([
      rail_width / 2 - ball_bearing_outer_diameter, 
      rail_length / 2 - gears_setback_distance,
       - rail_thickness / 2 - .1
      ])
      cylinder(
        h = rail_thickness + rail_gap + .2, 
        d = ball_bearing_outer_diameter + .1
        );
   
      // cutout for gears
      translate([
        0, 
        rail_length / 2  - gears_setback_distance -  16, 
         -rail_gap - 2
      ])
     cylinder(h = rail_thickness + 2, d = ball_bearing_outer_diameter); 

      // side cutout for screw access
     translate([
        ball_bearing_outer_diameter / 2, 
        rail_length / 2  - gears_setback_distance -  16, 
         -rail_gap - 2
     ])
      cylinder(
        h = rail_thickness + 2, 
        d = dc_motor_screw_head_d);
      
     // side cutout for screw access
     translate([
       -ball_bearing_outer_diameter / 2, 
        rail_length / 2  - gears_setback_distance -  16, 
         -rail_gap - 2
     ])
     cylinder(
        h = rail_thickness + 2, 
        d = dc_motor_screw_head_d
      );
  }

    // motor mount
    translate([
      0, 
      rail_length / 2  - steering_motor_mount_setback_distance, 
      rail_thickness / 2 + 1
      ])
      dc_motor_mount(show_steering_shaft = show_steering_apparatus);
  
    if (show_steering_apparatus) {
       
      //translate([rail_width / 2, gears_setback_distance, rail_thickness/2])
      //physical_ball_bearing();

      // center post for gears
      // drive shaft
      // see dc_motor_mount.scad
     
      // lower gear
     translate([
        0, 
        rail_length / 2  - steering_motor_mount_setback_distance, 
      -47 
      ])
      {
        difference() {
        rotate([0,0,5])
          gear(gear_thickness = pinion_gear_width,
               number_of_teeth = pinion_gear_teeth,
               circular_pitch = gears_module * PI,
               bore_diameter = ball_bearing_inner_diameter,
               pressure_angle = 20,
               clearance = 0,
               backlash = .5);
          
          translate([0,0,-2])
          cube([ball_bearing_inner_diameter - 1, 2, 10]);
        }
      }

      // apparatus
      translate([
        -rail_width / 2 +  ball_bearing_outer_diameter - 4, 
        rail_length / 2 - gears_setback_distance,  
        -42
        ])
      tire_apparatus(
          axle_length = axle_reciever_length, 
          pull_bar_length = rail_width / 2 - rack_length + 1, 
          post_height = 10,
          dish_offset = 6, 
          flip_spring = false, 
          axle_rotation = false,
          draw_left_apparatus = true);
       
      // rack
      color("yellow")
      translate([
        0, 
        rail_length / 2 - gears_setback_distance -  34.5, 
        -47
       ])
      rotate([0,0,0])
      {
          steering_rack();
      }
      

      
      // apparatus
      translate([
        rail_width / 2 - ball_bearing_outer_diameter - 4, 
        rail_length / 2 - gears_setback_distance,
       -42
      ])
      tire_apparatus(
          axle_length = axle_reciever_length, 
          pull_bar_length = rail_width / 2 - rack_length + 1.5, 
          post_height = 10,
          dish_offset = 6,
          flip_spring = false, 
          axle_rotation = true,
          draw_left_apparatus = false);
     
      //translate([ball_bearing_outer_diameter, 31,  rail_thickness - 1.5])
     // physical_ball_bearing();
        
      //translate([rail_width - ball_bearing_outer_diameter, 31, rail_thickness - 1.5])
       // physical_ball_bearing();
    }
    
    if (show_jackstand)
    {
      translate([0, rail_length / 2 + 5.5, -108])
      rotate([0,0, 180])
        front_end_jack();
    }

}

front_robot_rail();