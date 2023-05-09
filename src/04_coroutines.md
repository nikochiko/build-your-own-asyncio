# Coroutines

Coroutines are functions that can be paused and resumed. Generators do just that.

>  `yield` keyword is named such because the function *yields* control of the CPU. This control is given back to
> the caller of the generator.

All Python generators have a `.send()` method. In addition to continuing the generator like `next()` does, this
method accepts an argument that is sent to the generator. This value can be accessed as the returned value
of an `yield` statement.

We can build a worker that computes the square of its input.

```python
def square(x):
    return x * x

def get_worker():
    x = yield
    while True:
        x = yield square(x)

def main():
    worker = get_worker()
    worker.send(None)  # "prime" the coroutine
    tasks = [1, 2, 3, 4, 5]
    for task in tasks:
        result = worker.send(task)
        print(f"square({task}) = {result}")

main()
```

Output

```
square(1) = 1
square(2) = 4
square(3) = 9
square(4) = 16
square(5) = 25
```
