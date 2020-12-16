% MATLAB controller for Webots
% File:          my_controller.m
% Date:
% Description:
% Author:
% Modifications:

% uncomment the next two lines if you want to use
% MATLAB's desktop to interact with the controller:
%desktop;
%keyboard;

TIME_STEP = 64;

% get and enable devices, e.g.:
%  camera = wb_robot_get_device('camera');
%  wb_camera_enable(camera, TIME_STEP);
%  motor = wb_robot_get_device('motor');

% main loop:
% perform simulation steps of TIME_STEP milliseconds
% and leave the loop when Webots signals the termination
%
motor_1 = wb_robot_get_device('forearm');
% wb_motor_set_position(motor_1, 1.5)
motor_2 = wb_robot_get_device('wrist');
wb_motor_set_position(motor_2, -0.8)
motor_3 = wb_robot_get_device('upperarm');
wb_motor_set_position(motor_3, -1.5)
gripper_l = wb_robot_get_device('left_gripper');
wb_motor_set_position(gripper_l, -1)
gripper_r = wb_robot_get_device('right_gripper');
wb_motor_set_position(gripper_r, 1)
motor_4 = wb_robot_get_device('rotational_wrist');
wb_motor_set_position(motor_4, -3)
motor_5 = wb_robot_get_device('base');

dis_senzor_1 = wb_robot_get_device('ds4');
wb_distance_sensor_enable(dis_senzor_1, TIME_STEP)
dis_senzor_2 = wb_robot_get_device('pozicia_kocky');
wb_distance_sensor_enable(dis_senzor_2, TIME_STEP)

while wb_robot_step(TIME_STEP) ~= -1
distance = wb_distance_sensor_get_value(dis_senzor_2)
if distance > 0.8
wb_motor_set_position(gripper_r, 0.2)
wb_motor_set_position(gripper_l, -0.2)
pause(1, TIME_STEP)
wb_motor_set_position(motor_3, 0)
wb_motor_set_position(motor_5, 5)
end

  % read the sensors, e.g.:
  %  rgb = wb_camera_get_image(camera);

  % Process here sensor data, images, etc.

  % send actuator commands, e.g.:
  %  wb_motor_set_postion(motor, 10.0);

  % if your code plots some graphics, it needs to flushed like this:
  drawnow;

end

% cleanup code goes here: write data to files, etc.
