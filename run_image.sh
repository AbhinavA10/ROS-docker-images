#!/bin/bash

# If not working, first do: sudo rm -rf /tmp/.docker.xauth

# http://wiki.ros.org/docker/Tutorials/Hardware%20Acceleration#nvidia-docker2
# https://answers.ros.org/question/300113/docker-how-to-use-rviz-and-gazebo-from-a-container/

xhost +si:localuser:root  # allow containers to communicate with X server

XAUTH=/tmp/.docker.xauth
xauth_list=$(xauth nlist :0 | tail -n 1 | sed -e 's/^..../ffff/')
if [ ! -f $XAUTH ]; then
    if [ ! -z "$xauth_list" ]; then
        echo $xauth_list | xauth -f $XAUTH nmerge -
    else
        touch $XAUTH
    fi
    chmod a+r $XAUTH
fi

docker run -it \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --env="TERM=xterm-256color" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="$XAUTH:$XAUTH" \
    --net=host \
    --privileged \
    --runtime=nvidia \
    noetic-gpu\
    bash
