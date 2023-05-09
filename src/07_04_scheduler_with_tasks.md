# Scheduler with support for tasks

Change scheduler to work with tasks instead of coroutines:

```python
class Scheduler:
    def __init__(self):
        self.task_q = queue.Queue()

    def add_task(self, task):
        assert isinstance(task, Task), "task must be an instance of Task"

        task.status = "queued"
        self.task_q.put(task)

    def run(self):
        while not self.task_q.empty():
            task = self.task_q.get()
            task.status = "running"
            try:
                task.coro.send(None)
            except StopIteration as e:
                task.value = e.value
                task.status = "finished"
            else:
                self.task_q.put(task)
                task.status = "queued"
```

