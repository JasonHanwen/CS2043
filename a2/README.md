# CS 2043 HW2
### Due: Monday 2/29/2016, 5:00pm
### NO LATE SUBMISSIONS ACCEPTED

## Preamble

You can complete this assignment on either Linux or Mac OSX.

Windows is not supported: some of you completed a1 on Windows, and the solutions you produced (which very well may have worked for you on something like Cygwin) were invalid.  You were graded accordingly.

1. Your assignment **must** be pushed onto GitHub in order to be graded.
2. All work must be your own, and you may not share your code with anybody else -- in the class or out.
3. There are plenty of resources both on the course website and related git repositories, as well as all over the internet.  If you find a solution or snag code from an online resource, just cite where it came from.  All students must adhere to the Cornell [code of Academic Integrity](http://cuinfo.cornell.edu/aic.cfm).
4. **ANY** extra files on your GitHub `assignments` repository will be penalized.


### Debugging Bash

#### Short Version

The quick version is that the easiest way is to do:

```bash
set -x # (MINUS) x to start debug printing
. . . code you are suspicious of . . .
set +x # (PLUS) x to stop debug printing
```

and the shell will print out all commands being executed, after the various expansions have completed.  This is particularly useful when trying to understand when `sed` is not doing what you expect, likely because your regular expression turned into something unexpected.

For the more experienced users who are familiar with `gdb` or similar debuggers, you may want to take a look at `bashdb` (install it with `dnf` on Fedora, and `apt-get` on Ubuntu).

#### Long Version:

Check out the <a href="DEBUGGING.md" target="_blank">DEBUGGING.md</a> tutorial I have prepared for a step by step walk-through of a relatively simple program.  Experienced users may find some new treats in there, and are encouraged to give it a quick scroll-through.

## Getting Started

This assignment is going to give you practice writing `bash` scripts, as well as how to wield your epic regular expressions (regex) skills.  Some simple examples have been provided, which are a great place to start.  But passing the examples is not a guarantee that your script is fully functional.

- If you `git add` files we did not ask, we reserve the right to deduct points from your score.
- You must name files **exactly** as the problem statement defines.
    - Improperly named scripts, including wrong capitalization, as well as in the wrong location, will result in a **0** for that problem.
- The scripts you submit should be *executable*.
    - Each script should have the appropriate shebang at the beginning: `#!/bin/bash`
    - If you `git add` an executable file, this will be tracked and you are done.
    - If you added the file before you made it executable, you simply need to use your terminal to make it executable and in your next commit you will see `git` changing the "mode" of the file.
- You will need to `git pull` in this repository in order to begin working.

## Submission Overview

- Task 1: you are to add the `collect_marbles.sh` script as an executable file in the `a2/TASK_1` directory.
- Task 2: You are to add the `merry_math.sh` script as an executable in the `a2/TASK_2` directory.
- Task 3: You are to MODIFY the `gandalfify.sh` in the `a2/TASK_3` directory.
- Task 4: You are to provide your written responses in this README (the `a2/README.md`).

In picture form:

```bash
-[github_username]-assignments/
    - README.md
    - a1/
        [the files related to a1]
    - a2/
        #
        # These files are given to you in the release.
        #
        - README.md              # This file, Task 4 answers here.
        - DEBUGGING.md           # Debugging tutorial, don't change.
        - TASK_1/
            - TASK_1_EXAMPLE.md  # Example input and output for Task 1.
            - moria.txt          # File from example walkthrough.
            - shire.txt          # File from example walkthrough.
        - TASK_2/
            - TASK_2_EXAMPLE.md  # Example input and output for Task 2.
            - stolen_crops.csv   # File from example walkthrough.
        - TASK_3/
            - TASK_3_EXAMPLE.md  # Example input and output for Task 3.
            - style.css          # Do not change this file.
            - MARBLE_SHOPPE.md   # Do not change this file.
            - example.md         # Minimal example from walkthrough, start here before using MARBLE_SHOPPE.md.
            ######################
            - gandalfify.sh      # <<< You MODIFY this file.
            ######################
        #
        # You must create and git add these files.
        #
        - TASK_1/
            - collect_marbles.sh # Task 1 solution.
        - TASK_2/
            - merry_math.sh      # Task 2 solution.
```

# The Fellowship of the Script

Frodo sits quietly reading a book in the forest, dreaming of the day when Gandalf will return with some more fireworks.  More importantly, though, he grows weary of looking after the increasingly frustrating senility of Bilbo.  Unbeknownst to Bilbo, Frodo, and even Gandalf, though, treachery is afoot.  As it turns out, the great Base Master of Treachery (Sauron) really engineered the rings of power to siphon intellect from the wearer of the ring.  He wanted to live forever, but was well versed in the unfortunate truth of how the brain ages and realized he could steal the ring-bearer's marbles for himself.

## Task 1

### The Story

Frodo's least favorite task of the day is helping Bilbo find his marbles.  All the old fool does day in and day out is shut himself in his study and re-read is various maps and journals, muttering on about how if he could only find his marbles then he could return to live with the Elves.  The only thing that Frodo hates more than "helping" Bilbo find his marbles is playing the "What's in my Pocket game", because the answer is always the same.

Each day between Elevenses and Lunch Bilbo demands that Frodo assist in the age-old task of the marble search.  Having been traumatized by this search everyday since the time he could walk, Frodo has finally decided that he should automate the process.  According to Bilbo, he has encoded the secret location of the marbles in different maps and journals throughout his study.  However, these maps and journals were actually given to him by the Elves (who stole them from Dwarves), and it is futile to search for marbles on the wrong day of the year.

Each day Bilbo recites a list of maps and journals that are valid to search on that day from memory, and Frodo must collect them all and search for the marbles.  Bilbo also informs Frodo that there is a minimum and maximum line-length (specific to that day) that would potentially contain the location of a given marble.  That is, as Frodo reads through every line of the journals and maps, if a given line of prose contains fewer words than the dictated minimum, or more words than the dictated maximum, then no marbles have been described by that line and Frodo should move on.

### The Assignment

Create a script named `collect_marbles.sh` that performs the following:

1. The script will be called with arguments as follows:
    - The first argument is the *minimum* length of a line.
    - The second argument is the *maximum* length of a line.
    - All remaining arguments are the names of the journals and maps that are to be searched (filenames).

2. If your script receives **fewer than 3** arguments, it should print the exact message to the console (STDOUT):

    ```
    Ye shall not search for marbles if ye cannot find the key.
    ```

    and produce an `exit` code of `1`, without doing any further processing. AKA check for this at the beginning before doing anything else...

3. You may assume that arguments one and two, if supplied, are positive integers where:
    - The *minimum* length is greater than or equal to 1.
    - The *maximum* length is greater than or equal to the *minimum* length (never less than).

4. You may **not** assume that the third and higher arguments are *valid*.  That is, you must verify that the argument given *is a file* first before trying to read it.
    - If an argument given is not a real file, append the name that was given to `FAILED.log` in the current directory.

5. For every valid file path specified, loop over every line in the file:
    - Count the number of words on that line.
    - If the number of words is between the *minimum* and *maximum* that Bilbo specified, append it to the end of `MARBLES.txt` in the current directory.
    - Otherwise, just move on to the next line.
    - Refer to the "Loops" section in Lecture 09 for how to correctly loop over a file.

### Submission

- You only need to `git add` the `collect_marbles.sh` file in your `a2/TASK_1` directory.
- **DO NOT** add `MARBLES.txt`, `FAILED.log`, or any files you created to test this script.

### Additional Information

As a reminder, there is a huge difference between `>` and `>>` where file operations are concerned:

```bash
# BAD
# This will overwrite MARBLES.txt to have just one line.
echo "$line" > MARBLES.txt

# GOOD
# This will append to the end of MARBLES.txt
echo "$line" >> MARBLES.txt
```

We have asked that you only ever append to a file.  Note that if you run your script multiple times as you are testing it, your file will continue to grow.  This is the **desired** behavior, however as you develop you may want to `rm` your `MARBLES.txt` and `FAILED.log` if you only want to test a single execution of the script.

You may already know this, but if you execute

```bash
echo "Check out how I make new files" >> SOME_FILE.txt
```

and `SOME_FILE.txt` does **not** already exist in the current directory, it will make it for you!  If you execute it again, you will see that `SOME_FILE.txt` now has two lines instead of one.

### Sample Inputs and Output

Refer to <a href="TASK_1/TASK_1_EXAMPLE.md" target="_blank">`TASK_1/TASK_1_EXAMPLE.md`</a>.

## Task 2

### The Story

Frodo can at long last enjoy a little bit of "me-time", as Bilbo refuses to allow Frodo to be involved in the decryption phase.  Somewhat agitated by the fact that Bilbo will not allow him to partake in this task after all these years, Frodo decides to return to the forest to catch up on some reading.  After all, he doesn't really even want to be involved in that part...Bilbo claims that marble decryption must be done whilst wearing a tea cosy on your head and nothing else.

As Frodo tries to forget that mental image, he is knocked over by Pippin and Merry who seem to have come out of nowhere.  It becomes quite apparent that not only have they been stealing crops from Farmer Maggot, but they have been stealing his marbles too!  They realized that the more marbles they steal from Farmer Maggot, the easier it is to steal crops (since they are effectively degrading his consciousness).

Intrigued by the idea, and appalled by the act, Frodo is now entrenched in an awkward situation.  Pippin and Merry somehow already found out that Frodo is a total Unix scripting pro, and have asked him to help them create a tool that would enable them to analyze their potential profits from both the crops and the marbles.

Frodo realizes that they are too foolish to connect the dots that if they would only eat the marbles they could write their own, and strikes a deal: he will create this tool for them if they pay him with the marbles they have stolen.  He convinces them that once removed they are useless, and that they can only make a profit from the crops anyway.

They are suspicious, but Frodo explains that he is going to try and use them to satiate Bilbo's ludicrous marble search.  Having grown up with Frodo, they accept this as a plausible application.

### The Assignment

You are to create a script `merry_math.sh` that can analyze specific columns of a `csv` file.  A `csv` file is a "Comma Separated Value" sheet often used for storing data such as the number of carrots or potatoes stolen on a given day.  Ordinarily `csv` files are supposed to have the first row be the "Header", that describes what each column is.  For this task, there will be no header to simplify your work.

---------------------------------------------------------------------------------------------------------------

Your script must support the following integer arithmetic operations:
- `add`: add the specified columns together.
- `sub`: subtract the specified columns.
- `mul`: multiply the specified columns.
- `div`: divide the specified columns.
    - Do not be concerned about division by 0, you can assume it will not happen.
- You do not need to be concerned with {over,under}flow.  For the interested, `bash` 3.0+ uses signed 64 bit integers (regardless of the architecture).

---------------------------------------------------------------------------------------------------------------

Your script will receive input arguments in the following form:
- `"$1"`: the name of the `csv` file.  This file is not guaranteed to exist.
    - If the file does **not** exist, simply `exit` with code `66`.
    - This error code takes precedence over an invalid operation code (next bullet.)
- `"$2"`: the operation you are to perform, one of `add`, `sub`, `mul`, or `div`.
    - If the operation is not one of these four strings, you should `exit` with code `1`.
- `"$3"`..`"$n"`: an integer specifying the columns to perform the operation on.
    - These are not guaranteed to exist.
    - If fewer than four arguments are given, `exit` with code `64`.  This error should take precedence over the error codes for `"$1"` and `"$2"`.
        - This is easier for you!  Just check `"$#"` first...
    - This has no effect on the code you write, but these do not have to be specified in order of the actual `csv` file.  For example, `"$3"` could be column `12`, and `"$4"` could be column `3`.
    - You may assume that `"$3"`..`"$n"` contain valid column numbers: they are positive integers, and the `csv` specified by `"$1"` has at least as many columns as these arguments (aka don't worry about validating if there are that many columns).

To be extra clear, you should check errors in the following order to provide the correct error code priorities:

```
if too few arguments, then
    exit with an error code of 64
else if the provided filename is not a file, then
    exit with an error code of 66
else if the operation code provided is not supported, then
    exit with an error code of 1
```

So if four arguments were provided, but both the filename and operation code were invalid, then the `exit` code should be **66**, not 1.

---------------------------------------------------------------------------------------------------------------

Your script is to strip the columns requested and perform the mathematical operation requested.
- The computation is to be written to the file `RESULTS.txt`.
- If the file `RESULTS.txt` already exists, overwrite it (aka use `>` instead of `>>`).
- The computation you should perform is the *operation* on the columns, in order.  For example:

    - With operation `add` and arguments `"$3"`, `"$4"` supplied, compute:

      ```bash
      ( $3 + $4 )
      ```

    - With operation `div` and arguments `"$3"`, `"$4"`, `"$5"`, and `"$6"` supplied, compute:

      ```bash
      ((( $3 / $4 ) / $5 ) / $6 )
      ```
    - Parentheses were added for clarity, but you will need to execute this task in a loop and will not really need to worry about grouping expressions like this.

### Submission

- You only need to `git add` the `merry_math.sh` file in your `a2/TASK_2` directory.
- **DO NOT** add *any* `csv` files you used for testing, or `RESULTS.txt`.

### Sample Inputs and Output

Refer to <a href="TASK_2/TASK_2_EXAMPLE.md" target="_blank">`TASK_2/TASK_2_EXAMPLE.md`</a>.

## Task 3

### The Story

Enthralled by the superb automation he is now able to perform, Frodo ponders what could possibly be next.  As Pippin and Merry go skipping away contented with their new calculator, Frodo hears a faint but familiar song being hummed off in the distance.  Taken aback by the comforting melody, he decides to go track down who could possibly be such a talented songster.  For not only is there humming, but a unique form of whistling that he suspects would summon even the most regal and renowned of horses.

Frolicking through the forest, he comes to a road just as Gandalf the Omnipotently Nonchalant rides his carriage toward the Shire.  Unable to contain his joy (because this almost certainly means there will be fireworks), he leaps from the side of the road onto Gandalf's cart.  Gandalf laughs in a manner that makes Frodo think there may have been some recently cut cheese, but dares not to ask for fear of the truth.

As they ride in to town, Gandalf turns to Frodo and inquires whether he might be interested in helping him con Sauron.  For too many years Gandalf has been overshadowed by him, and seeks the title of Great Deceiver, but he is far too old to learn how to use computers and needs help designing a website.  Gandalf was able to convince Sam to create a Markdown document for the website in exchange for some potatoes, but despite great efforts Sam was simply just too simple to be able to create anything more interesting.

Gandalf is confident that he will need a colorful website in order to pull off this scandal, and turns to Frodo.  Having learned of his recent super-pro-allstar status as a Unix guru, Gandalf is confident that Frodo will be able to provide a tool that can take any one of the the Markdown documents Sam completes and generate a colorful HTML page.

Gandalf scurries away claiming that there are questions, questions that need answering, and Frodo is left to himself to complete the task alone (once again).  Intimidated by `sed`, Frodo gobbles down his newly acquired Maggot-Marbles and instantly feels ready to complete his next task.

### The Assignment

You are to modify the script `gandalfify.sh` to be a relatively basic Markdown to HTML parser.  You will need to utilize `sed` to complete this task.  You do not need to understand the syntax of `Markdown` or `HTML` in order to complete this task -- just follow the directions and it will work.  I have chosen to give you this assignment because it gives you visual confirmation that you have been successful.

Before enumerating the tasks explicitly, I must describe some `BSD` vs `GNU` compatibility issues.

---------------------------------------------------------------------------------------------------------------

#### Forbidden Behavior:

Under no circumstances are you allowed to use the `-i` flag for `sed`.  If you use it, you will receive 0 points.  It is not portable, and you should have no reason to use it.

---------------------------------------------------------------------------------------------------------------

#### Required Behavior:

You will need to use *extended* regular expressions for this task.  The `+` operator (which means find one or more of the expression it modifies), for example, is part of the *extended* regular expressions.  For example, the regex `[a-z]+` simply denotes "one or more lowercase letter".  Strings that are in this set would be things like `a`, `asdf`, `fdsa`, etc.

GNU `sed` uses the `-r` flag to indicate that *extended* regular expressions are permitted, whereas the BSD (and therefore OSX) `sed` uses the `-E` (capital, not lower case!) flag to enable these.  However, as it turns out, even though the `-E` flag is not present in the GNU `man sed` page, it is supported and is exactly the same as `-r`.  Dmitry Leskov mentions it <a href="http://blog.dmitryleskov.com/small-hacks/mysterious-gnu-sed-option-e/" target="_blank">in his blog</a>, as well as you can see it <a href="http://git.savannah.gnu.org/cgit/sed.git/tree/sed/sed.c#n313" target="_blank">in the GNU source code</a>.

**The Takeaway**: regardless of if you are running GNU or BSD `sed`, you **MUST** use the `-E` flag.  Usage of the `-r` flag will be penalized, as we will have to change it to grade your submission.

---------------------------------------------------------------------------------------------------------------


### Task 3.1: Generate the Paragraphs for HTML

You should assume that **any** line that has text, but does **not** start with a `#` sign will turn into a paragraph.  In Markdown, you can create headers (title sections) by starting the line with a `#` and writing the title afterward.  For example, these are all valid Mardown headers:

```
# This is an H1 header

This is a regular paragraph.

##          This is an H2 header

This is another regular paragraph.

###    This is an H3 header.

This is yet another regular paragraph.
```

Note that there is an arbitrary amount of whitespace (that is *not* a newline) before the headers.  We will account for this in task 3.2.  In this task, you simply need to identify whether or not the line you are parsing with `sed` begins with a `#` symbol or not.  That is:

1. Create a regular expression that can find any line that **DOES** begin with a `#` symbol.
    - I will not give you any files that have headings with preceding whitespace, even though this is valid Markdown syntax.
2. Now that you have a regex representing all of the lines that you do **not** want to turn into paragraphs, invert this regex (remember that `^` means **not**) in regular expressions.
3. Surround the regular paragraphs with the HTML paragraph tag.  In HTML, you start a tag with `<tag>`, and end it with `</tag>` (where the ending has a `/`).  The paragraph tag is `p`.  So for example, you would take the line

    ```
    This is a regular paragraph.
    ```

    and turn it into

    ```
    <p>This is a regular paragraph.</p>
    ```
4. For simplicity, you can assume that there will not be any preceding whitespace before the text you are to turn into a paragraph.  So you will not have to account for something like

    ```
        This is a weird paragraph with preceding whitespace.
    ```

Go ahead and get started!  You should modify `TASK_3/gandalfify.sh` in the appropriate section.  Read the comments, you will see it.

### Task 3.2: Generate the Headers for HTML

At this point we now have all of our paragraphs accounted for, and can start turning the various levels of `#` into the appropriate header.  You will need to account for three scenarios:

<center>

| Header Type    | Markdown                    | HTML Tag |
|:---------------|:----------------------------|:--------:|
| Level 1 header | One `#` followed by text.   | `<h1>`   |
| Level 2 header | Two `#` followed by text.   | `<h2>`   |
| Level 3 header | Three `#` followed by text. | `<h3>`   |

</center>

Working with the example we started above, our text now looks something like this:

```
# This is an H1 header

<p>This is a regular paragraph.</p>

##          This is an H2 header

<p>This is another regular paragraph.</p>

###    This is an H3 header.

<p>This is yet another regular paragraph.</p>
```

You need to produce

```
<h1>This is an H1 header</h1>

<p>This is a regular paragraph.</p>

<h2>This is an H2 header</h2>

<p>This is another regular paragraph.</p>

<h3>This is an H3 header.</h3>

<p>This is yet another regular paragraph.</p>
```

Warning:

1. Note that I have removed the whitespace between the `#` and the text.  You must do the same.
2. The whitespace in `MARBLE_SHOPPE.md` has a mixture of spaces and tabs in some cases.  You must catch these.
    - Use the <a href="http://www.troubleshooters.com/linux/presentations/leap_regex/13.html" target="_blank">`POSIX` sets</a>.
    - Caution: two potential sets could fit here, one may not work in all cases since it is more than just spaces and tabs.
3. You must also be able to parse headers that were not formatted correctly by Sam.  Markdown dictates there must be at least one whitespace character between the header declaration (the `#` characters).  Simple Sam did not follow this, so you must be able to share the load:

    ```
    ##Header 2 with no whitespace must be parsed correctly
    ```
4. Refer to the Preamble for debugging.

### Using the Script

The `gandalfify.sh` script expects exactly one argument: the name of the Markdown document file to be parsed / turned into an HTML document.  Simply specify the name of the file you want to parse.  For example, assuming you were in the `a2/TASK_3` directory:

```bash
>>> ./gandalfify.sh MARBLE_SHOPPE.md
Converted MARBLE_SHOPPE.md into index.html!
```

From there, you can "visually debug" by simply opening `index.html` in your browser.  The cool thing is you can keep it open in the browser, and re-run the script and then just refresh your browser to see the updated version :)

### Submission

- Simply `git commit` any changes you make to `gandalfify.sh` and `push` them online.
- **DO NOT** add *any* files you used for testing, or any of the generated `index.html` files produced by `gandalfify.sh`.

### Additional Information

#### Suggested Behavior

Refer to the <a href="https://github.com/cs2043-sp16/lecture-demos/tree/master/lec08" target="_blank">lecture 8 demo</a> for how to make `sed` a little more straightforward.  Specifically, the technique of defining your regular expressions in variables and dereferencing them in the call to `sed`.  It just makes your code a little easier to parse, which is very helpful given that the syntax for `sed` is already quite verbose.  It also makes it easier for you to try a different regex by simply changing the value of the variable, as opposed to having to rewrite your `sed` commands each time.

#### Some useful regex resources:
- Bash regular expressions overview: https://www.gnu.org/software/sed/manual/html_node/Regular-Expressions.html
- Bash extended regular expressions: http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_04_01.html#sect_04_01_03
- Lecture 08's "The Stream Editor (sed)" section.

#### Challenge Questions (optional, not required)

##### 1. Produce proper indentation automatically using `sed`.  I have left the indentation variables defined at the top of `gandalfify.sh` for you.  This should actually be rather simple once you have finished the rest of the task.  Just a proof of concept.

##### 2. There is an un-ordered list in `MARBLE_SHOPPE.md`, but each element will get parsed into a separate paragraph.  Turn them into HTML unordered lists.

Unordered lists in Markdown come in a variety of forms:

```
+ one format uses plus signs
+ to indicate new bullets
+ in the list

- one format uses hyphens
- to indicate new bullets
- in the list

* one format uses plus asterisks
* to indicate new bullets
* in the list
```

They are all equivalent, and you can assume that I will not mix them (`+` and `-` for example, will not be used in the same list).

The HTML unordered list is as follows:

```html
<ul>
    <li>This is an item.</li>
    <li>This is another item.</li>
    <li>This is the last item.</li>
</ul>
```

So you will not only need to surround each bullet from Markdown in an `li` tag, but you will have to be able to find the beginning and end of the list and put the `ul` tag.  You should assume that there will not be any newlines between bullet points.  For example:

```
- This list is acceptable
- Because it is
- Formatted correctly
- Yay!
```

whereas

```
- This list will end up as two separate lists
- Because there is an empty line between them

- And your regex will see this as the end of the list
- ...most likely.
```

**NOTE:** This is an exceptionally challenging task!  You are welcome to create any additional temporary files you need to, so long as you remove them after you are finished with them.  If you complete this task, please upload an alternate `gandalfify_extreme.sh` so that your regular `gandalfify.sh` can be graded based off of the original assignment.

### Sample Input and Output

Refer to <a href="TASK_3/TASK_3_EXAMPLE.md" target="_blank">`TASK_3/TASK_3_EXAMPLE.md`</a>.

## Task 4


#### 1. How would you set an environment variable from your terminal *for the current session only*?  There are more than one solution, just provide one.

> **TODO 4.1**
>
> http://askubuntu.com/questions/58814/how-do-i-add-environment-variables
> To set variable only for current shell:
> `VARNAME="my value"`

#### 2. What file should you modify so that an environment variable is **always** set every time you *log in*?

> **TODO 4.2**
>
> http://askubuntu.com/questions/58814/how-do-i-add-environment-variables
> `export VARNAME="my value"`

#### 3. You have a job that is taking way too long running in the foreground, and need your terminal back.  What key combination will pause the job?

> **TODO 4.3**
>
> control + z

#### 4. Now that you have paused the job, how do you resume it and let it run in the *background* so that you can keep using your terminal?

> **TODO 4.4**
>
> `jobs` to find the job id
> `bg %1` suppose 1 is the corresponding job id

#### 5. How could you launch a command such that none of it's output (STDOUT or STDERR) prints to the terminal?  You must specify the version of bash you are using (e.g. the output of `bash --version`).

> **TODO 4.5**
>
> ` > /dev/null 2>&1 &`
> version 3.2.57

#### 6. How can you launch a command so that when you close your terminal, the program will continue running?

> **TODO 4.6**
>
> launch the program with `nohup`

#### 7. Is there a specific theme you would like to see in future assignments?

> **TODO 4.7**
>
> Kung Fu Panda!!!

