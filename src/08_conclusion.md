# Conclusion

We looked at how to build coroutines, how they can be run concurrently, and how tasks can wait for other tasks to complete.

To get the most out of this, we need to be able to actually perform I/O asynchronously. This can be done purely in Python
with the [`selectors`](https://docs.python.org/3/library/selectors.html#examples) module. This is out of scope for this
blog.

Programming language-level support for lightweight threads has a lot of benefits to offer. Besides better performance on
blocking I/O, it simplifies writing concurrent code which is notoriously hard to write correctly and debug.
Coroutines need not run on a single OS thread. In other languages like Go and OCaml, they can and do run on multiple OS
threads as well.
