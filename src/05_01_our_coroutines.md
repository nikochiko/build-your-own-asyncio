# Translating digits to Tamil and English

Let's use this in our `number_to_tamil` coroutine and the `number_to_english` coroutine.

```python
def number_to_tamil(x):
    yield from do_io_work()
    match x:
        case 1: return "onnu"
        case 2: return "rendu"
        case 3: return "moonu"
        case _: raise ValueError("x must be in [1,3]")

def number_to_english(x):
    yield from do_io_work()
    match x:
        case 1: return "one"
        case 2: return "two"
        case 3: return "three"
        case _: raise ValueError("x must be in [1,3]")
```
