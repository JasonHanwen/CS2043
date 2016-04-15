# CS 2043 HW1
### Due: 2/12/2016, 5:00pm

## Preamble

This assignment is going to give you practice chaining commands, as well as inspecting and modifying permissions.  You can complete this assignment on either Linux or Mac OSX.  

1. Your assignment **must** be pushed onto GitHub in order to be graded.
2. You are advised to start early.  This assignment will not be graded until *after* the drop deadline for this course.
    - The drop deadline is 2/10/2016.
3. All work must be your own, and you may not share your code with anybody else -- in the class or out.
4. There are plenty of resources both on the course website and related git repositories, as well as all over the internet.  If you find a solution or snag code from an online resource, just cite where it came from.  All students must adhere to the Cornell [code of Academic Integrity](http://cuinfo.cornell.edu/aic.cfm).

## Getting Started

You now have an `assignments` repository, you will be submitting assignments here for the duration of the course.  Please do not `git add` any files other than the ones we instruct.
- If you `git add` files we did not ask, we reserve the right to deduct points from your score.
- You must name files **exactly** as the problem statement defines.
- You will need to `git clone` this repository in order to begin working.
- Start early.

## Task 0:

There are many philosophies on how often you should commit, what your message should say, etc.  For now, though, we're still learning.

1. You must have at least 5 commits to receive full credit.
2. Meaningful commit messages are helpful to you, and are encouraged, but if you happen to tell a good story with your commits (on this assignment only)..."10 points to Gryffindor".
3. Remember the general sequence here:
    - `git status` to see what has changed (or needs to be added)
    - `git add` if there is a new file you have made
    - `git commit` to pledge you are ready to put these online
    - `git push` to get them on the server
    - If you were successful you should see the changes online in your browser.

This will be the only assignment that we will actually check your commits on.

4. Run the file `gen_a1.sh` in the current directory.
    ```
    > ./gen_a1.sh
    ```

    Recall that if you cannot execute the above, you may need to modify the file so that it can be executed.

You now have the first assignment and can proceed.  If at any time you wish to start over (e.g. to check your results), simply execute `gen_a1.sh` again from your `a1/` directory and allow it to remove the `dungeon` folder.  You will then have a fresh copy.

> TODO 0:
>
> **Write the operating system you have completed this assignment with**:
> MacOS
>

# Harry Potter and the Chamber of d---------

Harry has discovered that Voldemort is looking for the Philosopher's stone again and wants to stop him as soon as possible. In order to stop him, Harry has to overcome a series of difficult obstacles which have not been solved for many years by even *the best* wizards and witches. Harry looks for Hermione as she, being very intelligent, can help him.  Alas, Harry doesn’t know where she is! As Harry often does, he makes somebody else do the real work for him.  He will need your help to do the hard parts, because he is not a super Unix hacker-pro like you!

## Task 1:

In order to proceed, Harry needs to enter the dungeon. But he’s stuck as the `dungeon` (directory) is closed and he is unable to open it. Every time he tries to enter, he gets "Permission Denied" error. Help him to get through the door.

### Task 1.1: Grant sufficient permissions so that **Harry** can enter the door, and then enter the `dungeon` with him.

Note that Harry cannot use `sudo`, nor does he know the root password to use `su`, so you will need to make sure that a regular user can enter.

> TODO 1.1:
> chmod -R 777 dungeon/
find dungeon -type d,f -exec chmod 777 {} ';'
> ```bash
> # Write the command(s) you used here, one command per line
>
> ```

Thanks to your help, Harry is able to enter the `dungeon`. In front of him are several doors. He also knows that behind each door there can be several other doors, and each door behind that may lead to even more doors. Since time is very critical for Harry, there is no time to manually count all of them.

**Caution**: if you become the `root` user and complete the remainder of the exercise you may leave Harry behind.  You are encouraged to use `sudo` to inspect the dungeon / change permissions in this and the following tasks, because you will remain a regular user and therefore be able to verify that Harry can follow you.

- We will execute all remaining answers assuming you executed them from within the `a1/dungeon` directory.
- We will test your commands as a regular user.  You will not receive full credit if only the `root` user can execute your responses.

### Task 1.2: *Find* out how many *directories* are in the `dungeon` folder.

> TODO 1.2:
>find dungeon/ -type d | wc -l
> **Write your answer here (e.g. There are 42 directories)**:
> 265
> ```bash
> # Write the command(s) you used here, one command per line
>
> ```

*Hint*: there are more than 111.

## Task 2

Hagred hinted to Harry that the `dungeon` might contain excerpts of German literature throughout the various rooms.  Curious about *how* Hagred would know such a thing, Harry continues forward through the first door.  He comes face to face with the *Keeper of the Bridge of Death*.  The keeper demands an answer, but as the dungeon is very dark he has grown weary of querying what a person's favorite color is.

*Note*: Google `Keeper of the Bridge of Death` and the top listing should be a 3min 20sec YouTube video that should give you inspiration, I cannot link it here due to copyright concerns...

### Task 2.1: WHAT is the average number of words in a file?

You do not need to create a script, but if you know how go for it!  Inline the script into your answer.  Re-order the fenced code block in the response if you did it in one chain.

> TODO: 2.1
>
> **Write your answer here**:
> wc - w file
> find .  -type f -exec wc -w {} +
> f=$(find . -type f | wc -l)
> echo $(w/f)


w= find dungeon/  -type f -exec wc -w {} + | tail -1 |awk '{print $1}'
f= find dungeon/ -type f | wc -l
echo $(w/f)
> ```bash
> # First, include the command to calculate the number of words.


You do not need to use commands to perform numerical operations, we will assume that you are going to use a calculator or something to calculate *number of words / number of files*.  +Hacker points for your script `echo`ing the result.

### *Challenge Question*: (Optional, not required for full credit)

Reassemble the original text into one file.

> TODO: Challenge Question
>
> **Who is the author of the text?**
>
> **What is the title of the text?**
>
> **Have you read it?**

## Task 3

Nearing the end of the labyrinth, Harry is just one step before reaching his destination. Harry sees four potions labelled `a`, `b`, `c`, and `d` sealed in bottles in front of him. Each bottle contains a key at the bottom, but in order to get the key he has to drink the potion first. There is only one key that will allow Harry to continue.

Harry recalls overhearing Hagrid say that the potion with the highest density has the right key. Harry claims that he does not know "how to math", and asks you to identify which potion he should drink.

The density is defined as the total number of words found in all of the files spread across all of the subdirectories in each potion.

### Task 3.1: Analyze the density of the four potions

As stated above, we assume that you are in the directory `a1/dungeon`.  You must create a directory `a1/analysis` that contains the densities of each potion.  That is, we will assume the following directory structure:

```
- a1/
    - dungeon/
        (you are here)
        - a/
        - b/
        - c/
        - d/
        - ... (other directories are here too, we only care about [a-d]
    - analysis/
        - a.txt
        - b.txt
        - c.txt
        - d.txt
```

Each file should contain exactly one line, where that line is the density of the potion it represents.  For example, if the density of potion `a` was `11`, then the file `a1/analysis/a.txt` will be

```
11
```

Place your answers here:

> TODO: 3.1
> ```bash
> # Make the analysis directory in the correct location.

>
> # Analyze potion (a), and place the results into the appropriate file.

>
> # Analyze potion (b), and place the results into the appropriate file.

>
> # Analyze potion (c), and place the results into the appropriate file.


>
> # Analyze potion (d), and place the results into the appropriate file.
>
> ```

You may use as many commands as you need to, and most of your answers for [a-d] will be the same -- the only change is the directories / file locations.

To receive full credit, you may not use a text-editor to edit the files.  You are encouraged to use piping and redirects to put your answer in the appropriate file.  If you are unable to create a chain of commands to directly output the correct result to the `analysis`, you can still receive full credit by `echo`ing the answer into the correct file.

*Hints*:

1. Recall that you can chain a sequence such as the following:

    ```bash
    echo "Unix is pretty cool" | tr "pretty" "really" | tr "a-z" "A-Z" > cool.txt
    ```

    to create the file `cool.txt` in the *current directory* that has the contents "UNIX IS REALLY COOL".

2. Recall that you can use `..` to refer to the parent directory (the one directly above you).  Try executing `ls ..` to make sure.

### Task 3.2: Tell Harry to drink the right potion.

Now that you have analyzed the potions, tell Harry which one to drink.

> TODO 3.2:
>
> **Write the potion Harry should drink to get the key**:
> c
>

### Task 3.3: Add the analysis to your repository.

Add the `analysis` folder to your git repository.  Remember that if you want to add everything in a folder, you can do

```bash
```

and the folder as well as all of the files / folders below it will be added.
w
## *Challenge* Task 4 (Optional, not required for full credit)

Finally, Harry faces the Voldemort who challenges him to a difficult puzzle. In order to save the world, Harry once again asks for your help.

You need to find the list of all files which contains the word "an" as a whole. Here "an", "An", "AN" and "aN" are all considered equal.

A partial match does not count: "and" contains "an", but should not be listed in the results.  Find all the names of the files that contain "an", sorted in lexographical (alphabetical) order, and store them in a file named `output.txt` in the current directory.  Do **not** add this file to your repository.  Each file name should be printed on a separate line.

> TODO: Task 4
> ```bash
> # Include below the command(s) to store the results to output.txt
> ```

## Task 5

### Written Questions

#### Was this assignment entertaining?

> TODO Written
>
> Yes!

#### Rate the difficulty of this assignment.  Too hard?  Too easy?  Just right?

> TODO Written
>
> Just right.

#### How long did it take you to complete this assignment?

> TODO Written
>
> 2 hours.

#### How soon did you start?  Be honest, this information helps us identify how the class is doing as a whole.

> TODO Written
>
> Feb 7th.

#### What do you like about this class?

> TODO Written
>
> It is useful, for interview and daily use.


#### What would you change about this class?

> TODO Written
>
> Don' know.

#### Anything else you would like to add?

> TODO Written
>
> No.
