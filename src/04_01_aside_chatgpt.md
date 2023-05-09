> ## Aside: A real-world example
> 
> I used this pattern recently to build a ChatGPT chatbot that takes prompts from my terminal.
> 
> ````python
> import openai
> 
> # configure openai
> openai.organization = ...
> openai.api_key = ...
> 
> def get_chatgpt():
>     messages = []
>     user_input = yield
>     while True:
>         messages.append({"role": "user", "message": user_input})
>         response = openai.ChatCompletion.create(messages=messages)
>         chatgpt_message = response["choices"][0]["message"]  # chatgpt api detail
>         messages.append({"role": "assistant", "message": chatgpt_message})
>         user_input = yield chatgpt_message
> 
> def main():
>     chatgpt = get_chatgpt()
>     chatgpt.send(None)
> 
>     while True:
>         # user_input need not come from "input()" only.
>         # for example, it could be over a websocket connection
>         user_input = input("Prompt:")
>         result = chatgpt.send(user_input)
>         print("ChatGPT says:", result)
> ````

