# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "rosbridge_library: 9 messages, 10 services")

set(MSG_I_FLAGS "-Irosbridge_library:/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(rosbridge_library_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestRequestAndResponse.srv" NAME_WE)
add_custom_target(_rosbridge_library_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosbridge_library" "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestRequestAndResponse.srv" ""
)

get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestResponseOnly.srv" NAME_WE)
add_custom_target(_rosbridge_library_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosbridge_library" "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestResponseOnly.srv" ""
)

get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestHeaderTwo.msg" NAME_WE)
add_custom_target(_rosbridge_library_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosbridge_library" "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestHeaderTwo.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/AddTwoInts.srv" NAME_WE)
add_custom_target(_rosbridge_library_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosbridge_library" "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/AddTwoInts.srv" ""
)

get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestUInt8FixedSizeArray16.msg" NAME_WE)
add_custom_target(_rosbridge_library_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosbridge_library" "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestUInt8FixedSizeArray16.msg" ""
)

get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestMultipleResponseFields.srv" NAME_WE)
add_custom_target(_rosbridge_library_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosbridge_library" "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestMultipleResponseFields.srv" ""
)

get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestDurationArray.msg" NAME_WE)
add_custom_target(_rosbridge_library_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosbridge_library" "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestDurationArray.msg" ""
)

get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestNestedService.srv" NAME_WE)
add_custom_target(_rosbridge_library_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosbridge_library" "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestNestedService.srv" "geometry_msgs/Quaternion:std_msgs/Float64:geometry_msgs/Point:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestEmpty.srv" NAME_WE)
add_custom_target(_rosbridge_library_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosbridge_library" "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestEmpty.srv" ""
)

get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestChar.msg" NAME_WE)
add_custom_target(_rosbridge_library_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosbridge_library" "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestChar.msg" ""
)

get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/Num.msg" NAME_WE)
add_custom_target(_rosbridge_library_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosbridge_library" "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/Num.msg" ""
)

get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/SendBytes.srv" NAME_WE)
add_custom_target(_rosbridge_library_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosbridge_library" "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/SendBytes.srv" ""
)

get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestArrayRequest.srv" NAME_WE)
add_custom_target(_rosbridge_library_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosbridge_library" "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestArrayRequest.srv" ""
)

get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestHeaderArray.msg" NAME_WE)
add_custom_target(_rosbridge_library_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosbridge_library" "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestHeaderArray.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestHeader.msg" NAME_WE)
add_custom_target(_rosbridge_library_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosbridge_library" "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestHeader.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestTimeArray.msg" NAME_WE)
add_custom_target(_rosbridge_library_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosbridge_library" "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestTimeArray.msg" ""
)

get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestRequestOnly.srv" NAME_WE)
add_custom_target(_rosbridge_library_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosbridge_library" "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestRequestOnly.srv" ""
)

get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestMultipleRequestFields.srv" NAME_WE)
add_custom_target(_rosbridge_library_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosbridge_library" "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestMultipleRequestFields.srv" ""
)

get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestUInt8.msg" NAME_WE)
add_custom_target(_rosbridge_library_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosbridge_library" "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestUInt8.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestHeaderTwo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbridge_library
)
_generate_msg_cpp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestUInt8FixedSizeArray16.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbridge_library
)
_generate_msg_cpp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestChar.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbridge_library
)
_generate_msg_cpp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestDurationArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbridge_library
)
_generate_msg_cpp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbridge_library
)
_generate_msg_cpp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestHeaderArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbridge_library
)
_generate_msg_cpp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestTimeArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbridge_library
)
_generate_msg_cpp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestHeader.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbridge_library
)
_generate_msg_cpp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestUInt8.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbridge_library
)

### Generating Services
_generate_srv_cpp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestRequestAndResponse.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbridge_library
)
_generate_srv_cpp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestResponseOnly.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbridge_library
)
_generate_srv_cpp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestRequestOnly.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbridge_library
)
_generate_srv_cpp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbridge_library
)
_generate_srv_cpp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestMultipleResponseFields.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbridge_library
)
_generate_srv_cpp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestEmpty.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbridge_library
)
_generate_srv_cpp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/SendBytes.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbridge_library
)
_generate_srv_cpp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestArrayRequest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbridge_library
)
_generate_srv_cpp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestMultipleRequestFields.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbridge_library
)
_generate_srv_cpp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestNestedService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Float64.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbridge_library
)

### Generating Module File
_generate_module_cpp(rosbridge_library
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbridge_library
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(rosbridge_library_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(rosbridge_library_generate_messages rosbridge_library_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestRequestAndResponse.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_cpp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestResponseOnly.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_cpp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestHeaderTwo.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_cpp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_cpp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestUInt8FixedSizeArray16.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_cpp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestMultipleResponseFields.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_cpp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestDurationArray.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_cpp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestNestedService.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_cpp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestEmpty.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_cpp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestChar.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_cpp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/Num.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_cpp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/SendBytes.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_cpp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestArrayRequest.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_cpp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestHeaderArray.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_cpp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestHeader.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_cpp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestTimeArray.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_cpp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestRequestOnly.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_cpp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestMultipleRequestFields.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_cpp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestUInt8.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_cpp _rosbridge_library_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rosbridge_library_gencpp)
add_dependencies(rosbridge_library_gencpp rosbridge_library_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rosbridge_library_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestHeaderTwo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbridge_library
)
_generate_msg_lisp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestUInt8FixedSizeArray16.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbridge_library
)
_generate_msg_lisp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestChar.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbridge_library
)
_generate_msg_lisp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestDurationArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbridge_library
)
_generate_msg_lisp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbridge_library
)
_generate_msg_lisp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestHeaderArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbridge_library
)
_generate_msg_lisp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestTimeArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbridge_library
)
_generate_msg_lisp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestHeader.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbridge_library
)
_generate_msg_lisp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestUInt8.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbridge_library
)

