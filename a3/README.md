# CS 2043 HW3
### Due: Friday 3/18/2016, 5:00pm
### Late Submissions Accepted Until: Monday 3/21/2016, 5:00pm

Seriously though, this one cannot be pushed back any further.  You have more than enough time to complete this assignment.

## Preamble

You can complete this assignment on either Linux or Mac OSX.

1. Your assignment **must** be pushed onto GitHub in order to be graded.
2. All work must be your own, and you may not share your code with anybody else -- in the class or out.
3. There are plenty of resources both on the course website and related git repositories, as well as all over the internet.  If you find a solution or snag code from an online resource, just cite where it came from.  All students must adhere to the Cornell [code of Academic Integrity](http://cuinfo.cornell.edu/aic.cfm).
4. **ANY** extra files on your GitHub `assignments` repository will be penalized.


## Submission Overview

This assignment will be iteratively changing **this README**.  If you view the source of this file, at the end you will see a couple of

```html
<!--MARKER::N-->
```

It is **VERY** important that you do not modify this file at all.  These markers are for the script I have written, and will be replaced **by the script** with subsequent instructions as you continue.

1. If you remove or change these markers, then the scripts I have written will think that you have already received the directions.
2. So, obviously, if you haven't received directions because you changed the file then you will not know what to do.

I will include a tree view here, but **do not** attempt to create the folders or files in this tree.  This will prevent you from moving forward, and my script will get mad at you.

```bash
a3/
    - README.md # This file: Tasks 1 and 4
    #
    # These wil be created for you by my script:
    #
    - TASK_2/
        - coin_gen.sh
    - TASK_3/
        - wallet_value.sh
        - small.wallet
```

## Completing this Assignment

Just as paying attention to what your package manger tells you when installing things, it is very important that you read the terminal output of the script as it executes.  It will provide you with commands you need to execute, and you will not be able to move forward without them.

In some instances, failure to follow the directions of the script may very well corrupt your repository.  Not to fear -- you know how to fix all of that!  But as long as you just follow the directions you will not have any problems.

## Suggested Work Flow

You will be developing both on your local machine and on `CSUG`.  Some parts of the assignment can *only* be completed on `CSUG`.  Some parts you will be able to develop on your local machine, but only after you `git push` from `CSUG` and subsequently `git pull` to your local machine.  Of course, you could also complete the entire assignment on `CSUG` and get some real hands-on `vim` experience!

### Recipe for Success

The script will be adding instructions to the `a3/README.md` as you continue forward.  While you could read the file on `CSUG`, Markdown needs to be rendered and you will therefore need to `git push` when the script tells you there are new changes to the `README` so that you can view the `README` in your browser on your local machine.

You will therefore need to go back and forth between your terminal and your browser.  Two options that are easy to switch back and forth are:

1. Terminal maximized to the left half of your screen, browser maximized to the right half \(or vice-versa\).
2. Terminal full-screen in one workspace, browser open in a workspace that you can switch to quickly \(my preference\).
    - This way when you want to view a `vimdiff` your terminal is already full screen.

As stated above, my scripts will be modifying this file directly.  I will go as far as to make the changes and `commit` them for you from `CSUG`, but I will not `push` the changes.

If the updates are not showing up on your browser, there are a couple of things you should check:

- View the `git log` of your repository.  It will be obvious to you if there is a commit I generated.
- Commits are stored locally -- to get them online you will have to `git push`.  I will inform you when this needs to happen.
- You will need to refresh your browser to see the changes!  `ctrl+r` or `cmd+r` depending on your machine.

### Make `CSUG` Convenient

Recall that when you `ssh` into `CSUG`, you are logging into a completely different computer.  Any of the configurations you have in your *local* computer's `~/.bashrc` are irrelevant.  Aside from creating `alias`es e.g. for `ls`, you will be thankful if you have a good `vimrc` so that you can edit using `vim`.

I defer to the <a href="https://github.com/cs2043-sp16/simple-dotfiles" target="_blank">simple dotfiles</a> repository, but do be careful to not *overwrite* your `~/.bashrc` on `CSUG`.  You should select the coloring / `alias`es you want and paste them -- I reiterate that it is a good idea to make a backup of the various dotfiles on `CSUG` before you change them.

Similarly, none of your Git configurations exist on `CSUG` yet (unless you have already configured them).  The two most useful:

- The diff tool:

    ```bash
    >>> git config --global diff.tool vimdiff
    >>> git config --global alias.d difftool
    # now 'git d' aliases to 'git difftool'
    ```

- The merge tool:

    ```bash
    # http://www.rosipov.com/blog/use-vimdiff-as-git-mergetool/
    >>> git config merge.tool vimdiff
    >>> git config merge.conflictstyle diff3
    # http://stackoverflow.com/a/1251696/3814202
    >>> git config --global mergetool.keepBackup false
    ```

Remember that when in your terminal, you need to do `ctrl+shift+c` to copy, and `ctrl+shift+v` to paste (Mac is still `cmd+c/v`).

### Understand where you are!

This is not in the `simple-dotfiles` repository, but to further make it apparent where your terminal is controlling things you can change the `export PS1` part to now be:

```bash
if [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]; then
    export PS1="\[\033[36m\]\u\[\033[1;31m\]@\[\033[0;32m\]\h\[\033[m\]:\[\033[33m\]\w\[\033[m\]> "
else
    export PS1="\[\033[36m\]\u\[\033[1;31m\]\[\033[m\]:\[\033[33m\]\w\[\033[m\]> "
fi
```

If you prefer to use different colors, the important change here is I included `\u@\h` (`user@host`) among the ANSI coloring.  So when I log into `CSUG`, my prompt is now `sjm324@en-cs-uglab11`.

## Final Notice: Instant FAILURE of this Assignment

I have created a "playground" for you on `CSUG`.  If you just forget about / do not execute the `chmod` command, you will be perfectly OK.  However, if you `chmod` your personal folder such that `group` (me) cannot view the files, or any sub-directories or files, I will simply not grade your assignment and you will get a `0`.

To be clear, your final submission must also be online on GitHub to receive credit.  But I will also be monitoring the `CSUG` folders.  If your repository on `CSUG` is inaccessible, your assignment will not be graded.

Similarly, if you enable the `other` permissions on your `/courses/cs2043/netID` folder I will consider this a violation of academic integrity.

As long as `other` has `0` permissions on your specific folder (which they currently do), even if they know the path to your solution they will not be able to view it because they cannot execute your personal directory.  Likewise, even if there are permissions for `other` on files beneath your personal directory, it does not matter since `other` cannot enter your directory.

By default, when you create files or clone your repository it will enable `read` for `other`.  Do not worry about this, as these files will be protected since your `other` permissions are zero on `/courses/cs2043/you`.

To re-iterate: **do not execute the `chmod` command under the `/courses/cs2043` folder**.

You have been warned.

# Indiana Jones and the Repository of Doom

Annoyed that his father continues to call him junior, Indy decides that instead of counting to 20 in various languages he's going to go to make a startup geared toward providing children of overly-Scottish-and-always-with-a-glass-of-Scotch-in-their-hands parents with a *safe-zone* to escape to.  The goal of his startup is to enable his clients to actualize their everything, while secretly robbing them blind behind the scenes.  Indy is tired of having to battle snakes and rescue religious artifacts all of the time, just to come home to a past-due mortgage because he doesn't actually get paid anything.

Before he can start this world-class hacking institution, though, Indy needs to get some venture capital.  He is concerned that he will not be taken seriously in the computer world because he has an Archeology background, but knows of some charming Cornell students who may be able to help.  He offers you 50% of the profit-share and presents you with all the legal documents, as well as co-founder status and (after success), your own private office with a full-service bar and a rooftop pool.

## Task 1
### Venturing for Capitol

Indy is not a student and cannot get access to the servers he needs.  He also only knows how to type with his thumbs, but he views that as less of a priority than setting up the grand scandal.  He is deeply familiar with how legendary of a hacker you are, and pleads that you help him setup his con-job using `CSUG` as the alpha testing grounds.

You probably know this by now, but when you launch an executable with `./script_name.sh`, you do so because you need to provide a *path* the the executable.  The `.` says current directory, and `./script_name.sh` provides the path to the file `script_name.sh` in the current directory.  I have created an executable for you on `CSUG` that you can execute by running:

```bash
>>> /courses/cs2043/utils/doom
```

SSH into `CSUG` and execute the binary.  Refer to Lecture 16 for how to connect to `CSUG`.

1. Your username is your `netID`, and your password is the same password you use to log into `CMS` and `studentcenter`.
2. If you are not on campus, you will need to connect to the VPN: http://www.it.cornell.edu/services/vpn/howto/index.cfm

Once you have logged in and executed the above, the script will tell you what to do.  Remember that you can use the `up arrow` to cycle back to previous commands you have executed (e.g. you don't have to paste the above or type it every time, just hit the `up arrow` until you find that).

## Task 2
### Pseudo-money

Indy quickly realizes that you really are the super hacker he has been searching for.  With your skills, he won't even need real money.  He plans fool the markets with a new form of currency he calls the shiva-coin.  He explains that the plan is to market it as a "crypto"-currency that cannot be hacked by anybody.  The textual output of the shiva-coin will appear to be total nonsense to the average user, and so he will claim that it is the most ultra-unhackable currency there is (its the 40s, they won't be able to prove him wrong!).  For simplicity, he explains to the world (yes, Indy can address the world at large) that the new standard of money is to be regulated by him:

1. A coin is exactly 4 characters long.
2. Coins can only contain only contain alphanumeric characters (upper and lower case are allowed and distinct).
3. A wallet is a file with any number of coins in the range {1..4194304}, listed exactly one coin per line.

You have now received a new folder `TASK_2` with the file `coin_gen.sh` inside of it.  You can write the solution either on your local machine or on `CSUG`, noting that you will have to make sure that you `git pull` on your local machine to receive the updates I created for you on `CSUG`.  When you are finished with your solution on your local computer, you will need to `commit` and `push`, followed by a `pull` on `CSUG` in order to continue the assignment.

Hey!  Git repositories are pretty convenient for working remotely, huh?  No need to constantly `scp` files back and forth :)

