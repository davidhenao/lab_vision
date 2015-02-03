# Warmup Questions

1.  What is the clone url of this repository?
    https://github.com/davidhenao/lab_vision.git

2.  What is the output of the ``cal`` command?

    The output of the ``cal`` command is the current month (if no options are provided) in terminal.
    
        febrero de 2015
    do lu ma mi ju vi sá
    1  2  3  4  5  6  7
    8  9 10 11 12 13 14
    15 16 17 18 19 20 21
    22 23 24 25 26 27 28

# Homework Questions

1.  What is the ``grep``command?
    Grep is a UNIX utilitie that searches files for specified words or patterns command is case sensitive; it distinguishes between "Orange" and "orange".

    Some options of grep are:
    
    -i ignore upper/lower case distinctions.
    -v display those lines that do NOT match. 
    -n precede each matching line with the line number.
    -c print only the total count of matched lines. 
    
2.  What is a *makefile*?
    Makefiles are special format files that together with the make utility will automatically build/compiling source code files.

3.  What is *git*?
    Git is a revision control system (VCS) that facilitate the management of different versions of each product      developed and made possible specializations.

4.  What does the ``-prune`` option of ``find`` do? Give an example
    The –prune option in find, ignore the proceding path. So -prune is an action which has the side effect that find will not recurse into subdirectories which match the preceding test.
For example
    To find all files and directories other than the file named temp:
    $ find . -name temp -prune

5.  Where is the file ``xxxxxx``
     $ find . -iname 'xxxxxx'

6.  How many files with ``gnu`` in its name are in ``dir``
    cd ..
    cd ..
    cd /usr/src

    $ find . -iname '*gnu'| wc - l

7.  How many files contain ``gpl`` inside in ``dir``
    cd ..
    cd ..
    cd /usr/src

    $ find . -type f | xargs grep "gpl"| wc - l

8.  What does the ``cut`` command do?
    The cut command is used for the extraction of segments ( or portions ) of the lines of text from a file or from standard input command

    Example

    file1:file2:file3:file4
    one:two:three:four:five:six:seven
    a:b:c:d:e:f:g:h:i:j:k

    $ cut -c 4-20 file.txt

    e1:file2:file3:fi
    :two:three:four:f
    :c:d:e:f:g:h:i:j:

9.  What does the ``wget`` command do?
    wget command is a web downloader tool that supports http, https y ftp. For example:

    wget http://example.com/*.pdf

10.  What does the ``diff`` command do?
    diff command search diferences between two files. For example:
    
    file1.txt:
    apples
    oranges
    kiwis
    carrots

    file2.txt:
    apples
    kiwis
    carrots
    grapefruits

    diff -y file1.txt file2.txt
    Output:
    apples            apples
    oranges         <
    kiwis             kiwis
    carrots           carrots
                     > grapefruits

11.  How many users exist in *Guitaca*?

    who show the online users in Guitaca
    
    [vision@guitaca src]$ who
    vafus    :0           2015-02-02 08:59 (:0)
    vision   pts/2        2015-02-03 07:03 (186.80.98.187)
    vision   pts/4        2015-02-03 05:39 (186.80.98.187)
    vision   pts/6        2015-02-02 17:26 (laura.uniandes.edu.co)
    vision   pts/7        2015-02-03 05:51 (186.80.98.187)
    vision   pts/8        2015-02-03 06:00 (186.80.98.187)
    vafus    pts/5        2015-02-02 18:35 (:0)
    vision   pts/1        2015-02-03 07:07 (duvanalcursmbp2.uniandes.edu.co)
    
    But to know the users in the system:

    cut -d: -f1 /etc/passwd

12. What command will produce a table of Users and Shells sorted by shell (tip: using ``cut`` and ``sort``)
    >   answer

13. What command will produce the number of users with shell ``/sbin/nologin`` (tip: using ``grep`` and ``wc``)
    
    getent passwd | \
    grep -vE '(nologin|false)$' | \
    awk -F: -v min=`awk '/^UID_MIN/ {print $2}' /etc/login.defs` \
    -v max=`awk '/^UID_MAX/ {print $2}' /etc/login.defs` \
    '{if(($3 >= min)&&($3 <= max)) print $1}' | \
    sort -u

Source: http://stackoverflow.com/questions/16633614/shell-script-to-get-list-of-defined-users-on-linux

14.  What is the name of the linux distribution running on *Guitaca*?

    $ cat /etc/*-release

    The name of the linux distribution running on *Guitaca* is Fedora release 20.

15. Create a script for finding duplicate images based on their content (tip: hash or checksum)
    You may look in the internet for ideas, but please indicate the source of any code you use
    Save this script as ``find_duplicates.sh`` in this directory and commit your changes to github

16. What is the meaning of ``#! /bin/bash`` at the start of scripts?
    
    The exclamation mark ("!") is affectionately called "bang". The shell comment symbol ("#") is sometimes called "hash". And it's a convention so the *nix shell knows what kind of interpreter to run.

17. How many unique images are in the ``sipi_images`` folder?
    >   answer
    
