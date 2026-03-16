[![Home Assistant](https://img.shields.io/badge/Home%20Assistant-Apps-Blue?logo=homeassistant&logoColor=%23fff&color=%2303a9f4)](https://www.home-assistant.io/)
![GitHub Release](https://img.shields.io/github/v/release/Finsys/hawser?display_name=tag&label=Hawser%20Release)
![Supports aarch64 Architecture](https://img.shields.io/badge/aarch64-yes-green.svg)
![Supports amd64 Architecture](https://img.shields.io/badge/amd64-yes-green.svg)
![Supports armv7 Architecture](https://img.shields.io/badge/armv7-yes-green.svg)
![Supports armhf Architecture](https://img.shields.io/badge/armhf-no-red.svg)
![Supports i386 Architecture](https://img.shields.io/badge/i386-no-red.svg)

<p align="center">
  <img width="50%" src="https://github.com/Finsys/hawser/raw/main/logo/hawser.png">
</p>

[Hawser](https://github.com/Finsys/hawser) is a lightweight Go agent that enables [Dockhand](https://dockhand.pro/) to manage Docker hosts in various network configurations.

This Home Assistant App (Formerly Add-on) deploys Hawser to your Home Assistant OS or Supervised installations, allowing you to manage and monitor containers. 

> [!CAUTION]
> For Hawser to be able to monitor and manage your Home Assistant Supervisor containers, it needs access to the Docker socket of the host environment. This gives Hawser full access to start, stop or modify any container running on the host, including Home Assistant itself.  

## Installation
1. Please first follow the instructions to [install the repository into your Home Assistant App store](/README.md#installation)
2. Search for "Hawser" in the Home Assistant App store or alternatively click the below button:

    [![Open your Home Assistant instance and show the dashboard of an app.](https://my.home-assistant.io/badges/supervisor_addon.svg)](https://my.home-assistant.io/redirect/supervisor_addon/?addon=d1f42497_hawser&repository_url=https%3A%2F%2Fgithub.com%2FMattFryer%2FHassio-Addons)

3. Install the App 
4. Disable ```Protection mode``` for the App. This is required to allow Hawser to monitor and manage container. 

> [!NOTE]
> **DON'T** start the App before following the below configuration steps.

## Configuration

### Token
Before starting the App, you need to set a security token in App's the configuration. You should set it to a long random string. I'd recommend using a random key generator such as [this one](https://www.strongdm.com/tools/api-key-generator). Use at least a 256-bit long key for good security.

### Port (OPTIONAL)
You can optionally change the port Hawser will listen on. The default is ```2376```.


## Start the App
Now start the App and check the logs to see of Hawser has successfully started. You can now add your home assistant instance to Dockhand using the IP address of your Home Assistant instance and the port specified above.  