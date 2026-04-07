# Linux-Health-Project
A Bash script to monitor Linux server health, track resource usage, and send alerts if thresholds are exceeded. Ideal for system administrators and DevOps engineers who want a lightweight automated monitoring solution.
# Features
CPU Usage Monitoring: Detects high CPU utilization.
Memory Usage Monitoring: Tracks RAM consumption.
Disk Usage Monitoring: Monitors disk space on all partitions.
Top Processes Report: Identifies resource-intensive processes.
Logging: Stores system health data in /var/log/system_health.log.
Email Alerts: Sends email notifications when usage exceeds thresholds.
Automated Scheduling: Can be run periodically using cron.
# Technologies Used
Bash scripting
Linux commands: top, df, free, uptime, ps
Email alerts via mail or sendmail
cron jobs for automation
