# Task – Cloud Server Setup: Docker, Nginx & Web Deployment

## Part 1: Launch EC2 Instance & SSH Access

### Step 1: Create a EC2 Instance
- Launched an Ubuntu Linux instance on a AWS cloud provider (AWS EC2)
- Configured key pair for secure access
- Set security group rules for SSH (port 22)

### Step 2: Connect via SSH
- Connected to the EC2 instance using SSH from local terminal

```bash
ssh -i your-key.pem ubuntu@<your-instance-ip>
```

![ssh_connection](https://github.com/srdangat/90DaysOfDevOps/blob/master/2026/day-08/ssh-connection.png)

---

## Part 2: Install Docker & Nginx

### Step 1: Update System
Updated system packages to the latest versions.

```bash
sudo apt update && sudo apt upgrade -y
```

### Step 2: Install Docker
Installed Docker

```bash
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
```

### Step 3: Install Nginx
Installed and started the Nginx web server.

```bash
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
```

---

## Part 3: Security Group Configuration

### Test Web Access
- Allowed inbound HTTP traffic on port **80** in the EC2 security group
- Opened browser and visited:

```text
http://<your-instance-ip>
```

✅ Verified that the **Nginx welcome page** loads successfully

![nginx_welcome](https://github.com/srdangat/90DaysOfDevOps/blob/master/2026/day-08/nginx-welcome.png)


---

## Part 4: Extract Nginx Logs

### Step 1: View Nginx Logs

```bash
sudo cat /var/log/nginx/access.log
```

### Step 2: Save Logs to File

```bash
sudo cat /var/log/nginx/access.log > nginx-logs.txt
```

### Step 3: Download Log File to Your Local Machine

```bash
# On your local machine
scp -i your-key.pem ubuntu@<your-instance-ip>:~/nginx-logs.txt .
```

![log_capture](https://github.com/srdangat/90DaysOfDevOps/blob/master/2026/day-08/logs_capture.png)

---


## What I Learned

- Launched an **AWS EC2** instance and configured **SSH access using secure key-based authentication**
- Configured **EC2 security groups** to allow **SSH (port 22) and HTTP (port 80)** access
- Installed Docker and Nginx using linux service commands
- Verified live web deployment using the EC2 public IP address
- Saved Nginx logs on EC2 and downloaded them to the local machine
