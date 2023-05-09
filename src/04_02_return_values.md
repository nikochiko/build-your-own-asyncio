## Coroutines with return values

Coroutines (and generators) can return values too. This value can be accessed with
the `.value` attribute of the `StopIteration` exception that is raised when the
coroutine completes (the function returns).

We have two methods that translate a number to either its English word or its Tamil
word. There is `do_io_work()` at the start where this coroutine yields.

```python
def number_to_tamil(x):
    yield do_io_work()
    match x:
        case 1: return "onnu"
        case 2: return "rendu"
        case 3: return "moonu"
        case _: raise ValueError("x must be in [1,3]")
```

We can get the return value of each like this:

```python
tamil = number_to_tamil(1)
tamil.send(None)  # "prime" the coroutine

try:
    while True:
        tamil.send(None)
except StopIteration as e:
    print("1 in Tamil is", e.value)
```

Output:

```
1 in Tamil is onnu
```

