FROM kalilinux/kali-rolling

# Set the DEBIAN_FRONTEND environment variable to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Update and upgrade packages
RUN apt-get update && apt full-upgrade -y

# Install various tools
RUN apt-get install -y kali-linux-core kali-linux-default kali-tools-top10 kali-tools-web kali-tools-exploitation

# Install VNC server
RUN apt install -y kali-desktop-xfce x11vnc xvfb novnc dbus-x11

# Create the TUN/TAP device node
RUN mkdir -p /dev/net && \
    mknod /dev/net/tun c 10 200

# Add a new user without password
RUN adduser --disabled-password --gecos '' kali

# Allow kali user to run sudo without password
RUN echo 'kali ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Set the default user to kali
USER kali
WORKDIR /home/kali

# Set the DISPLAY environment variable
ENV DISPLAY=:1

# Create the work directory
RUN mkdir /home/kali/work

# Set the volume
VOLUME /home/kali/work

# Start the X server and VNC server
CMD Xvfb :1 -screen 0 1920x1080x24 & \
    startxfce4 & \
    x11vnc -display :1 -xkb -forever -shared -repeat -listen 0.0.0.0 -nopw -reopen

# Expose the port
EXPOSE 5900
