# Running the scheduler

```python
def main():
    scheduler = Scheduler()

    for x in [12, 133, 120]:
        task1 = Task(translate_big_number("English", x))
        task2 = Task(translate_big_number("Tamil", x))

        scheduler.add_task(task1)
        scheduler.add_task(task2)
        scheduler.run()

        print(f"{x} in English is {task1.value}")
        print(f"{x} in Tamil is {task2.value}")
```

Output:

```
12 in English is one two
12 in Tamil is onnu rendu
133 in English is one three three
133 in Tamil is onnu moonu moonu
121 in English is one two one
121 in Tamil is onnu rendu onnu
```

