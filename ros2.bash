#!/usr/bin/env bash

#=============CONF===================
export ROS2_DISTRO_PATH="/opt/ros/jazzy"
#=============CONF===================

alias get_ros='source $ROS2_DISTRO_PATH/setup.bash'
alias get_ros_ws='source install/setup.bash'
alias set_can0='sudo ip link set can0 down && sudo ip link set can0 type can bitrate 1000000 && sudo ip link set can0 txqueuelen 1000 && sudo ip link set can0 up'
alias set_can1='sudo ip link set can1 down && sudo ip link set can1 type can bitrate 1000000 && sudo ip link set can1 txqueuelen 1000 && sudo ip link set can1 up'