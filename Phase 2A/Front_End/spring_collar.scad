include <../robot_settings.scad>

module spring_collar()
{
        difference() {
          cylinder(h = 5, r1 = ball_bearing_inner_diameter + .2, ball_bearing_outer_diameter / 2 + 1);
          
          translate([0, 0, 1])
          cylinder(h = 5, r1 = ball_bearing_inner_diameter / 2 + .2, ball_bearing_outer_diameter /2 + 1); 
          
          translate([0, 0, -5])
          cylinder(h = 10, d = ball_bearing_inner_diameter + 1);
        }
}
spring_collar();