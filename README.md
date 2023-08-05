# ROS-docker

Building Docker container for ROS distributions with support for NVIDIA driver, and being able to run Gazebo simulations

## Installing Nvidia Docker support
See [AbhinavA10/.dotfiles](https://github.com/AbhinavA10/.dotfiles)

## Building Docker image
Based on http://wiki.ros.org/docker/Tutorials/Hardware%20Acceleration#nvidia-docker2

```bash
./build_images.sh
./run_image.sh
```

## Pushing Docker image to Docker Hub

```bash
cd <ros-distro>
docker build -t name:tag .
docker commit <container_id> name:tag
docker image tag name:tag 
docker push name:tag
```

## Debugging GPU support inside docker container

`glxinfo | grep "OpenGL vendor string: NVIDIA Corporation" # Check that OpenGL is set to use NVidia`

## Useful ROS tools
On host machine, `sudo snap install foxglove-studio`

