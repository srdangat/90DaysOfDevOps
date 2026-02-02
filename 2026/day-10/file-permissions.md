# Day 10 Challenge

## Task 1: Create Files 

![task_1](https://github.com/srdangat/90DaysOfDevOps/blob/master/2026/day-10/task1.png)


## Task 2: Read Files

![task_2.1](https://github.com/srdangat/90DaysOfDevOps/blob/master/2026/day-10/Screenshot%202026-02-02%20130141.png)

![task_2.2](https://github.com/srdangat/90DaysOfDevOps/blob/master/2026/day-10/task2.2.png)


## Task 3: Understand Permissions

All three files have the same permissions:
```bash
-rw-r--r--
```

```bash
- → regular file (not a directory)
Owner (sanket): rw- → read ✅ write ✅ execute ❌
Group (sanket): r-- → read ✅ write ❌ execute ❌
Others        : r-- → read ✅ write ❌ execute ❌
```

## Task 4: Modify Permissions

![task_4](https://github.com/srdangat/90DaysOfDevOps/blob/master/2026/day-10/task4.png)


## Task 5: Test Permissions

![task_5](https://github.com/srdangat/90DaysOfDevOps/blob/master/2026/day-10/task5.png)


---

### Files Created

![task_1](https://github.com/srdangat/90DaysOfDevOps/blob/master/2026/day-10/task1.png)



## Permission Changes

### Before
All three files have the same permissions:
```bash
-rw-r--r--
```
![before](https://github.com/srdangat/90DaysOfDevOps/blob/master/2026/day-10/permission_before.png)

```bash
- → regular file (not a directory)
Owner (sanket): rw- → read ✅ write ✅ execute ❌
Group (sanket): r-- → read ✅ write ❌ execute ❌
Others        : r-- → read ✅ write ❌ execute ❌
```

### After

![after](https://github.com/srdangat/90DaysOfDevOps/blob/master/2026/day-10/task4.png)

## Commands used

- Create: `touch`, `echo`, `vim file`
- Read: `cat`, `head -n`, `tail -n`, `vim -R file` 
- Permissions: `chmod +x`, `chmod 444`, `chmod 755`

## What I learned

1. **File Creation and Inspection:** I learned how to create and edit files using `touch`, `echo`, and `vim`.I also discovered how to open files safely in read-only mode using `vim -R` .Additionally, I used the `head` and `tail` commands to filter specific lines from system files (`like /etc/passwd`) to verify user accounts on the system.

2. **Managing Permissions with chmod:** I learned how to modify file and directory permissions using the chmod command. I practiced using both symbolic mode (e.g., chmod +x to make a script executable) and numeric mode (e.g., `chmod 755` for directories, chmod `444` for read-only files).

3. **Troubleshooting Access Control:** I observed how Linux permissions directly affect file operations. I saw "Permission denied" errors when trying to execute a script without the executable permission or write to a read-only file, and fixed them by adjusting permissions.
