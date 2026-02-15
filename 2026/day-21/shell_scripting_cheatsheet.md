# Task 1: Basics

## 1.Shebang(#!/bin/bash)
-  **What it does**: The shebang tells the system which shell to use to execute the script.
- **Why it matters**: Without it,the script will run with the default shell and might not work correctly
- **Example**:
    ```bash
    #!/bin/bash
    echo "Hello, world!"
    ```

## 2.Running a script:
- `chmod +x script.sh`: Make the script executable.
- `./script.sh`: Run the script. The system uses the shebang (`#!/bin/bash`) to choose the shell. If there is no shebang, it uses the current shell.
- `bash script.sh`: Run the script directly with Bash, ignoring the shebang.


## 3.Comments: 
- Comments are notes that you add to explain what your code does.The script ignores comments,but they are essential for making scripts easier to read and  maintain for yourself and others.

- **Single-line comments start with #. Inline comments come after a command.**
- **Exmaple**:
    ```bash
    # This is a single-line comment
    echo "Hello"  # This prints Hello(Inline comment)
    ```

## 4.Variables:
- **Declaring**: Store a value in a name (no spaces around =)
- **Example**: 
    ```bash
        NAME="Sanket"
    ```
- **Using**: Add `$` before the variable name to get its value.
- **Example**:
    ```bash
    echo $NAME # Prints Sanket
    ```
- **Quoting**:
 - **Double quotes " "**: Variable is replaced with its value.
    ```bash
    echo "Hello $NAME"   # Prints Hello Sanket
    ```
 - **Single quotes ' '** : Variable is not replaced.
    ```bash
    echo 'Hello $NAME'   # Prints Hello $NAME literally
    ```

## 5.Reading user input:
- The read command reads user input from standard input and stores it in a variable.
- **Example**:
    ```bash
    echo "Enter your name:"
    read NAME
    echo "Hello, $NAME!"
    ```

## 6.Command-line arguments:

- $0: Script name	
- $1: First argument	
- $#: Number of arguments	
-  $@: All arguments	
- $?: Last command status

 ```bash
    #!/bin/bash
    # Show script name and arguments
    echo "Script name: $0"
    echo "First argument: $1"
    echo "Total arguments: $#"
    echo "All arguments: $@"

    ls /sanket                              # This directory does not exist
    echo "Exit status of last command: $?"  # Non-zero means(2) command failed

    ls /tmp                                 # This directory exists
    echo "Exit status of last command: $?"  # 0 means command succeeded

    ./script.sh                             # $0 = script.sh, no arguments
    ./script.sh Sanket                      # $1 = Sanket, $# = 1, $@ = Sanket
    ./script.sh a b c                       # $1 = a, $# = 3, $@ = a b c
```

 # Task 2: Operators and Conditionals

## 1.String Comparisons:
-  **= (Equal)**           : Checks if two strings are exactly the same.
-  **!= (Not equal)**      : Checks if two strings are different.
-  **-z (Zero Length)**    : Checks if a string is empty (its length is zero).
- **-n (Not Zero Length)** : Checks if a string is not empty (contains characters).
    ```bash
    name="Linux"
    [ "$name" = "Linux" ]

    name="Linux"
    [ "$name" != "Ubuntu" ]

    empty=""
    [ "$name" -z "$empty" ]

    name="Linux"
    [ "$name" -n "$name" ]
    ```
## 2.Integer comparisons  
- **-eq (Equal)**            : Checks if two numbers are equal.
- **ne (Not equal)**         : Checks if two numbers are not equal.
- **-lt (Less than)**        : Checks if the first number is less than the second.
- **-gt (Greater than)**     : Checks if the first number is greater than the second.
- **-le (Less or equal)**    :  Checks if the first number is less than or equal to the second.
- **-ge (Greater or equal)** : Checks if the first number is greater than or equal to the second.

    ```bash
    a=10
    b=10
    [ $a -eq $b ]

    a=10
    b=20
    [ $a -ne $b ]

    a=5
    b=10
    [ $a -lt $b ]

    a=15
    b=10
    [ $a -gt $b ]

    a=10
    b=10
    [ $a -le $b ]

    a=20
    b=10
    [ $a -ge $b ]

    ```


