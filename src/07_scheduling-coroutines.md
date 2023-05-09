# Scheduling coroutines

We saw a pattern when we were running the two coroutines concurrently.
We tried running the first one, tried running the second one, and returned
only when both had finished running. 

We can setup a scheduler and put in a queue to run tasks one by one.

```python
import queue

class Scheduler:
    def __init__(self):
        self.tasks = queue.Queue()

    def add_task(self, coro):
        self.tasks.push(coro)

    def run(self):
        while not queue.Empty():
            task = self.tasks.pop()
            try:
                task.send(None)
            except StopIteration:
                pass
            else:
                # task didn't raise StopIteration, push it back to queue
                self.tasks.pop(task)
```

Notice that we aren't storing the returned value anywhere. We'll come to it later.

