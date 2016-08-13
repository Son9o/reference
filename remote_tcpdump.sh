#!/bin/bash
display_usage() {  
	echo "60 Seconds capture script, saves to /data/hostname_port_date" 
	echo -e "\nUsage:\n$0 [mediaservername] [port] \n" 
	} 
if [  $# -le 1 ] 
	then 
		display_usage
		exit 1
	fi 
MEDIASERVERNAME=$1
PORT=$2
ssh ${MEDIASERVERNAME} "timeout 60 tcpdump -i eth0 'port ${PORT}' -w /data/`hostname`_port${PORT}_`date +%d-%m-%Y-%H-%M-%S`.pcap &"