## 3.File test operators 
- **-f** : Checks if a regular file exists.
- **-d** : Checks if a path exists and is a directory.
- **-e** : Checks if the file or directory exists.
- **-r** : Checks if the file has read permission.
- **-w** : Checks if the file has write permission.
- **-x** : Checks if the file has execute permission
- **-s** : Check if a file is not empty

    ```bash
    file="test.txt"
    dir="myfolder"

    [ -f "$file" ]
    [ -d "$dir"  ]
    [ -e "$file" ]
    [ -r "$file" ]
    [ -w "$file" ]
    [ -x "$file" ]
    [ -s "$file" ]
    ```

## 4.if, elif, else:
- **if**: Checks the first condition;if true,runs the code.
- **elif**: Checks another condition only if the previous ones were false.
- **else**: Runs a default block of code if none of the conditions were true

- **Syntax**:
    ```bash
    if [ condition ]; then
        commands
    elif [ condition ]; then
        commands
    else
        commands
    fi
    ```
- **Example**:

    ```bash
    FILE="config.txt"

    if [ -d "$FILE" ]; then
        echo "It's a directory."
    elif [ -f "$FILE" ]; then
        echo "It's a regular file."
    else
        echo "Path does not exist."
    fi
    ```
## 5.Logical operators

- **&&** : Runs the next command only if the first command is true.
- **||** : Runs the next command only if the first command is false.
- **!**  : If the condition is true, it becomes false.If false,it becomes true.

- **Syntax**:
    ```bash
    command1 && command2
    command1 || command2
        ! command
    ```
    ```bash
    [ condition1 ] && [ condition2 ]
    [ condition1 ] || [ condition2 ]
        ! [ condition ]
    ```
- **Example**:
    ```bash
        mkdir test && cd test
        cd myfolder || pwd
        ! ls notfound.txt
    ```
    ```bash
        [ -f "test.txt" ] && [ -r "test.txt" ]
        [ -f "test.txt" ] || [ -d "backup" ]
            ! [ -f "test.txt" ]
    ```

## 6.Case statements: 
- A case statement is a way to handle multiple conditions instead of using many if/elif blocks.

- **Syntax**:
    ```bash
    case $VARIABLE in
        pattern1)
            # Commands if VARIABLE matches pattern1
            ;;
        pattern2)
            # Commands if VARIABLE matches pattern2
            ;;
        *)
            # Default case (matches anything else)
            ;;
    esac
    ```

- **Example**:
    ```bash
    action="start"

    case $action in
        start)
            systemctl start nginx ;;
        stop)
            systemctl stop nginx ;;
        restart)
            systemctl restart nginx ;;
        status)
            systemctl status nginx ;;
        *)
            echo "Usage: start | stop | restart | status" ;;
    esac
    ```

# Task 3: Loops

## 1.for loop
- **a)** List-based for loop: Iterates over each item in a list.
- **Syntax**:
    ```bash
    for ITEM in list_of_items; do
        # Actions to perform for each ITEM
    done
    ```
- **Example**: Prints user IDs for root,ubuntu,and sanket
    ```bash
    for USER in root ubuntu sanket; do
        id "$USER"
    done
    ```

- **b)** C-style for loop: Loops using a numeric counter.
- **Syntax**:
    ```bash
    for (( initialization; condition; increment )); do
        # Actions to perform each iteration
    done
    ```
- **Example**: Creates file1.txt, file2.txt, and file3.txt
    ```bash
    for (( i=1; i<=3; i++ )); do
        touch "file$i.txt"
    done
    ```

## 2.while loop:
- Repeats commands while the condition is true.
- **Syntax**:
    ```bash
    while [ condition ]; do
        # Actions to perform while condition is true
    done
    ```
- **Example**: Reads /etc/hostname line by line and prints each line
    ```bash
    while read LINE; do
        echo "$LINE"
    done < /etc/hostname
    ```

