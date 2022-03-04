ARG ROS_DISTRO
FROM ros:${ROS_DISTRO}

RUN apt-get update &&\
    if test $ROS_DISTRO = 'noetic'; then \
        apt-get install --no-install-recommends \
            python3-pip \
            python3-colcon-common-extensions \
            python3-rospkg \
            -y; \
    else \
        apt-get install --no-install-recommends \
            python-pip \
            install python-colcon-common-extensions \
            python-rospkg \
            -y; \
    fi && \
    apt-get install --no-install-recommends \
      ros-${ROS_DISTRO}-gazebo-ros-pkgs \
      ros-${ROS_DISTRO}-gazebo-ros-control \
      -y && \
    rm -rf /var/lib/apt/lists/*