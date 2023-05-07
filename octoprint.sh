apt install python3 python3-pip python3-dev python3-setuptools python3-venv git libyaml-dev build-essential libffi-dev libssl-dev --no-install-recommends
pip3 install octoprint
octoprint serve

wget https://github.com/OctoPrint/OctoPrint/raw/master/scripts/octoprint.service && sudo mv octoprint.service /etc/systemd/system/octoprint.service
nano /etc/systemd/system/octoprint.service
# ExecStart=/home/pi/Octoprint/venv/bin/octoprint поменять на octoprint
systemctl start octoprint.service
systemctl enable octoprint.service
systemctl status octoprint.service
