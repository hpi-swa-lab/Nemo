I hold the union of all the AtomicTypes that I could be during an arbirtrary execution.
I am connected to others TypeVariables to which I will propagate all my atomic types. Therefore, every type that I hold will also be held by all the TypeVariables to which I am connect.
My basic protocol is TypeVariable addAtomicType: and TypeVariable connectTo:

- atomicTypes is the Set with all the AtomicTypes.
- connections is the Set with the TypeVariables where I have to propagate my AtomicTypes.

We have associated a TypeVariable to every ParseNode. Thus, each ParseNode comes to life with a TypeVariable that has to be connected to others TypeVariables (see MethodNode connectTypeVariables).

Note: Ole terminology for connections is "constraints".

