#!/bin/bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Author: Greg Silverstein greg.silverstein@gmail.com
#
# This script is released under an mit license but basically use it
# any way you want. Give me credit if you want whatever but 
# it is provided with no guarantees use at your own risk
#
# please note this script asks for sudo and modifies your /etc/hosts
# and uses a file from the internet https://winhelp2002.mvps.org/hosts.txt      
# please view that site to ensure you trust it
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
echo "      _               "
echo "     | |              "
echo "  ___| |_ ___  _ __   "
echo " / __| __/ _ \| '_ \  "
echo " \__ \ || (_) | |_) | "
echo " |___/\__\___/| .__/  "
echo "              | |     "
echo "              |_|     "
echo "This script downloads a file from the web                 "
echo "https://winhelp2002.mvps.org/hosts.txt                    "
echo "I trust this file but review that site to be sure you are "
echo "Please note it also truncs your existing hosts file       "
echo "if you have anything in your hosts you care about it      "
echo "alter this script to account                              "
echo "ok with it [y/n to continue or exit]: "

read -n 1 -r in_prompt_one
echo ""

if [[ "$in_prompt_one" = y ]]
then
    curl https://winhelp2002.mvps.org/hosts.txt >> ~/hosts_temp.txt
    var=`date +"%FORMAT_STRING"`
    now=`date +"%m_%d_%Y"`
    now=`date +"%Y-%m-%d"`
    echo "now backing up your /etc/hosts file as of"
    echo "${now}"

    sudo cp /etc/hosts /etc/hosts_bu_${now}
    sudo -- sh -c "cat ~/hosts_temp.txt > /etc/hosts"
    rm ~/hosts_temp.txt
    dscacheutil -flushcache; exit

else
    #¯\_(ツ)_/¯ 
    echo "ok bye bye"
fi