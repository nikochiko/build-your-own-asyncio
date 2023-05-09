# Translating big numbers

Let's see this working in an example:

```python
def translate_big_number(language, n):
    match language:
        case "English":
            translator = number_to_english
        case "Tamil":
            translator = number_to_tamil
        case _:
            raise ValueError(f"Language {language} is unsupported")

    digits = [int(d) for d in str(n)]
    result = ""
    for digit in digits:
        result += yield from translator(digit)
        result += " "

    return result
```

We added a new function `translate_big_number`, which translates a number with multiple digits.

