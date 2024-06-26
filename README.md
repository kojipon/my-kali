# Kali Linux Dockerfile for Hack The Box

This repository contains a Dockerfile that builds a custom Kali Linux Docker image specifically tailored for use with Hack The Box (HTB), an online platform for learning and practicing ethical hacking and penetration testing skills.

## Features

- Configured with a simple Xfce GUI desktop environment
- Accessible Kali Linux GUI desktop via VNC
- Various tools for learning cybersecurity are pre-installed
- Persistent storage directory provided for saving files and settings

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

    - Download the VNC client from the following link and install it on your local machine: https://www.realvnc.com

6. Connecting to the Kali Linux Desktop via VNC

    - Configure the following settings in the VNC client and connect to access the Kali Linux desktop environment:
      - VNC Server: localhost:5905
      - Name: my-kali
     
        
    ![VNC](/image/vnc.png) 

6. Connecting to Hack The Box VPN from Kali Linux

    - Download the OpenVPN configuration file (ovpn) from Hack The Box and place it at my-kali/htb.ovpn on your local machine. In the terminal of the Kali Linux desktop accessed via the VNC client, run the following command to establish a VPN connection from Kali Linux to Hack The Box:

        ```
        sudo openvpn ~/work/htb.ovpn
        ```

        ![VNC](/image/openvpn.png) 


9. Stopping the Running Docker Container

    - To stop the running Docker container, execute the following command:

        ```
        docker stop <Container ID>
        ```

## Disclaimer

This Docker image is intended for legal and ethical purposes only, specifically for learning and practicing on the Hack The Box platform. The authors and maintainers of this repository are not responsible for any misuse or illegal activities conducted with this Docker image.