Run the `doom` script after you have implemented this to get the next task.



## Task 3
### Proof of Concept
Thrilled that he now has a money-maker, Indy is ready to unleash his dominion upon the world.  But he needs to be able to demonstrate that the shiva-coins have value in some shape or form.  Being deeply familiar with a wide range of cultures, ancient and modern, Indy has come to the understanding that what people want more than anything is to have definitive feedback.  He will distribute a variety of wallets using the script you wrote previously to potential investors, but he needs another script to complete the deception.  The script is simple enough: given an input wallet, it should compute the "value" of that wallet printing out a single line that is the decimal value in shiva-coins that the wallet is worth.

He begs you to finish the script he began writing, as he is unable to figure out how to extract a single character from a string in `bash`.  Once it is finished, the investors will be thoroughly convinced and be willing to sink all of their funds into his company.  He explains to them that the amount of computational power required to generate and decrypt shiva-coins is extraordinary, and they will have to be brave enough to front the costs.  Every real dollar they invest now, though, will be exponentially more valuable in shiva-coins as the act of generating coins will become exponentially more challenging.  They really cannot afford to wait any longer!

You have now received a new folder `TASK_3` with the files `wallet_value.sh` and `small.wallet`.  Complete the implementation in `wallet_value.sh`.  The file `small.wallet` will allow you to test your results.  Your solution is correct if you get:

