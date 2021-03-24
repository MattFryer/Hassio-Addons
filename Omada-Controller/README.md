# Home Assistant Add-on: Omada Controller Software

![Supports aarch64 Architecture][aarch64-shield]
[![Install on my Home Assistant][install-badge]][install-url]

TP-Link Omada Controller software allows centralised control of TP-Link EAPs. This Home Assistant add-on allows you to run Omada Controller on within HASSIO supervisor. For more information about the Omada Controller Software see the TP-Link website.

---

**NOTE:** This add-on currently only supports 64bit Raspberry Pi or other Arm64 based bords. If you would be interesting in running it on a different processor architecture, please raise an issue in the Github repository.

---

## Installation

1. Navigate in your Home Assistant frontend to **Supervisor** -> **Add-on Store** and add this URL as an additional repository: `https://github.com/MattFryer/Hassio-Addons`
2. Find the "Omada Controller" add-on (normally at the bottom of the page) and click the "INSTALL" button.
3. If the add-on has started OK click on "OPEN WEB UI" to get started with Omada Controller. If you Home Assistant is using an external domain name (eg. via DuckDNS) you may need to map port 8043 on your router to your Home Assistant device. Try visit https://homeassistant.local:8043/ in a browser instead.

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[install-url]: https://my.home-assistant.io/redirect/supervisor_addon?addon=d1f42497_omada_controller
[install-badge]: https://img.shields.io/badge/Install%20on%20my-Home%20Assistant-41BDF5?logo=home-assistant
