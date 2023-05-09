# The Task class

We weren't keeping track of the return values of tasks. This is important to make
our API complete and get the return value of a task. To fix this problem, we
add another level of indirection.

> All problems in computer science can be solved by another level of indirection.

We build a `Task` wrapper for our coroutines. This will have add two things on top of coroutines:
- a `.status` attribute which can be `None`, `queued`, `running`, or `finished`.
- a `.value` attribute which will store its return value

`task.value` is only vaild when `task.status` is `"finished"`. We make sure of this with the
`.get_value()` method.

The scheduler will be responsible for setting `.status` and `.value`.

```python
class Task:
    def __init__(self, coro, status=None):
        self.coro = coro
        self.status = status
        self.value = None

    def get_value(self):
        if self.status == "finished":
            return self.value
        raise Exception("Task has not finished")
```

