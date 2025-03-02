# System Health Report Script

## Overview
This Bash script generates a system health report, collecting essential system metrics such as uptime, CPU usage, memory usage, disk usage, and the status of the Docker service. The report is saved to a log file and displayed to the user.

## Features
- Retrieves system uptime.
- Monitors CPU and memory usage.
- Checks disk usage for the root directory (`/`).
- Verifies whether the Docker service is running.
- Logs all collected data into `system_report.log` and prints it to the terminal.

## How It Works
1. The script defines the log file location (`system_report.log`).
2. It uses built-in Linux commands to collect system information:
   - `uptime -p` for system uptime.
   - `top` and `awk` to extract CPU usage.
   - `free -m` to calculate memory usage percentage.
   - `df -h /` to get disk usage.
   - `systemctl is-active docker` to check the Docker service status.
3. The collected data is formatted and written to `system_report.log`.
4. Finally, the script prints the report to the terminal using `cat`.

## Usage
### Running the Script
1. Save the script as `system_report.sh`.
2. Grant execution permission:
   ```bash
   chmod +x system_report.sh
   ```
3. Run the script:
   ```bash
   ./system_report.sh
   ```

### Expected Output (Example)
```
System Health Report - Sun Mar 3 10:00:00 UTC 2025
-----------------------------------
Uptime: up 3 hours, 15 minutes
CPU Usage: 12.5%
Memory Usage: 65.32%
Disk Usage: 42%
Docker Service: active
-----------------------------------
```

## Prerequisites
- Linux environment
- `awk`, `free`, `df`, `top`, and `systemctl` commands available
- Docker installed (for the service check)

## Notes
- The script assumes the system uses `systemctl` to manage Docker. Modify it if your system uses a different service manager.
- Run the script as a user with appropriate permissions to access system metrics.

## License
This project is open-source and available for modification and distribution.

