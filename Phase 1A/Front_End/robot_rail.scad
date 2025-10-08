include <../robot_settings.scad>

use <physical_ball_bearing.scad>
use <tire_apparatus.scad>
use <dc_motor_mount.scad>
use <../spring_library.scad>
use <MCAD/involute_gears.scad>
use <OpenSCAD_Gear_Library_with_Customizer/files/gears.scad>
$fn = 50;

module front_robot_rail(show_steering_apparatus = true) {
  
  difference() {
    // rail
    //translate([rail_gap, -rail_length + 50, rail_gap])
    cube([
      rail_width - rail_gap * wall_thickness, 
      rail_length, 
      rail_thickness], 
      center = true
    );
    
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
      ball_bearing_outer_diameter / 2 - 1.5, 
      rail_length / 2  - gears_setback_distance -  16, 
       -rail_gap - 2
   ])
    cylinder(
      h = rail_thickness + 2, 
      d = dc_motor_screw_head_d);
  
   // side cutout for screw access
   translate([
     -ball_bearing_outer_diameter / 2 + 1.5, 
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
      dc_motor_mount(show_steering_shaft = false);
  
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
    rotate([0,0,5])
      gear(gear_thickness = pinion_gear_width,
           number_of_teeth = pinion_gear_teeth,
           circular_pitch = gears_module * PI,
           bore_diameter = ball_bearing_inner_diameter / 1.74,
           pressure_angle = 20,
           clearance = 0,
           backlash = .5);

    // apparatus
    translate([
      -rail_width / 2 +  ball_bearing_outer_diameter - 4, 
      rail_length / 2 - gears_setback_distance,  
      -42
      ])
    tire_apparatus(
        axle_length = axle_reciever_length, 
        pull_bar_length = rail_width / 2 - rack_length + 1, 
        post_height = 6, 
        flip_spring = false, 
        axle_rotation = false,
        draw_left_apparatus = true);
     
    // rack
    color("blue")
    translate([
      0, 
      rail_length / 2 - gears_setback_distance -  31, 
      -47
     ])
    rotate([0,0,0])
    {
      difference() {
        zahnstange(rack_module, rack_length, rack_height, rack_width);

         translate([-rack_length / 2, rack_width /2 - 4 * pull_bar_radius , rack_height /2 - pull_bar_radius])
        cube(2 * pull_bar_radius);
        
         translate([rack_length / 2 - 2 * pull_bar_radius + .75, rack_width /2 - 4 * pull_bar_radius , rack_height - pull_bar_radius - 5])
        cube(2 * pull_bar_radius);     
        }
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
        post_height = 6, 
        flip_spring = false, 
        axle_rotation = true,
        draw_left_apparatus = false);
   
    //translate([ball_bearing_outer_diameter, 31,  rail_thickness - 1.5])
   // physical_ball_bearing();
      
    //translate([rail_width - ball_bearing_outer_diameter, 31, rail_thickness - 1.5])
     // physical_ball_bearing();
  }
}
front_robot_rail();
