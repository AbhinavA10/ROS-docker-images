FROM osrf/ros:humble-desktop-full

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

RUN apt-get update && apt-get upgrade -y 
RUN apt-get install git curl -y
RUN cd ~ && git clone https://github.com/AbhinavA10/.dotfiles.git && \
    cd .dotfiles/scripts && ./link_dotfiles.sh
RUN apt-get install fzf -y
RUN apt-get install mesa-utils
RUN apt-get install ros-humble-turtlebot3-* -y
RUN echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc
RUN echo "cd ~" >> /ros_entrypoint.sh
RUN cd ~ && mkdir catkin_ws && cd catkin_ws && mkdir src && cd src && \
    git clone -b humble-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git && \
    cd ~/catkin_ws && catkin_make
RUN curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh && \
    echo 'source ~/.git-prompt.sh' >> ~/.bashrc
