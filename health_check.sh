#!/bin/bash
export HOME=/home/shwetha
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

CPU_THRESHOLD=60
MEM_THRESHOLD=60
DISK_THRESHOLD=60
EMAIL="shwethap2443@gmail.com"
LOG_FILE="/var/log/system_health.log"
DATE=$(/usr/bin/date '+%Y-%m-%d %H:%M:%S')

log_and_alert() {
    echo -e "From: shwethap2443@gmail.com
To: $EMAIL
Subject: System Health Alert

$DATE - $1" | /usr/bin/msmtp "$EMAIL"
    echo -e "$DATE - $1" >> $LOG_FILE
}

CPU_USAGE=$(/usr/bin/top -bn1 | /usr/bin/grep "Cpu(s)" | /usr/bin/awk '{print 100 - $8}' | /usr/bin/awk -F. '{print $1}')
if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
    log_and_alert "High CPU Usage: ${CPU_USAGE}%"
fi

MEM_USAGE=$(/usr/bin/free | /usr/bin/awk '/Mem/{printf "%.0f", $3/$2 * 100}')
if [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ]; then
    log_and_alert "High Memory Usage: ${MEM_USAGE}%"
fi

/usr/bin/df -H | /usr/bin/grep -vE '^Filesystem|tmpfs|cdrom' | while read usage partition rest; do
    usage=${usage%\%}
    if [ "$usage" -gt "$DISK_THRESHOLD" ]; then
        log_and_alert "High Disk Usage on $partition: ${usage}%"
    fi
done

echo -e "\n$DATE - Top 5 CPU consuming processes:" >> $LOG_FILE
/usr/bin/ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | /usr/bin/head -n 6 >> $LOG_FILE

echo -e "\n$DATE - Top 5 Memory consuming processes:" >> $LOG_FILE
/usr/bin/ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | /usr/bin/head -n 6 >> $LOG_FILE
