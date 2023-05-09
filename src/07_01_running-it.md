# Running the scheduler

For now, we will have to `print` the results of the `number_to_tamil`
and `number_to_english` coroutines as soon as they are returned.

We'll create a new `translate` function to do this.

```python
def translate(language, number):
    match language:
        case "English":
            result = yield from number_to_english(number)
        case "Tamil":
            result = yield from number_to_tamil(number)
        case _:
            raise ValueError(f"Language {language} is not supported")

    print(f"{number} in {language} is {result}")
```

Notice how the `yield from` syntax makes the code a lot more straightforward.

Let's use this in `main()` now.

```python
def main():
    scheduler = Scheduler()
    for x in range(1, 4):
        scheduler.add_task(translate("Tamil", x))
        scheduler.add_task(translate("English", x))
        scheduler.run()

main()
```
