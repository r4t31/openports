#!/bin/bash

if [[ $# -eq 0 ]]; then
    echo -e "No parameters found. "
    exit 1
fi
if [[ "${1:-unset}" == "unset" ]]; then
    echo -e "No parameters found. "
    exit 1
fi

if [[ $# -eq 1 ]]; then
    # dfw_list=("disable_fw" "-disable_fw" "disable" "-disable" "-dfw")
    # if [[ $dfw_list[@] =~ $1 ]]; then
    if [[ $1 = "-dfw" ]]; then
        echo disable firewall
        ufw disable
        exit 0
    else
        echo try to open port $1
        iptables -I INPUT -p tcp -m tcp --dport $1 -j ACCEPT
        exit 0
    fi
fi

if [[ $# -eq 2 ]]; then
    # close_list=("close" "-close" "-c")
    # if [[ $close_list[@] =~ $1 ]]; then
    if [[ $1 = "-c" ]]; then
        echo try to close port $2
        iptables -I INPUT -p tcp -m tcp --dport $2 -j REJECT
        exit 0
    fi
fi
