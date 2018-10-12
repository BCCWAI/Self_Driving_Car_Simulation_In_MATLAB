close all
clc
%% Creat your object
initial_states=[0 -250 0 0];
initial_inputs=[pi/25 12];

Lambo=Car(initial_states,initial_inputs);

N = 200;

way_points = generate_trajectory(0.05);

myTrajectory = Trajectory(way_points);

for i = 1: N
    figure(1);
    
    myTrajectory.nearest_points(Lambo);
    myTrajectory.poly_fit(Lambo);
    myTrajectory.compute_error;
    myTrajectory.show(Lambo);
    
    myTrajectory.cte

    Lambo.show;
    Lambo.PID_Controller(myTrajectory.cte);
    Lambo.control_inputs(1)
    xlim([-300 300])
    ylim([-300 300])
    Lambo.update_state;
   
end