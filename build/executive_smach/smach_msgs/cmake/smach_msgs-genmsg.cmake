# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "smach_msgs: 3 messages, 0 services")

set(MSG_I_FLAGS "-Ismach_msgs:/home/francesco/ros_ws_handshake/src/executive_smach/smach_msgs/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(smach_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/executive_smach/smach_msgs/msg/SmachContainerInitialStatusCmd.msg" NAME_WE)
add_custom_target(_smach_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "smach_msgs" "/home/francesco/ros_ws_handshake/src/executive_smach/smach_msgs/msg/SmachContainerInitialStatusCmd.msg" ""
)

get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/executive_smach/smach_msgs/msg/SmachContainerStructure.msg" NAME_WE)
add_custom_target(_smach_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "smach_msgs" "/home/francesco/ros_ws_handshake/src/executive_smach/smach_msgs/msg/SmachContainerStructure.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/executive_smach/smach_msgs/msg/SmachContainerStatus.msg" NAME_WE)
add_custom_target(_smach_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "smach_msgs" "/home/francesco/ros_ws_handshake/src/executive_smach/smach_msgs/msg/SmachContainerStatus.msg" "std_msgs/Header"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(smach_msgs
  "/home/francesco/ros_ws_handshake/src/executive_smach/smach_msgs/msg/SmachContainerInitialStatusCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/smach_msgs
)
_generate_msg_cpp(smach_msgs
  "/home/francesco/ros_ws_handshake/src/executive_smach/smach_msgs/msg/SmachContainerStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/smach_msgs
)
_generate_msg_cpp(smach_msgs
  "/home/francesco/ros_ws_handshake/src/executive_smach/smach_msgs/msg/SmachContainerStructure.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/smach_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(smach_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/smach_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(smach_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(smach_msgs_generate_messages smach_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/executive_smach/smach_msgs/msg/SmachContainerInitialStatusCmd.msg" NAME_WE)
add_dependencies(smach_msgs_generate_messages_cpp _smach_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/executive_smach/smach_msgs/msg/SmachContainerStructure.msg" NAME_WE)
add_dependencies(smach_msgs_generate_messages_cpp _smach_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/executive_smach/smach_msgs/msg/SmachContainerStatus.msg" NAME_WE)
add_dependencies(smach_msgs_generate_messages_cpp _smach_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(smach_msgs_gencpp)
add_dependencies(smach_msgs_gencpp smach_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS smach_msgs_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(smach_msgs
  "/home/francesco/ros_ws_handshake/src/executive_smach/smach_msgs/msg/SmachContainerInitialStatusCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/smach_msgs
)
_generate_msg_lisp(smach_msgs
  "/home/francesco/ros_ws_handshake/src/executive_smach/smach_msgs/msg/SmachContainerStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/smach_msgs
)
_generate_msg_lisp(smach_msgs
  "/home/francesco/ros_ws_handshake/src/executive_smach/smach_msgs/msg/SmachContainerStructure.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/smach_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(smach_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/smach_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(smach_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(smach_msgs_generate_messages smach_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/executive_smach/smach_msgs/msg/SmachContainerInitialStatusCmd.msg" NAME_WE)
add_dependencies(smach_msgs_generate_messages_lisp _smach_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/executive_smach/smach_msgs/msg/SmachContainerStructure.msg" NAME_WE)
add_dependencies(smach_msgs_generate_messages_lisp _smach_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/executive_smach/smach_msgs/msg/SmachContainerStatus.msg" NAME_WE)
add_dependencies(smach_msgs_generate_messages_lisp _smach_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(smach_msgs_genlisp)
add_dependencies(smach_msgs_genlisp smach_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS smach_msgs_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(smach_msgs
  "/home/francesco/ros_ws_handshake/src/executive_smach/smach_msgs/msg/SmachContainerInitialStatusCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/smach_msgs
)
_generate_msg_py(smach_msgs
  "/home/francesco/ros_ws_handshake/src/executive_smach/smach_msgs/msg/SmachContainerStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/smach_msgs
)
_generate_msg_py(smach_msgs
  "/home/francesco/ros_ws_handshake/src/executive_smach/smach_msgs/msg/SmachContainerStructure.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/smach_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(smach_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/smach_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(smach_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(smach_msgs_generate_messages smach_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/executive_smach/smach_msgs/msg/SmachContainerInitialStatusCmd.msg" NAME_WE)
add_dependencies(smach_msgs_generate_messages_py _smach_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/executive_smach/smach_msgs/msg/SmachContainerStructure.msg" NAME_WE)
add_dependencies(smach_msgs_generate_messages_py _smach_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francesco/ros_ws_handshake/src/executive_smach/smach_msgs/msg/SmachContainerStatus.msg" NAME_WE)
add_dependencies(smach_msgs_generate_messages_py _smach_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(smach_msgs_genpy)
add_dependencies(smach_msgs_genpy smach_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS smach_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/smach_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/smach_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(smach_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/smach_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/smach_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(smach_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/smach_msgs)
  install(CODE "execute_process(COMMAND \"/home/francesco/anaconda2/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/smach_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/smach_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(smach_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
