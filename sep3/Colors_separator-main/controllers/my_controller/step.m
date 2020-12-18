function step(t) 
    if (wb_robot_step(t) == -1) 
      wb_robot_cleanup();
    end
end