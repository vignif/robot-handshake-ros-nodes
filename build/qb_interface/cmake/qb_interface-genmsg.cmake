# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "qb_interface: 7 messages, 0 services")

set(MSG_I_FLAGS "-Iqb_interface:/home/sirslab/ros_ws_handshake/src/qb_interface/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(qb_interface_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/handPos.msg" NAME_WE)
add_custom_target(_qb_interface_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "qb_interface" "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/handPos.msg" ""
)

get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/handRef.msg" NAME_WE)
add_custom_target(_qb_interface_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "qb_interface" "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/handRef.msg" ""
)

get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/handCurrent.msg" NAME_WE)
add_custom_target(_qb_interface_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "qb_interface" "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/handCurrent.msg" ""
)

get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubeEq_Preset.msg" NAME_WE)
add_custom_target(_qb_interface_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "qb_interface" "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubeEq_Preset.msg" ""
)

get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubePos.msg" NAME_WE)
add_custom_target(_qb_interface_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "qb_interface" "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubePos.msg" ""
)

get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubeRef.msg" NAME_WE)
add_custom_target(_qb_interface_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "qb_interface" "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubeRef.msg" ""
)

get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubeCurrent.msg" NAME_WE)
add_custom_target(_qb_interface_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "qb_interface" "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubeCurrent.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(qb_interface
  "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/handPos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/qb_interface
)
_generate_msg_cpp(qb_interface
  "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/handRef.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/qb_interface
)
_generate_msg_cpp(qb_interface
  "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/handCurrent.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/qb_interface
)
_generate_msg_cpp(qb_interface
  "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubePos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/qb_interface
)
_generate_msg_cpp(qb_interface
  "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubeRef.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/qb_interface
)
_generate_msg_cpp(qb_interface
  "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubeEq_Preset.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/qb_interface
)
_generate_msg_cpp(qb_interface
  "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubeCurrent.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/qb_interface
)

### Generating Services

### Generating Module File
_generate_module_cpp(qb_interface
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/qb_interface
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(qb_interface_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(qb_interface_generate_messages qb_interface_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/handPos.msg" NAME_WE)
add_dependencies(qb_interface_generate_messages_cpp _qb_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/handRef.msg" NAME_WE)
add_dependencies(qb_interface_generate_messages_cpp _qb_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/handCurrent.msg" NAME_WE)
add_dependencies(qb_interface_generate_messages_cpp _qb_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubeEq_Preset.msg" NAME_WE)
add_dependencies(qb_interface_generate_messages_cpp _qb_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubePos.msg" NAME_WE)
add_dependencies(qb_interface_generate_messages_cpp _qb_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubeRef.msg" NAME_WE)
add_dependencies(qb_interface_generate_messages_cpp _qb_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubeCurrent.msg" NAME_WE)
add_dependencies(qb_interface_generate_messages_cpp _qb_interface_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(qb_interface_gencpp)
add_dependencies(qb_interface_gencpp qb_interface_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS qb_interface_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(qb_interface
  "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/handPos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/qb_interface
)
_generate_msg_lisp(qb_interface
  "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/handRef.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/qb_interface
)
_generate_msg_lisp(qb_interface
  "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/handCurrent.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/qb_interface
)
_generate_msg_lisp(qb_interface
  "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubePos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/qb_interface
)
_generate_msg_lisp(qb_interface
  "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubeRef.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/qb_interface
)
_generate_msg_lisp(qb_interface
  "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubeEq_Preset.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/qb_interface
)
_generate_msg_lisp(qb_interface
  "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubeCurrent.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/qb_interface
)

### Generating Services

### Generating Module File
_generate_module_lisp(qb_interface
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/qb_interface
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(qb_interface_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(qb_interface_generate_messages qb_interface_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/handPos.msg" NAME_WE)
add_dependencies(qb_interface_generate_messages_lisp _qb_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/handRef.msg" NAME_WE)
add_dependencies(qb_interface_generate_messages_lisp _qb_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/handCurrent.msg" NAME_WE)
add_dependencies(qb_interface_generate_messages_lisp _qb_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubeEq_Preset.msg" NAME_WE)
add_dependencies(qb_interface_generate_messages_lisp _qb_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubePos.msg" NAME_WE)
add_dependencies(qb_interface_generate_messages_lisp _qb_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubeRef.msg" NAME_WE)
add_dependencies(qb_interface_generate_messages_lisp _qb_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubeCurrent.msg" NAME_WE)
add_dependencies(qb_interface_generate_messages_lisp _qb_interface_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(qb_interface_genlisp)
add_dependencies(qb_interface_genlisp qb_interface_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS qb_interface_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(qb_interface
  "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/handPos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/qb_interface
)
_generate_msg_py(qb_interface
  "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/handRef.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/qb_interface
)
_generate_msg_py(qb_interface
  "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/handCurrent.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/qb_interface
)
_generate_msg_py(qb_interface
  "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubePos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/qb_interface
)
_generate_msg_py(qb_interface
  "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubeRef.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/qb_interface
)
_generate_msg_py(qb_interface
  "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubeEq_Preset.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/qb_interface
)
_generate_msg_py(qb_interface
  "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubeCurrent.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/qb_interface
)

### Generating Services

### Generating Module File
_generate_module_py(qb_interface
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/qb_interface
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(qb_interface_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(qb_interface_generate_messages qb_interface_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/handPos.msg" NAME_WE)
add_dependencies(qb_interface_generate_messages_py _qb_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/handRef.msg" NAME_WE)
add_dependencies(qb_interface_generate_messages_py _qb_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/handCurrent.msg" NAME_WE)
add_dependencies(qb_interface_generate_messages_py _qb_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubeEq_Preset.msg" NAME_WE)
add_dependencies(qb_interface_generate_messages_py _qb_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubePos.msg" NAME_WE)
add_dependencies(qb_interface_generate_messages_py _qb_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubeRef.msg" NAME_WE)
add_dependencies(qb_interface_generate_messages_py _qb_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sirslab/ros_ws_handshake/src/qb_interface/msg/cubeCurrent.msg" NAME_WE)
add_dependencies(qb_interface_generate_messages_py _qb_interface_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(qb_interface_genpy)
add_dependencies(qb_interface_genpy qb_interface_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS qb_interface_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/qb_interface)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/qb_interface
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(qb_interface_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/qb_interface)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/qb_interface
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(qb_interface_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/qb_interface)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/qb_interface\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/qb_interface
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(qb_interface_generate_messages_py std_msgs_generate_messages_py)
endif()
