# TP-Link Omada Controller
TP-Link Omada Controller software allows centralised control of TP-Link EAPs. This Home Assistant add-on allows you to run Omada Controller on within HASSIO supervisor. For more information about the Omada Controller Software see the TP-Link website.

---

**NOTE:** This add-on currently only supports 64bit Raspberry Pi or other Arm64 based bords. If you would be interesting in running it on a different processor architecture, please raise an issue.

---

## Installation
Install Omada Controller in Home Assistant as follows:
1. Add this repository to the Home Assistant add-on store https://github.com/MattFryer/Hassio-Addons
2. Install the add-on and once complete start it.
3. Check the add-on log for any errors.
4. If the add-on has started OK click on "OPEN WEB UI" to get started with Omada Controller. If you Home Assistant is using an external domain name (eg. via DuckDNS) you may need to map port 8043 on your router to your Home Assistant device. Try visit https://homeassistant.local:8043/ in a browser instead.