### Generating Services
_generate_srv_lisp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestRequestAndResponse.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbridge_library
)
_generate_srv_lisp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestResponseOnly.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbridge_library
)
_generate_srv_lisp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestRequestOnly.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbridge_library
)
_generate_srv_lisp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbridge_library
)
_generate_srv_lisp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestMultipleResponseFields.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbridge_library
)
_generate_srv_lisp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestEmpty.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbridge_library
)
_generate_srv_lisp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/SendBytes.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbridge_library
)
_generate_srv_lisp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestArrayRequest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbridge_library
)
_generate_srv_lisp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestMultipleRequestFields.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbridge_library
)
_generate_srv_lisp(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestNestedService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Float64.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbridge_library
)

### Generating Module File
_generate_module_lisp(rosbridge_library
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbridge_library
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(rosbridge_library_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(rosbridge_library_generate_messages rosbridge_library_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestRequestAndResponse.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_lisp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestResponseOnly.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_lisp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestHeaderTwo.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_lisp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_lisp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestUInt8FixedSizeArray16.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_lisp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestMultipleResponseFields.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_lisp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestDurationArray.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_lisp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestNestedService.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_lisp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestEmpty.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_lisp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestChar.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_lisp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/Num.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_lisp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/SendBytes.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_lisp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestArrayRequest.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_lisp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestHeaderArray.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_lisp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestHeader.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_lisp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestTimeArray.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_lisp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestRequestOnly.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_lisp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestMultipleRequestFields.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_lisp _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestUInt8.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_lisp _rosbridge_library_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rosbridge_library_genlisp)
add_dependencies(rosbridge_library_genlisp rosbridge_library_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rosbridge_library_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestHeaderTwo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbridge_library
)
_generate_msg_py(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestUInt8FixedSizeArray16.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbridge_library
)
_generate_msg_py(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestChar.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbridge_library
)
_generate_msg_py(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestDurationArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbridge_library
)
_generate_msg_py(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbridge_library
)
_generate_msg_py(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestHeaderArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbridge_library
)
_generate_msg_py(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestTimeArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbridge_library
)
_generate_msg_py(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestHeader.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbridge_library
)
_generate_msg_py(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestUInt8.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbridge_library
)

### Generating Services
_generate_srv_py(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestRequestAndResponse.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbridge_library
)
_generate_srv_py(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestResponseOnly.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbridge_library
)
_generate_srv_py(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestRequestOnly.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbridge_library
)
_generate_srv_py(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbridge_library
)
_generate_srv_py(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestMultipleResponseFields.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbridge_library
)
_generate_srv_py(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestEmpty.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbridge_library
)
_generate_srv_py(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/SendBytes.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbridge_library
)
_generate_srv_py(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestArrayRequest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbridge_library
)
_generate_srv_py(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestMultipleRequestFields.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbridge_library
)
_generate_srv_py(rosbridge_library
  "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestNestedService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Float64.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbridge_library
)

### Generating Module File
_generate_module_py(rosbridge_library
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbridge_library
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(rosbridge_library_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(rosbridge_library_generate_messages rosbridge_library_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestRequestAndResponse.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_py _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestResponseOnly.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_py _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestHeaderTwo.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_py _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_py _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestUInt8FixedSizeArray16.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_py _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestMultipleResponseFields.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_py _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestDurationArray.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_py _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestNestedService.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_py _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestEmpty.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_py _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestChar.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_py _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/Num.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_py _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/SendBytes.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_py _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestArrayRequest.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_py _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestHeaderArray.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_py _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestHeader.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_py _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestTimeArray.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_py _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestRequestOnly.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_py _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/srv/TestMultipleRequestFields.srv" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_py _rosbridge_library_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_library/msg/TestUInt8.msg" NAME_WE)
add_dependencies(rosbridge_library_generate_messages_py _rosbridge_library_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rosbridge_library_genpy)
add_dependencies(rosbridge_library_genpy rosbridge_library_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rosbridge_library_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbridge_library)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosbridge_library
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(rosbridge_library_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(rosbridge_library_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbridge_library)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosbridge_library
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(rosbridge_library_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(rosbridge_library_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbridge_library)
  install(CODE "execute_process(COMMAND \"/home/francesco/anaconda2/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbridge_library\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbridge_library
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbridge_library
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosbridge_library/.+/__init__.pyc?$"
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(rosbridge_library_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(rosbridge_library_generate_messages_py geometry_msgs_generate_messages_py)
endif()