## 3.until loop: 
- Repeats commands until the condition becomes true.
- **Syntax**:
    ```bash
    until [ condition ]; do
        # Actions to perform until condition becomes true
    done
    ```
- **Example**: Repeats every 3 seconds until the internet is reachable (ping to google.com succeeds),printing a message while it’s down.
    ```bash
    until ping -c 1 google.com; do
        echo "The internet is still down."
        echo "I will try again in 3 seconds..."
        sleep 3
    done
    ```

## 4.Loop control 
- **a)** break: Stops the loop immediately.
- **Syntax**:
    ```bash
    for ITEM in list_of_items; do
        # Condition to stop loop
        break
    done
    ```
- **Example**: Prints .log files until error.log is found, then stops the loop.
    ```bash
    for FILE in *.log; do
        if [ "$FILE" = "error.log" ]; then
            break
        fi
        echo "$FILE"
    done
    ```

- **b)** continue: Skips the current iteration and moves to the next loop
- **Syntax**:
    ```bash
    for ITEM in list_of_items; do
        # Condition to skip current iteration
        continue
    done
    ```
- **Example**: Skips debug.log and prints all other .log files
    ```bash
    for FILE in *.log; do
        if [ "$FILE" = "debug.log" ]; then
            continue
        fi
        echo "$FILE"
    done
    ```

## 5.Looping over files:
- `for file in *.log*`
        
    ```bash
        for FILE in *.log; do
            echo "Processing $FILE"
        done
    ```

## 6.Looping over command output 
- `while read line`
    ```bash
    ls *.txt | while read LINE; do
        echo "File: $LINE"
    done
    ```

# Task 4: Functions

## 1.Defining a funtion:
- **Syntax**:
    ```bash
    function_name() {
        # commands
    }
    ```
- **Example**:
    ```bash
    say_hello() {
        
        echo "Hello!"
    }
    ```

## 2.Calling a function:
- **Syntax**:
    ```bash
    function_name
    ```
- **Example**:
    ```bash
    say_hello
    ```

## 3.Passing arguments to functions:
- $1, $2 inside functions
- **Syntax**
    ```bash
    function_name() {
        echo "$1"    # first argument
        echo "$2"    # second argument
    }
    function_name arg1 arg2
    ```
- **Example**:
    ```bash
    add(){
        num1=$1
        num2=$2
        sum=$(( num1 + num2 ))
        echo "The sum of $num1 and $num2 is: $sum"
    }
    add 2 3
    ```



## 4.Return values:
- Use return for a status code (0–255) & echo gives a value you can use in a variable.

- **a)** return
- **Syntax**:
    ```bash
    function_name() {
        # commands
        return <status_code>   # 0–255
    }

    function_name
    echo $?   # captures the return status
    ```
- **Example**:
    ```bash
    check_service() {
        systemctl is-active --quiet "$1"
        if [ $? -eq 0 ]; then
            return 0    # service is running
        else
            return 1    # service is not running
        fi
    }

    check_service nginx
    if [ $? -eq 0 ]; then
        echo "sshd is running"
    else
        echo "sshd is not running"
    fi
    echo $?
    ```

- **b)** echo
- **Syntax**:
    ```bash
    function_name() {
        echo <value>        # output the value (value can be a number, string or command output)
    }

    result=$(function_name)   # capture the value in a variable
    echo $result             # use the value
    ```
- **Example**:
    ```bash
    get_disk_usage() {
        du -sh "$1" | awk '{print $1}'
    }

    usage=$(get_disk_usage /var/log)
    echo "Disk usage of /var/log: $usage"
    ```

# 5.Local variables: 
- Variables declared with local exist only inside the function and don’t affect the global environment.
- **Syntax**:
    ```bash
    function_name() {
        local var_name=value   # declare a variable local to the function
        # use var_name inside function
    }
    ```
- **Example**:
    ```bash
    count_files() {
        local total=$(ls "$1" | wc -l)   # local variable
        echo "Total files in $1: $total"
    }

    count_files /var/log

    echo $total   # empty, because 'total' is local
    ```
