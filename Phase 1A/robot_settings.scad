main_box_x = 95; // 96
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
raspberry_pi_peg_h = 4;

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

dc_motor_drivertype = "Teyleten"; // Teyleten
isAdafruit = (dc_motor_drivertype == "Adafruit");

drv8871_x = isAdafruit ? 20.3 : 21.6;
drv8871_y = isAdafruit ?  24 : 25;

drv8871_z = 2;
drv8871_screw_d = 2.5;
drv8871_solder_points_z = 2;

drv8871mount_edge_x = 1.5;
drv8871mount_edge_wall = 3;
drv8871mount_z = 5;
drv8871mount_x = drv8871_x +  drv8871mount_edge_wall - 2* drv8871mount_edge_x;
drv8871mount_y = 19;

drv8871_screw_distance = 15.64;
drv8871_solder_points_d = 1.66;
drv8871_solder_offset_y = 4.4;
drv8871_solder_inner_points_distance = 5;
drv8871_solder_outer_points_distance = 12;

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
dc_motor_axle_notch_cutout = 0.4;
dc_motor_axle_notch_cutout_z = 6;

pdmount_x = 20;
pdmount_y = 30;
pdmount_z = 2;
pdmount_edge_x = 1.5;
pdmount_edge_wall = 3;

steering_shaft_z = gear_post_height + dc_motor_axle_ring_z + pinion_gear_width + 15;
steering_shaft_d = 7;
steering_shaft_motor_fitting_d = 9;

lidar_mount_y = 110;
lidar_mount_x = 65 + 20;
lidar_narrow_screws = 40;
lidar_wide_screws = 56;
lidar_front_to_back_screws = 70;
lidar_screw_d = 3;
lidar_circuitboard_x = 20;
lidar_circuitboard_y = 35;
lidar_circuitboard_z = 1.2;
lidar_cord_length = 55;

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
axle_length = 30;
axle_reciever_inner_diameter = 7.75;
axle_reciever_length = 18.8;
axle_notch_length = 7;
axle_notch_cutout = 2.4;

// power distribution bar
power_bar_cutout_x = 96;
power_bar_y = 19.1;
power_bar_z = 1.5;
power_bar_screw_distance = 91.4;
power_bar_screw_d = 2.8;
power_bar_standoff_z = 5;
power_bar_standoff_d = 6.83;

// breadboard
breadboard_wall_thickness = 3;
breadboard_width = 55;
breadboard_length = 83;
breadboard_height = 10.5;
breadboard_notch_width = 3.8;
breadboard_longside_notch_separation = 58.2 - breadboard_notch_width / 2;
breadboard_shortside_notch_separation = 26.3 - breadboard_notch_width;
