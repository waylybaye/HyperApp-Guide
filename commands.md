# HyperApp commands


### What commands does HyperApp run on my Linux server?

```bash
# CPU
cat /proc/loadavg | awk '{print $1}'

# CPU count
getconf _NPROCESSORS_ONLN || grep -c ^processor /proc/cpuinfo'

# Memory
free | grep Mem | awk '{print $2,$3}'

# Disk
df -h | awk '$NF == "/" {print $2,$(NF-1),$NF}'

# Uptime
cat /proc/uptime

# Network
cat /sys/class/net/`route -n | awk '$1 == "0.0.0.0" {print $8}' | head`/statistics/tx_bytes

# Docker status
[sudo] docker ps -a

# Docker Stats
[sudo] docker stats --format '{{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.NetIO}}' --no-stream
```

