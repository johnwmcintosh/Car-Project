  include <../robot_settings.scad>      
  $fn = 50;
  
module dc_motor
(
)

{        
        rotate([0,90,0])
        cylinder(h = dc_motor_housing_minus_encoder_z, d = dc_motor_cutout_d);
      
      translate([
        -dc_motor_encoder_circuit_thickness - .5, 
        0, 
        0
        ])
        rotate([0,90,0])
       cylinder(h = dc_motor_encoder_circuit_thickness, d = dc_motor_cutout_d);
      
      translate([
        -dc_motor_encoder_circuit_thickness - dc_motor_encoder_wheel_gap, 
        0, 
        0
        ])
        rotate([0,90.0])
        cylinder(h = dc_motor_encoder_wheel_gap, d = 3);
        
      translate([
        -dc_motor_encoder_circuit_thickness - dc_motor_encoder_wheel_gap - dc_motor_encoder_wheel_thickness,
        0,
        0])
        rotate([0,90,0])
        cylinder(h = dc_motor_encoder_wheel_thickness, d = dc_motor_encoder_wheel_d);
        
        translate([
          dc_motor_housing_minus_encoder_z, 0, 0
        ])
        rotate([0,90,0])
          cylinder(h = dc_motor_axle_ring_z, d = dc_motor_axle_ring_d);
          
        translate([
          dc_motor_housing_minus_encoder_z + dc_motor_axle_ring_z,
          0,
          0
        ])
        rotate([0,90,0])
        {
          difference() {
            cylinder(h = dc_motor_axle_cutout_z, d = dc_motor_axle_cutout_d);          
             // axle notch
            translate([
              -3, 
              dc_motor_axle_notch_cutout,
              dc_motor_axle_cutout_z - axle_notch_length - 1
            ])
            cube([
              axle_notch_length , 
              axle_reciever_inner_diameter / 2, 
              dc_motor_axle_cutout_z]);
          }
          
          // screw holes
          color("blue")
          translate([0, dc_motor_screw_offset, - dc_motor_axle_ring_z - 1])
          cylinder(h = 3, d = dc_motor_screw_d);
          
          color("blue")         
          translate([0, -dc_motor_screw_offset, - dc_motor_axle_ring_z - 1])
          cylinder(h = 3, d = dc_motor_screw_d);
   
       }
}
dc_motor();
