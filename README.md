# my-kali
This repository contains a Dockerfile that builds a custom Kali Linux Docker image specifically tailored for use with Hack The Box (HTB), an online platform for learning and practicing ethical hacking and penetration testing skills.


# Kali Linux Dockerfile for Hack The Box

This repository contains a Dockerfile that builds a custom Kali Linux Docker image specifically tailored for use with Hack The Box (HTB), an online platform for learning and practicing ethical hacking and penetration testing skills.

## Features

- Xfce desktop environment pre-installed and configured as the default GUI
- Xfce4 Terminal set as the default terminal emulator with custom prompt settings
- VNC server (x11vnc) and web-based VNC client (noVNC) for remote desktop access
- Zsh shell with custom prompt settings
- Common Kali Linux tools and packages pre-installed, including:
  - kali-linux-core
  - kali-linux-default
  - kali-tools-top10
  - kali-tools-web
  - kali-tools-exploitation
- Non-interactive mode for apt-get to avoid prompts during the build process
- Persistent storage directory `/home/kali/work` for saving files and configurations

## Usage

1. Clone the repository:

```
git clone https://github.com/kojipon/my-kali.git
```

2. Build the Docker image:

```
cd my-kali
docker build -t my-kali .
```

3. Running the Container in the Background

```
docker run --cap-add=NET_ADMIN --device /dev/net/tun -d -p 5905:5900 -v ./:/home/kali/work my-kali
```

4. Installing a VNC Client for Desktop Access

Download and install a VNC client from the following link: https://www.realvnc.com

5. Connecting to the Kali Linux Desktop via VNC

Configure the following settings in the VNC client and connect to access the Kali Linux desktop environment:

VNC Server: localhost:5905
Name: my-kali

6. Connecting to Hack The Box VPN from Kali Linux

Download the OpenVPN configuration file (ovpn) from Hack The Box and place it at ~/work/htb.ovpn on your local machine. In the terminal of the Kali Linux desktop accessed via the VNC client, run the following command to establish a VPN connection from Kali Linux to Hack The Box:

```
sudo openvpn ~/work/htb.ovpn
```

9. Stopping the Running Docker Container

To stop the running Docker container, execute the following command:

```
docker stop <Container ID>
```

## Disclaimer

This Docker image is intended for legal and ethical purposes only, specifically for learning and practicing on the Hack The Box platform. The authors and maintainers of this repository are not responsible for any misuse or illegal activities conducted with this Docker image.
