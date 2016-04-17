# Task 2 Example Input and Output

Task 1 Example Input and Ouput showed how to check if your exit codes are correct.  I will only show you a couple of examples that have valid input / output.

Suppose I have the file `stolen_crops.csv` in this directory:

```
5403,1631,597,8855,5524
7280,6705,2807,1733,9588
3199,1800,1182,7064,405
763,8128,6600,6321,1436
```

Then the following events would take place:

##### Addition with just two columns

```bash
>>> ./merry_math.sh stolen_crops.csv add 2 4
```

would produce the file `RESULTS.txt`, with contents

```
10486
8438
8864
14449
```

##### Subtraction of multiple columns

```bash
>>> ./merry_math.sh stolen_crops.csv sub 5 3 1
```

would produce the file `RESULTS.txt`, with contents

```
-476
-499
-3976
-5927
```

##### Multiplication of multiple columns

```bash
>>> ./merry_math.sh stolen_crops.csv mul 1 3 5 2 3
```

would produce the file `RESULTS.txt`, with contents

```
17349671679963588
3687593256674308800
3258192363804000
387927478794240000
```

##### Division of two columns

```bash
>>> ./merry_math.sh stolen_crops.csv div 1 2
```

would produce the file `RESULTS.txt`, with contents

```
3
1
1
0
```

Notice that this is integer division, since `bash` does not do floating point arithmetic.  Be careful when designing your other test cases that you don't confuse yourself!
