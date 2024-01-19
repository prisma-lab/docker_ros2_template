FROM osrf/ros:humble-desktop

#Instal essential
RUN apt-get update && apt-get install -y

##Add additional apt-get here


#Environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:0
ENV HOME /home/user
ENV ROS_DISTRO=humble

#Add non root user using UID and GID passed as argument
ARG USER_ID
ARG GROUP_ID
RUN addgroup --gid $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user
RUN echo "user:user" | chpasswd
RUN echo "user ALL=(ALL:ALL) ALL" >> /etc/sudoers
USER user

#ROS2 workspace creation and compilation
RUN mkdir -p ${HOME}/ros2_ws/src
WORKDIR ${HOME}/ros2_ws
COPY --chown=user ./src ${HOME}/ros2_ws/src
SHELL ["/bin/bash", "-c"] 
RUN source /opt/ros/${ROS_DISTRO}/setup.bash; rosdep install -i --from-path src --rosdistro humble -y; colcon build --symlink-install

#Add script source to .bashrc
RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash;" >>  ${HOME}/.bashrc
RUN echo "source ${HOME}/ros2_ws/install/local_setup.bash;" >>  ${HOME}/.bashrc

#Clean image
USER root
RUN rm -rf /var/lib/apt/lists/*
USER user






