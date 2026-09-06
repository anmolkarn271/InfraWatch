# InfraWatch 🚀

**Linux Infrastructure Monitoring System**

InfraWatch is a Bash-based Linux infrastructure monitoring system designed to monitor important server resources, detect abnormal resource usage, and generate system health reports.

The project is being developed as a practical **DevOps engineering project** using Linux, Bash, Git, GitHub, and systemd.

---

## 📌 Features

* 🖥️ CPU usage monitoring
* 🧠 RAM usage monitoring
* 💾 Disk usage monitoring
* ⚙️ Top CPU-consuming processes
* 🌐 Network interface monitoring
* ⏱️ System uptime monitoring
* 📊 Automatic system health reports
* 📝 Infrastructure monitoring logs
* ⚠️ Configurable warning and critical thresholds
* 🚨 CPU, RAM, and disk alerts
* 🔧 systemd service integration
* 📁 Organized project structure

---

## 🏗️ Project Architecture

```text
                 InfraWatch
                     │
        ┌────────────┼────────────┐
        │            │            │
     Monitor       Config       Alerts
     Script       Thresholds     Script
        │            │            │
        └────────────┼────────────┘
                     │
              System Monitoring
                     │
       ┌─────────────┼─────────────┐
       │             │             │
      CPU           RAM           Disk
       │             │             │
       ├─────────────┼─────────────┤
       │             │             │
   Processes      Network        Uptime
                     │
                     ▼
             Health Classification
                     │
          ┌──────────┼──────────┐
          ▼          ▼          ▼
       HEALTHY    WARNING    CRITICAL
          │          │          │
          └──────────┼──────────┘
                     ▼
              Reports + Logs
```

---

## 📂 Project Structure

```text
InfraWatch/
│
├── config/
│   └── thresholds.conf
│
├── docs/
│   └── architecture.md
│
├── logs/
│   ├── cron.log
│   └── infrwatch.log
│
├── reports/
│   └── report-YYYY-MM-DD_HH-MM-SS.txt
│
├── scripts/
│   ├── alert.sh
│   └── monitor.sh
│
└── README.md
```

---

## ⚙️ Technologies Used

| Technology | Purpose                           |
| ---------- | --------------------------------- |
| Linux      | Operating system environment      |
| Bash       | Monitoring and automation scripts |
| systemd    | Service management                |
| Git        | Version control                   |
| GitHub     | Source code hosting               |

---

## 🔧 Configuration

Monitoring thresholds are stored in:

```text
config/thresholds.conf
```

Current configuration:

```bash
CPU_WARNING=70
CPU_CRITICAL=90

RAM_WARNING=70
RAM_CRITICAL=90

DISK_WARNING=80
DISK_CRITICAL=90
```

These values can be changed without modifying the monitoring script.

---

## ▶️ How to Run

Clone the repository:

```bash
git clone <YOUR_GITHUB_REPOSITORY_URL>
cd InfraWatch
```

Make the scripts executable:

```bash
chmod +x scripts/monitor.sh
chmod +x scripts/alert.sh
```

Run the monitoring script:

```bash
./scripts/monitor.sh
```

Run the alert check:

```bash
./scripts/alert.sh
```

---

## 📊 Generated Reports

Every monitoring execution generates a timestamped report inside:

```text
reports/
```

Example:

```text
report-2026-09-06_06-45-13.txt
```

A report contains information such as:

```text
Hostname
Timestamp
System Health Status
CPU Usage
RAM Usage
Disk Usage
Uptime
Top Processes
Network Interfaces
```

---

## 📝 Logging

InfraWatch maintains monitoring logs in:

```text
logs/infrwatch.log
```

Example:

```text
2026-09-06 06:45:13 | HOST=DESKTOP-RH01BHG | CPU=1% | RAM=19% | DISK=1% | STATUS=HEALTHY
```

---

## 🔧 systemd Integration

InfraWatch can be executed using a Linux systemd service.

Service:

```text
infrawatch.service
```

Start the service:

```bash
sudo systemctl start infrawatch
```

Check its status:

```bash
sudo systemctl status infrawatch
```

View service logs:

```bash
sudo journalctl -u infrawatch
```

The service uses `Type=oneshot`, so it becomes inactive after the monitoring script finishes successfully. This is expected behavior.

---

## 🧪 Health Classification

InfraWatch evaluates system resource usage using configurable thresholds.

```text
             Resource Usage
                    │
          ┌─────────┴─────────┐
          │                   │
       Normal              Threshold
          │                   │
       HEALTHY          ┌──────┴──────┐
                        │             │
                     WARNING       CRITICAL
```

### Example

```text
CPU < 70%       → HEALTHY
CPU 70–89%      → WARNING
CPU >= 90%      → CRITICAL
```

The same concept is applied to RAM and disk usage.

---

## 🎯 Project Goals

The current version focuses on Linux monitoring and automation.

Future development will extend InfraWatch into a complete DevOps monitoring platform.

### Planned Features

* [ ] Log rotation
* [ ] Automated Cron scheduling
* [ ] systemd timer
* [ ] Docker containerization
* [ ] GitHub Actions CI/CD
* [ ] AWS EC2 deployment
* [ ] Nginx integration
* [ ] Web monitoring dashboard
* [ ] Advanced alerting
* [ ] Production deployment documentation

---

## 🚀 DevOps Learning Objectives

This project is being used to gain practical experience with:

```text
Linux
  ↓
Bash Scripting
  ↓
Git & GitHub
  ↓
systemd
  ↓
Automation
  ↓
Docker
  ↓
CI/CD
  ↓
AWS
  ↓
Nginx
  ↓
Monitoring & Observability
```

---

## 👨‍💻 Author

**Anmol Karn**

B.Tech Computer Science & Engineering

---

## 📄 License

This project is created for educational and portfolio purposes.
