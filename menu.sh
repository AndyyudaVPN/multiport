#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="kenDevXD"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
clear
#warna
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"
# // CPU INFO
export cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
export cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
export cpu_usage+=" %"

# // OS UPTIME
export uptime="$(uptime -p | cut -d " " -f 2-10)"

# // KERNEL
export kernelku=$(uname -r)

# // DATE
export harini=`date -d "0 days" +"%d-%m-%Y"`
export jam=`date -d "0 days" +"%X"`
#Domain
domain=$(cat /usr/local/etc/xray/domain)
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10)
CITY=$(curl -s ipinfo.io/city)
WKT=$(curl -s ipinfo.io/timezone)
IPVPS=$(curl -s ipinfo.io/ip)
cname=$(awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo)
cores=$(awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo)
freq=$(awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo)
tram=$(free -m | awk 'NR==2 {print $2}')
uram=$(free -m | awk 'NR==2 {print $3}')
fram=$(free -m | awk 'NR==2 {print $4}')
clear
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# USERNAME
rm -f /usr/bin/user
username=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
# Order ID
rm -f /usr/bin/ver
user=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | grep $MYIP | awk '{print $3}')
echo "$user" >/usr/bin/ver
# validity
rm -f /usr/bin/e
valid=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | grep $MYIP | awk '{print $4}')
echo "$valid" >/usr/bin/e
# DETAIL ORDER
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
clear
version=$(cat /home/ver)
ver=$( curl https://raw.githubusercontent.com/${GitUser}/version/main/version.conf )
clear
# CEK UPDATE
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info1="${Green_font_prefix}$version${Font_color_suffix}"
Info2="${Green_font_prefix} Latest Version ${Font_color_suffix}"
Error=" Version ${Green_font_prefix}[$ver]${Font_color_suffix} Available${Red_font_prefix}[Update]${Font_color_suffix}"
version=$(cat /home/ver)
new_version=$( curl https://raw.githubusercontent.com/${GitUser}/version/main/version.conf | grep $version )
#Status Version
if [ $version = $new_version ]; then
stl="${Info2}"
else
stl="${Error}"
fi
clear
# Getting CPU Information
vnstat_profile=$(vnstat | sed -n '3p' | awk '{print $1}' | grep -o '[^:]*')
vnstat -i ${vnstat_profile} >/root/t1
bulan=$(date +%b)
ttoday="$(vnstat | grep today | awk '{print $8" "substr ($9, 1, 3)}' | head -1)"
tmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $8" "substr ($9, 1 ,3)}' | head -1)"

# STATUS EXPIRED ACTIVE
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[4$below" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}(Registered)${Font_color_suffix}"
Error="${Green_font_prefix}${Font_color_suffix}${Red_font_prefix}[EXPIRED]${Font_color_suffix}"

today=$(date -d "0 days" +"%Y-%m-%d")
Exp1=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | grep $MYIP | awk '{print $4}')
if [[ $today < $Exp1 ]]; then
    sts="${Info}"
else
    sts="${Error}"
fi
echo -e "\e[32mloading...\e[0m"
clear
# CERTIFICATE STATUS
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
# TOTAL ACC CREATE VMESS WS
vmess=$(grep -c -E "^#vms " "/usr/local/etc/xray/vmess.json")
# TOTAL ACC CREATE  VLESS WS
vless=$(grep -c -E "^#vls " "/usr/local/etc/xray/vless.json")
# TOTAL ACC CREATE  VLESS TCP XTLS
xtls=$(grep -c -E "^#vxtls " "/usr/local/etc/xray/config.json")
# TOTAL ACC CREATE  TROJAN
trtls=$(grep -c -E "^#trx " "/usr/local/etc/xray/tcp.json")
# TOTAL ACC CREATE  TROJAN WS TLS
trws=$(grep -c -E "^#trws " "/usr/local/etc/xray/trojan.json")
# TOTAL ACC CREATE OVPN SSH
total_ssh="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
# PROVIDED
creditt=$(cat /root/provided)
# BANNER COLOUR
banner_colour=$(cat /etc/banner)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR ON TOP
text=$(cat /etc/text)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)
# BANNER
banner=$(cat /usr/bin/bannerku)
ascii=$(cat /usr/bin/test)
clear
echo "--------------- Welcome Premium Script -------------------"
echo "--------------- Kenn Hiroyuki x Alexxa -------------------"
echo -e "\e[032;1mDate        : $harini"
echo -e "\e[032;1mTime        : $jam"
echo -e "----------------------------------------------------------"
echo -e "\e[032;1mIsp Name:\e[0m $ISP"
echo -e "\e[032;1mTotal CPU:\e[0m $cores Core"
echo -e "\e[032;1mPenggunaan CPU:\e[0m $cpu_usage"
echo -e "\e[032;1mTotal Amount Of RAM:\e[0m $tram MB"
echo -e "----------------------------------------------------------"
echo -e "PENGGUNAAN BANDWIDTH"
echo -e "${BIBlue}Today   : $ttoday"
echo -e "\e[033;1mDomain :\e[0m $domain"
echo -e "\e[033;1mSystemUptime:\e[0m $uptime"
echo -e "----------------------------------------------------------"
echo -e "Menu Utama" | lolcat -a -d 10
echo -e "\e[$number (•1)\e[m \e[$below Control Panel Xray\e[m"
echo -e "\e[$number (•2)\e[m \e[$below Control Panel Trojan\e[m"
echo -e "\e[$number (•3)\e[m \e[$below Control Panel SSH && OVPN\e[m" 
echo -e "\e[$number (•4)\e[m \e[$below Menu System\e[m"
echo -e "\e[$number (•5)\e[m \e[$below Check Running\e[m"
echo -e "\e[32mWebsite aixxyssh.com\e[m"
echo -e "\e[32mContact t.me/aixxy7\e[m"
echo -e "\e[$below "
read -p " Pilih Menu :  " menu
echo -e ""
case $menu in
1)
    xraay
    ;;
2)
    trojaan 
    ;;
3)
    ssh
    ;;
4)
    system
    ;;
5)
    check-sc
    ;;
x)
    clear
    exit
    echo -e "\e[1;31mPlease Type menu For More Option, Thank You\e[0m"
    ;;
*)
    clear
    echo -e "\e[1;31mPlease enter an correct number\e[0m"
    sleep 1
    menu
    ;;
esac