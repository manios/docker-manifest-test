#!/bin/sh

# trap ctrl-c and call ctrl_c()
# https://rimuhosting.com/knowledgebase/linux/misc/trapping-ctrl-c-in-bash
# http://www.computerhope.com/unix/utrap.htm
trap ctrl_c SIGINT

function ctrl_c() {
    echo "** Trapped CTRL-C"
    stopByUser
}

function stopByUser {

    mydatewithtz=`date +"%Y-%m-%dT%H:%M:%S%:z"`
    echo "$mydatewithtz Gracefull stop in progress"
    exit 0
}

ssh-agent bash

maxSeconds=86400
allday=$(seq 1 "$maxSeconds")

for i in $allday;
do
    echo "$i: Uptime $(uptime)"
    sleep 1
done;

echo "Stop automatically after ${maxSeconds} seconds."
exit 0

