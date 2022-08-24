#!/bin/sh
grep compute /etc/hosts |grep -v rdma | awk '{print $2}' > ./pssh_hosts
HOSTS=./pssh_hosts

pssh -h ${HOSTS} -i "sudo systemctl stop oracle-cloud-agent-updater.service"
pssh -h ${HOSTS} -i "sudo systemctl disable oracle-cloud-agent-updater.service"

pssh -h ${HOSTS} -i "sudo systemctl stop oracle-cloud-agent.service"
pssh -h ${HOSTS} -i "sudo systemctl disable oracle-cloud-agent.service"

pssh -h ${HOSTS} -i "sudo systemctl stop oswatcher.service"
pssh -h ${HOSTS} -i "sudo systemctl disable oswatcher.service"

pssh -h ${HOSTS} -i "sudo systemctl stop unified-monitoring-agent.service"
pssh -h ${HOSTS} -i "sudo systemctl disable unified-monitoring-agent.service"
