# Task 1 Example Input and Output

Suppose I have the files `moria.txt` and `shire.txt` in the current directory with the following contents:

<table>
<th>moria.txt</th> <th>shire.txt</th>
<tr>

<td>
<pre>
The Doors of Durin, Lord of Moria.
Speak, friend, and enter.
I, Narvi, made them.
Celebrimbor of Hollin drew these signs.
</pre>
</td>

<td>
<pre>
Follow the East Road to Bywater,
And bask in the glory of Three Farthing Stone.
To venture past Pincup is to be in South Farthing.
Wherein?
Acquainted I became with sir Toby,
N'ere to forget his generous hospitality.
</pre>
</td>
</table>

Then the following series of events would take place, noting that after each execution I am going to `cat` out the two potential files to show the progression of events -- if nothing was in them, then `cat` will produce an error.  I will also `echo` the `exit` code of the script using `$?` (the `exit` status of the previous command executed in your shell).  These are by no means exhaustive tests, and you should test your script much more.

1. Run it on empty input.

  ```
  >>> ./collect_marbles.sh
  Ye shall not search for marbles if ye cannot find the key.
  >>> echo "$?"
  1
  >>> cat MARBLES.txt
  cat: MARBLES.txt: No such file or directory
  >>> cat FAILED.log
  cat: FAILED.log: No such file or directory
  ```

2. Parse just one file, grabbing all lines that have [1-4] words.

  ```
  >>> ./collect_marbles.sh 1 4 shire.txt
  >>> echo "$?"
  0
  >>> cat MARBLES.txt
  Wherein?
  >>> cat FAILED.log
  cat: FAILED.log: No such file or directory
  ```

3. Run it on two files, grabbing all lines that have [4-8] words.  Note that the `Wherein?` from the previous execution is still there.

  ```
  >>> ./collect_marbles.sh 4 8 shire.txt moria.txt
  >>> echo "$?"
  0
  >>> cat MARBLES.txt
  Wherein?
  Follow the East Road to Bywater,
  Acquainted I became with sir Toby,
  N'ere to forget his generous hospitality.
  The Doors of Durin, Lord of Moria.
  Speak, friend, and enter.
  I, Narvi, made them.
  Celebrimbor of Hollin drew these signs.
  >>> cat FAILED.log
  cat: FAILED.log: No such file or directory
  ```

4. Run it again, grabbing all lines that have [6-6] words (aka exactly 6).  There is no `isengard.txt` file in this directory.

  ```
  >>> ./collect_marbles.sh 6 6 shire.txt moria.txt isengard.txt
  >>> echo "$?"
  0
  >>> cat MARBLES.txt
  Wherein?
  Follow the East Road to Bywater,
  Acquainted I became with sir Toby,
  N'ere to forget his generous hospitality.
  The Doors of Durin, Lord of Moria.
  Speak, friend, and enter.
  I, Narvi, made them.
  Celebrimbor of Hollin drew these signs.
  Follow the East Road to Bywater,
  Acquainted I became with sir Toby,
  N'ere to forget his generous hospitality.
  Celebrimbor of Hollin drew these signs.
  >>> cat FAILED.log
  isengard.txt
  ```

5. Run it again with a bunch of files that also do not exist.  `MARBLES.txt` remains the same, but `FAILED.log` now has `isengard.txt` as well as the invalid filenames we are calling it with this time.

  ```
  >>> ./collect_marbles.sh 1 111 a b c d e f g
  >>> echo "$?"
  0
  >>> cat MARBLES.txt
  Wherein?
  Follow the East Road to Bywater,
  Acquainted I became with sir Toby,
  N'ere to forget his generous hospitality.
  The Doors of Durin, Lord of Moria.
  Speak, friend, and enter.
  I, Narvi, made them.
  Celebrimbor of Hollin drew these signs.
  Follow the East Road to Bywater,
  Acquainted I became with sir Toby,
  N'ere to forget his generous hospitality.
  Celebrimbor of Hollin drew these signs.
  >>> cat FAILED.log
  isengard.txt
  a
  b
  c
  d
  e
  f
  g
  ```
