# Generators

Python has generators that can be created with the `yield` statement. They are commonly
used to build iterators of some sequence.

```python
def abc_generator():
    yield "a"
    yield "b"
    yield "c"

abc = abc_generator()
for letter in abc:
    print(letter)
```

Output:

```
a
b
c
```

You can also use generators to make infinite sequences, which you can stop when you want.

```python
def natural_numbers_generator():
    i = 1
    while True:
        yield i
        i = i + 1

natural_numbers = natural_numbers_generator()
print(next(natural_numbers))
print(next(natural_numbers))
print(next(natural_numbers))
```

Output:

```
1
2
3
```

You can similarly also build a Fibonacci sequence with this.

```python
def fib():
    a, b = 0, 1
    while 1:
        yield b
        a, b = b, a + b

# sequence: 1, 1, 2, 3, 5, ...
```

> Some time ago, [@anandology](https://anandology.com) had shown me a version of generators where he took infinite
> sequences one step further, adding specialised operations for them, and making Python evaluate lazily. The result
> is something very interesting, more like Haskell than Python. It is out of scope of this blog, but you can check
> it out in this [GitHub repository](https://github.com/anandology/python-magic-show#fun-with-infinite-sequences).

