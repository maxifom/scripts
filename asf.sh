apt install ca-certificates libc6 libgcc1 libicu67 libgssapi-krb5-2 libssl1.1 libstdc++6 zlib1g
useradd -m asf
ln -s /home/asf/ArchiSteamFarm/ArchiSteamFarm\@.service /etc/systemd/system
systemctl start ArchiSteamFarm@asf
systemctl enable ArchiSteamFarm@asf
systemctl status ArchiSteamFarm@asf
