#!/bin/bash

mail_list=/root/mail_list.txt
host_list=/root/hostlist.txt

for host in $(cat $host_list)
do 
ping -c4 $host > /dev/null 2>&1
if [ $? == 0 ]
then
echo "$host is up" 
else
echo "$host is down" | mail -s "************$host down alert************" $(cat $mail_list)
fi
done
