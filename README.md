# Cornell CS 2043, Spring 2016
Personal Assignments Repository

## For you and you alone
This is your own personal and private git repository, where you will both receive and submit your assignments.  You are not allowed to enable anyone else to have access to this repository, and you should not try and gain access to any other students' repositories.

Neither the assignments nor the solutions (if provided) will ever be hosted publicly.  The TAs and I have put a lot of time into developing the materials for you, and we ask that you do not ever share this repository or its contens with anyone, ever.  Hosting this repository publicly, or any portion of it, is a violation of the [Cornell code of Academic Integrity](http://cuinfo.cornell.edu/aic.cfm).

## How do I know if I submitted?

If you pushed your changes, then you have submitted.  Basically, if you go to the folder *in your browser* where you are trying to verify if your work is online, if you see it then you have.  If it is not there, then you did not push your changes and we will not have access to grade it.


## Providing answers
We may require that you edit the `README.md` for a given assignment.  For example, if you are writing the solution to the first assignment, then you would be editing `a1/README.md`.  The locations where you need to include your answers will all start with `TODO` (so you can search for them).  In markdown, your answers will show up as comments.  To achieve this, lets walk through a simple example.

### Example question, and how to provide your answers

*The Example Question*: Include a sequence of commands to first print the current directory, and then print your name to the console.

What you will see in your browser is the following:

> TODO: Example
> 
> ```bash
> # Write the commands below
>
> ```

However, in the actual plain-text document it looks like this:

```
> TODO: Example
> 
> ```bash
> # Write the commands below
>
> ```
```

A comment in markdown is a line that starts with `>`, so you must make sure that your solutions all have a `>` before each line.  You must do this for blank lines as well.

The solution code is written in a "fenced code block", which starts with three back ticks (```), and ends with three back ticks as well.  Note that fenced code blocks can have the language specified, which I have already done for you: the language is `bash`.  So the solution to the example would look something like this in your browser:

> TODO: Example
> 
> ```bash
> # Write the commands below
> pwd
> echo "Stephen McDowell"
> ```

and the actual plain-text document will look like this

```
> TODO: Example
> 
> ```bash
> # Write the commands below
> pwd
> echo "Stephen McDowell"
> ```
```

## Writing your answers

To see your solutions rendered, you can commit your changes and push them.  When you go back to your repository on GitHub you will see the changes.  This can be rather tedious, and is a bad use of git.  I suggest you either install a markdown editor or simply search for "online markdown editor" to work on your answer in your browser.

Note that not all verions of Markdown are the same.  GitHub renders markdown one way, others render it another way.  This one is pretty good for how it will look on GitHub:

[https://jbt.github.io](https://jbt.github.io/markdown-editor/)

Simply open the document on your computer in a text editor, paste the portion of the document you are working on into the online markdown editor, and when you have the answer formatted correctly paste it back into the text editor.  Save the document on your computer, commit and push your changes and they should now show up on GitHub as well.
