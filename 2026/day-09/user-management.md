# Day 09 Challenge

### Task 1: Create Users

Create three users with home directories and passwords:
- `tokyo`
- `berlin`
- `professor`

**Verify:** Check `/etc/passwd` and `/home/` directory

![task1](https://github.com/srdangat/90DaysOfDevOps/blob/master/2026/day-09/task1.png)

---

### Task 2: Create Groups

Create two groups:
- `developers`
- `admins`

**Verify:** Check `/etc/group`

![task2](https://github.com/srdangat/90DaysOfDevOps/blob/master/2026/day-09/task2.png)

---

### Task 3: Assign to Groups

Assign users:
- `tokyo` → `developers`
- `berlin` → `developers` + `admins` (both groups)
- `professor` → `admins`

**Verify:** Use appropriate command to check group membership

![task3](https://github.com/srdangat/90DaysOfDevOps/blob/master/2026/day-09/task3.png)

---

### Task 4: Shared Directory 

1. Create directory: `/opt/dev-project`
2. Set group owner to `developers`
3. Set permissions to `775` (rwxrwxr-x)
4. Test by creating files as `tokyo` and `berlin`

**Verify:** Check permissions and test file creation

![task4](https://github.com/srdangat/90DaysOfDevOps/blob/master/2026/day-09/task4.png)

---

### Task 5: Team Workspace

1. Create user `nairobi` with home directory
2. Create group `project-team`
3. Add `nairobi` and `tokyo` to `project-team`
4. Create `/opt/team-workspace` directory
5. Set group to `project-team`, permissions to `775`
6. Test by creating file as `nairobi`

![task5](https://github.com/srdangat/90DaysOfDevOps/blob/master/2026/day-09/task5.png)

---


### Users & Groups Created
- Users: tokyo, berlin, professor, nairobi
- Groups: developers, admins, project-team

### Group Assignments
```
tokyo: developers,project-team
berlin: developers,admins
professor: admins
nairobi: project-team
```
### Directories Created
```
/opt/dev-project
Permissions: 775 (drwxrwxr-x)


/opt/team-workspace
Permissions: 775 (drwxrwxr-x)

```

### Commands Used

###  Create three users with password
```bash
sudo useradd -m tokyo
sudo useradd -m berlin
sudo useradd -m professor
sudo passwd tokyo
sudo passwd berlin
sudo passwd professor
sudo passwd nairobi
```

### Group Creation
```bash
sudo groupadd developers
sudo groupadd admins
sudo groupadd project-team
```

### Assign Users to Groups
```bash
sudo usermod -aG developers tokyo
sudo usermod -aG developers,admins berlin
sudo usermod -aG admins professor
sudo usermod -aG project-team nairobi
sudo usermod -aG project-team tokyo
```

### Directory Configuration & Permissions
```bash
sudo mkdir /opt/dev-project
sudo chgrp developers /opt/dev-project
sudo chmod 775 /opt/dev-project
sudo mkdir /opt/team-workspace
sudo chgrp project-team /opt/team-workspace
sudo chmod 775 /opt/team-workspace
```

### Verification
```bash
# Verifying User Creation
grep -e tokyo -e berlin -e professor /etc/passwd

# Verifying Group Assignments
groups tokyo
groups berlin
groups professor
groups nairobi

# Testing Write Access (Development Project)
su tokyo
touch /opt/dev-project/tokyo.txt

su berlin
touch /opt/dev-project/berlin.txt


# Testing Write Access (Team Workspace)
su nairobi
touch /opt/team-workspace/nairobi.txt
```

##  What I Learned

1.  **Managing User Privileges via Groups:** Learned how to efficiently manage access control by assigning users to secondary groups (like `developers` or `admins`) using `usermod -aG`, rather than managing permissions for every single user individually.

2.  **Shared Workspace Permissions (775):** Understood the significance of the `775` permission code. It allows the **Owner** and **Group** full control (Read, Write, Execute) to collaborate, while restricting **Others** to Read/Execute only,ensuring security.

3.  **Changing Group Ownership:** Learned to use `chgrp` to change a directory's group ownership. This is essential for collaborative folders so that all members of a specific team (e.g., `project-team`) share ownership of the space.

4.  **Verification Workflow:** Established a habit of verifying every administrative change. Using commands like `ls -ld` to check permissions and `groups` to confirm user membership ensures that access rights are set up correctly before users start working.
