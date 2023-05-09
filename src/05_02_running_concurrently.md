# The `main()` function

We'll hook all three up in our `main()` function, to `print` the English
and Tamil translations of numbers from 1 to 3.

```python
def main():
    for x in range(1, 4):
        tamil_coro, english_coro = number_to_tamil(x), number_to_english(x)
        tamil_word, english_word = None, None
        while True:
            if tamil_word is not None and english_word is not None:
                break

            if tamil_word is None:
                try:
                    tamil_coro.send(None)
                except StopIteration as e:
                    tamil_word = e.value
                    print(f"{x} in Tamil is {tamil_word}")

            if english_word is None:
                try:
                    english_coro.send(None)
                except StopIteration as e:
                    english_word = e.value
                    print(f"{x} in English is {english_word}")

main()
```

Output (could have a different order):

```
1 in English is one
1 in Tamil is onnu
2 in Tamil is rendu
2 in English is two
3 in Tamil is moonu
3 in English is three
```

Notice the different order of English/Tamil translations in each iteration. We just ran two coroutines
asynchronously.
