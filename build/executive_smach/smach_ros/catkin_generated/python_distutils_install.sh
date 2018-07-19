#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/francesco/ros_ws_handshake/src/executive_smach/smach_ros"

# snsure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/francesco/ros_ws_handshake/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/francesco/ros_ws_handshake/install/lib/python2.7/dist-packages:/home/francesco/ros_ws_handshake/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/francesco/ros_ws_handshake/build" \
    "/home/francesco/anaconda2/bin/python" \
    "/home/francesco/ros_ws_handshake/src/executive_smach/smach_ros/setup.py" \
    build --build-base "/home/francesco/ros_ws_handshake/build/executive_smach/smach_ros" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/francesco/ros_ws_handshake/install" --install-scripts="/home/francesco/ros_ws_handshake/install/bin"
