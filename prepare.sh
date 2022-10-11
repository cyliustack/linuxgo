#!/bin/bash


function main () {
	SUDO=""
	if [[ "$(command -v sudo)" != "" ]] && [[ "$(whoami)" != "root"  ]];then
		SUDO="sudo"
	fi

	if [[ "$(command -v apt-get)" != "" ]];then
		$SUDO apt-get update -y 
		$SUDO apt-get update --fix-missing 
		$SUDO apt install -y curl
	elif [[ "$(command -v zypper)" != "" ]];then
		$SUDO zypper install -y curl
	elif [[ "$(command -v dnf)" != "" ]];then
		$SUDO dnf install -y curl
	else
		echo "Your OS is not supported."
		exit -1
	fi
	curl -LO https://go.dev/dl/go1.19.2.linux-amd64.tar.gz 	
	$SUDO rm -rf /usr/local/go && $SUDO tar -C /usr/local -xzf go1.19.2.linux-amd64.tar.gz

}

main $@
