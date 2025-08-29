What we’re making 🛠

A Todo List Manager in Bash — you’ll be able to:

Add a task

List all tasks

Remove a task

Clear the whole list

Show a help menu

This is small but already feels like a real tool.

How we’ll build it ⚙️

Decide a storage file → let’s call it tasks.txt.

Use functions → one for each action (add_task, list_tasks, etc.).

Parse arguments → example:

./todo.sh add "Buy milk"

./todo.sh list

./todo.sh remove 2

Add color output for fun (✅ green for success, ❌ red for errors).

Why this is useful 💡

You’ll learn argument parsing in Bash (super important for CLI tools).

You’ll see how functions keep code organized.

And you’ll actually have a mini app you can use daily.