# Concurrency in a single thread

Traditionally, concurrency has been a responsibility handed down to the operating system.
A single process can create multiple threads and the OS will run these threads across
its (multiple) cores as it sees fit. It will interrupt a running thread, store its state,
and load another previously interrupted thread for the computer to work on.

It's often not worth doing this. Moreover, writing correct multi-threaded programs is quite
hard as data races and deadlocks are easy to miss. We can solve this problem by adding
another level of indirection.

