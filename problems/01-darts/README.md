## Darts

Write a program that calculates your score at darts.

Here's an example scorecard:

```
5
double 10
triple 20
25
double 17
50
```

The output after running your program over this input should be 194.

## Extensions

a) Raise a custom error if an invalid score appears. For example:

```
double 21
```

Valid scores are: 1 up to 20, 25 and 50.

You cannot double or triple on 25 or 50.

---

b) Calculate the remaining score from a number specified in the input:

```
STARTS AT 301
triple 20
triple 20
```

The output after running this input should be 181.

---

c) Deal with cases where the player went 'bust'. For example:

```
STARTS AT 100
triple 20
triple 20
10
```

The output after running this input should be 30.

The second triple 20 is not counted because the player dropped below 0.

---

d) Enforce that players must finish on a double. For example:

```
STARTS AT 40
double 20
```

The output from this should be 0.

If the player does not end on a double, treat this as 'bust'. For example:

```
STARTS AT 30
triple 10
12
```

The output from this should be 18.

---

e) Instead of calculating the remaining score, calculate the quickest way to finish the game.

Remember, they must finish on a double. For example:

```
STARTS AT 100
triple 19
```

The output to your program should be:

```
3
double 20
```

## Frequently Asked Questions

If you have any questions about the problem, put them here.
