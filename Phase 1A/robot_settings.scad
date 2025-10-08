main_box_x = 95.5; // 96
main_box_y = 102;
main_box_z = 74; // 74.5
wall_thickness = 2;

rail_gap = 2;
rail_inset = 7;

rail_thickness = 7;
rail_length = 250;
rail_width = 200;

raspberry_pi_screw_seperation_y = 57;
raspberry_pi_screw_seperation_z = 48;
raspberry_pi_peg_h = 8;

gears_module = 1;
pinion_gear_teeth = 30;
pinion_gear_width = 5;
pinion_gear_bore = 4;

gears_setback_distance = 25;
gear_post_height = 2 * pinion_gear_width + rail_thickness + 8 ;

steering_motor_mount_x = 45;
steering_motor_mount_y = 36;
steering_motor_mount_z = 18;
steering_motor_mount_setback_distance = gears_setback_distance + 16;

dc_motor_housing_minus_encoder_z = 48;
dc_motor_encoder_z = 9.33;
dc_motor_encoder_wheel_d = 13.4;
dc_motor_encoder_wheel_thickness = 5;
dc_motor_encoder_wheel_gap = 3;
dc_motor_encoder_circuit_thickness = 2;
dc_motor_cutout_d = 24.8;
dc_motor_cutout_z = 19.5;

dc_motor_screw_head_z = 2;
dc_motor_screw_head_d = 5.6;
dc_motor_screw_d = 3.2;
dc_motor_screw_offset = 8.5;

dc_motor_axle_ring_z = 3;
dc_motor_axle_ring_d = 7.2;
dc_motor_axle_cutout_d = 4.5;
dc_motor_axle_cutout_z = 10;
dc_motor_axle_notch_cutout = 0.5;
dc_motor_axle_notch_cutout_z = 6;

steering_shaft_z = gear_post_height + dc_motor_axle_ring_z + pinion_gear_width + 15;
steering_shaft_d = 7;
steering_shaft_motor_fitting_d = 9;

lidar_mount_y = 125;
lidar_mount_x = 65;

ball_bearing_height = 7;
ball_bearing_outer_diameter = 22;
ball_bearing_inner_diameter = 8;

pull_bar_radius = 3.3;

rack_module = 1;
rack_length = main_box_x / 2;
rack_height = 10;
rack_width = 10;
rack_teeth = 30;
rack_bore = 3;

// tire hardware
axle_reciever_inner_diameter = 7.75;
axle_reciever_length = 18.8;
axle_notch_length = 7;
axle_notch_cutout = 2.4;