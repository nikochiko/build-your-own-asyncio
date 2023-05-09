> # Aside: Compatibility with asyncio
> 
> The code that we wrote is not a metaphor for what asyncio does. It is exactly what how asyncio works.
> We need to only wrap our coroutines in an `asyncio.coroutine` decorator to make it work with `async/await`.
> 
> ````python
> import asyncio
> 
> @asyncio.coroutine
> def number_to_tamil(x):
>     ...
> 
> @asyncio.coroutine
> def number_to_english(x):
>     ...
> 
> async def main():
>     for x in range(1, 4):
>         tamil_word = await number_to_tamil(x)
>         english_word = await number_to_english(x)
> 
>         print(f"{x} in Tamil is {tamil_word}")
>         print(f"{x} in English is {english_word}")
> 
> asyncio.run(main())
> ````
> 
> Output:
> 
> ````
> 1 in Tamil is onnu
> 1 in English is one
> 2 in Tamil is rendu
> 2 in English is two
> 3 in Tamil is moonu
> 3 in English is three
> ````
> 
> This is still sequential, because we are waiting for `number_to_tamil(x)` to return
> before we start executing `number_to_english(x)`. We can change that by converting
> each coroutine to a task.
> 
> While the `await coro` statement will add coro to the queue and also yield, `asyncio.create_task(coro)`
> will only add the coroutine as a task to the queue, without yielding control. That's why we can keep
> adding more tasks until we call an `await` on something.
> 
> But to see this in action, we will need to modify our code slightly to `print` values as soon as they are
> computed. Let's add this logic in a new coroutine we'll call `translate`.
> 
> ````python
> import asyncio
> import random
> 
> ...
> 
> async def translate(language, number):
>     match language:
>         case "English":
>             result = await number_to_english(number)
>         case "Tamil":
>             result = await number_to_tamil(number)
>         case _:
>             raise ValueError(f"Language {language} is not supported")
> 
>     print(f"{number} in {language} is {result}")
> ````
> 
> Now let's modify our `main()` coroutine to use this.
> 
> ````python
> async def main():
>     for x in range(1, 4):
>         tamil_task = asyncio.create_task(translate("Tamil", x))
>         english_task = asyncio.create_task(translate("English", x))
> 
>         # wait for both tasks to finish
>         await tamil_task
>         await english_task
> 
> asyncio.run(main())
> ````
> 
> Output
> 
> ````
> 1 in Tamil is onnu
> 1 in English is one
> 2 in English is two
> 2 in Tamil is rendu
> 3 in English is three
> 3 in Tamil is moonu
> ````

