execute_process(COMMAND "/home/francesco/ros_ws_handshake/build/executive_smach/smach_ros/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/francesco/ros_ws_handshake/build/executive_smach/smach_ros/catkin_generated/python_distutils_install.sh) returned error code ")
endif()