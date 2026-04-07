# Linux-Health-Project
A Bash script to monitor Linux server health, track CPU, memory, and disk usage, and send email alerts when thresholds are exceeded. Logs system health and resource usage for easy monitoring.
# Features
Monitors CPU, Memory, and Disk usage

Logs system health to /var/log/system_health.log

Sends email alerts when usage exceeds thresholds (default: 60%)

Tracks Top 5 CPU and Memory consuming processes

Fully automatable with cron jobs.

# Technologies Used
Bash scripting

Linux commands: top, free, df, ps

Email alerts using msmtp

Logging to /var/log/system_health.log

Cron jobs for automation