```bash
>>> ./wallet_value.sh small.wallet
92433580348
```

Recall that if you are working on your local computer you will need to `commit` and `push`, followed by a `pull` from `CSUG`.

Run the `doom` script after you have implemented this to get the next task.



## Task 4
### El Fin
Indy is thrilled with your brilliant work this semester, and is excited that you are now able to con even the most cunning of investors with your shiva-coins.  In addition to the rooftop pool, Indy decides that you will get a helicopter and a private jet, as well as a remote control quad-copter for you to fly while you are in your helicopter.

He rushes back to Sean Connery to brag about how successful he is, to which his father responds: "count to 22".

### Optional Feedback

I hope this short course has been educational as well as entertaining.  I put a lot of time into redesigning the material to hopefully provide you with the tools you may need in the future, as well as have a little fun along the way.

Your feedback would be greatly appreciated.

As a precursor, I would like to say that I am more than aware that one of the biggest problems with this semester was that I got behind in providing materials to you.  There was a large overhead in redoing the entire course, and it snowballed a bit.

While I wish that I had been able to prepare everything for you on time, that was not the case.  I welcome you expressing your opinion on this matter and anything else you would like to add.  Criticism is useful to help further shape the course, but even more valuable is a potential solution you think would work.

##### What did you like most about the course?

>
> 
>

##### What did you like least about the course?

>
> 
>

##### The original intent of lecture-demos at the end was mis-guided.  Feedback from the first assignment largely required making the lecture more interactive throughout.  Overall, did I meet my original goal of "learning-by-doing" in your opinion?  Why or why not?

>
> yes, through the assignment and demo we learn commands by using it. 
>

##### I introduced `forks` too early.  The goal was to give you a repository that you could `push` to *before* releasing the assignments repository.  I was thinking a better strategy would be to just release the assignments repository earlier, and give a "Push your name to this file" assignment.  Do you think this would be better?  Any other ideas?

>
> 
>

##### Was there a topic you wanted to see that was not covered?  If so, what was it?

>
> 
>

##### This is a really short, really fast-paced course.  That is largely out of my control in some senses.  But if something could be removed or reduced, what would you vote off the island?  `git` will never be voted off.

>
> 
>

##### There are many different places, unfortunately.  There is the `lecture-slides`, `lecture-demos`, and `you-assignments` repository.  There is also the course website (which stopped being updated after a while...), Piazza, and CMS.  Did I do a good job of explaining what was supposed to be where?  If you were confused, what would have made it clearer?

>
> it is good. 
>

##### Now that the materials are (almost) all finished, the amount of overhead in preparing the materials would not exist next year.  With this in mind, now that we are at the end of it, would you take this course again?  If no, what would change your mind?

>
> 
>

##### Did you have fun?!

>
> 
>

##### Anything else you would like to add?

>
> If you could create a cheatsheet of useful commands learnt from this course would be great. 
>



