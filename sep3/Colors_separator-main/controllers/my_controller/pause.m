function pause(time_s,wait) 
   start_time = wb_robot_get_time();
    while (start_time + time_s > wb_robot_get_time())
      step(wait);
    end
end

