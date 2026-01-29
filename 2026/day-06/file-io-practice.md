# Day 6 – Linux File Handling Basics (DevOps)
 
## 1. Create a File

```bash
touch day6.txt
```

**Explanation:**  
Creates an empty file named `day6.txt`.

---

## 2. Write to a File (Overwrite)

```bash
echo "Today is Day 6/90 of my DevOps journey" > day6.txt
```

**Explanation:**  
- `>` writes content to the file  
- If the file already exists, it **overwrites** the content

---

## 3. Append to a File

```bash
echo "Linux file handling practice" >> day6.txt
```

**Explanation:**  
- `>>` appends content to the file  
- Existing content is preserved

---

## 4. Write and Display Output Using tee

```bash
echo "Redirection is powerful" | tee -a day6.txt
```

**Explanation:**  
- `tee` displays output on the terminal  
- `-a` appends the output to the file

---

## 5. View File Content

```bash
cat day6.txt
```

**Explanation:**  
Displays the full content of the file.

---

## 6. Add Multiple Lines Using EOF

```bash
cat <<EOF >> day6.txt
cat reads full file
head reads top lines
tail reads bottom lines
These skills help in DevOps
EOF
```

**Explanation:**  
- `EOF` is a multi-line input method  
- Appends multiple lines at once

---

## 7. View Top Lines (head)

```bash
head day6.txt
```

```bash
head -n 2 day6.txt
```

**Explanation:**  
- Shows the first 10 lines by default  
- `-n` specifies number of lines

---

## 8. View Bottom Lines (tail)

```bash
tail -n 3 day6.txt
```

**Explanation:**  
Displays the last 3 lines of the file.

---

## 9. Search Text Using grep

```bash
cat day6.txt | grep head
```

**Explanation:**  
Filters and shows lines containing the word **head**.


Output:
![file](https://github.com/srdangat/90DaysOfDevOps/blob/master/2026/day-06/day6.png)
