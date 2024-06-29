# Nix OS minimal install
sudo su
nano /etc/wpa_supplicant.conf
network={
    ssid="ballnet"
    psk="cowpigdonkey1"
}
ifconfig
wpa_supplicant -B -i wlp0s20f3 -c /etc/wpa_supplicant.conf  



export http_proxy="http://192.168.220.231:8080"
export https_proxy="https://192.168.220.231:8080"
export ftp_proxy="http://192.168.220.231:8080"
