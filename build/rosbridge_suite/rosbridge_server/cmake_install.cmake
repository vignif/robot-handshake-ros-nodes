# Install script for directory: /home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_server

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/home/francesco/ros_ws_handshake/install")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  INCLUDE("/home/francesco/ros_ws_handshake/build/rosbridge_suite/rosbridge_server/catkin_generated/safe_execute_install.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/francesco/ros_ws_handshake/build/rosbridge_suite/rosbridge_server/catkin_generated/installspace/rosbridge_server.pc")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rosbridge_server/cmake" TYPE FILE FILES
    "/home/francesco/ros_ws_handshake/build/rosbridge_suite/rosbridge_server/catkin_generated/installspace/rosbridge_serverConfig.cmake"
    "/home/francesco/ros_ws_handshake/build/rosbridge_suite/rosbridge_server/catkin_generated/installspace/rosbridge_serverConfig-version.cmake"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rosbridge_server" TYPE FILE FILES "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_server/package.xml")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/rosbridge_server" TYPE PROGRAM FILES
    "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_server/scripts/rosbridge_websocket.py"
    "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_server/scripts/rosbridge_websocket"
    "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_server/scripts/rosbridge_tcp.py"
    "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_server/scripts/rosbridge_tcp"
    "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_server/scripts/rosbridge_udp"
    "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_server/scripts/rosbridge_udp.py"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rosbridge_server/launch" TYPE FILE FILES
    "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_server/launch/rosbridge_websocket.launch"
    "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_server/launch/rosbridge_tcp.launch"
    "/home/francesco/ros_ws_handshake/src/rosbridge_suite/rosbridge_server/launch/rosbridge_udp.launch"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

