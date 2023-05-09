# Running coroutines concurrently

Let's spice up `do_io_work()` a bit to give it the uncertainty of real-world I/O operations.
Instead of letting it be a normal function, we'll have it be a generator itself, which
`yield`s a random number of times.

```python
import random

def do_io_work():
    # yield a random number of times
    for i in range(random.randint(1, 5)):
        yield
```

We will have to use `yield from` now, when we call this.

```python
yield from do_io_work()
```

It propagates all the yields from it to the caller.

> `yield from coro` is equivalent to `for x in coro: yield x`
