1. What is it?

This project is like a magic backpack for your computer.

You put your toys (files/folders) inside.

It closes with today’s date written on it (so you know when you packed it).

Later, if you lose your toy, you can unzip the backpack and get it back.

So: Backup = pack things up safely.
Restore = unpack when you need them.

2. How do we do it?

We’ll write a Bash script that:

Asks you what folder you want to back up.

Packs it into a .tar.gz file with today’s date in the name.
Example: backup-2025-08-29.tar.gz

Saves that backpack in a backups/ folder.

Lets you restore by asking which backup file you want to unpack.

3. Why is this useful?

Computers break, people delete files, accidents happen. 😅

With backups, you don’t panic—you just restore yesterday’s copy.

Plus, it’s a skill companies actually use: automated backups keep websites and data safe.