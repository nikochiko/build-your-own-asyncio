# Scheduling all tasks at once

We can also add all the tasks first, and then run all the tasks at once:

```python
def main():
    scheduler = Scheduler()
    for x in range(1, 4):
        scheduler.add_task(translate("Tamil", x))
        scheduler.add_task(translate("English", x))
    scheduler.run()

main()
```

Output (order may vary):

```
3 in English is three
1 in Tamil is onnu
1 in English is one
2 in Tamil is rendu
2 in English is two
3 in Tamil is moonu
```

We have built a scheduler that runs concurrently!
