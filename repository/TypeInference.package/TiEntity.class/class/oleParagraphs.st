documentation
oleParagraphs
"
Some paragraphs from [AGE/96]
3.1.3 Discussion
...
Object types are closed under cloning since they are unions of clone families. This property ensures finiteness of the domain of types, but also makes it impossible for the type inferencer to distinguish between two objects that are clones of each other. For example, if a rectangle with integer coordinates is cloned, and the clone’s coordinates are changed to be floats, then it appears to the type inferencer as if both rectangles may have either integer or float coordinates (since the type inferencer only infers one type for the entire rectangle clone family). Consequently, code with data polymorphism cannot be analyzed with maximal precision. We will discuss possible solutions to this problem in Section 4.3. These solutions involve splitting object types into a finite number of “refined object types” that can have differently-typed instance variables.
...

3.2.1.2 Templates 
...
Thus, a template is the network that the basic algorithm generates from a single method. Nodes that correspond to instance variables are not part of any template, since instance variables do not belong to any particular method (they still have a type, of course).
...

4.3.1 Extended Framework

To precisely analyze this program, the integer points should be kept separate from the float points to the largest degree possible (the separation may not be possible for all programs or everywhere in a given program, of course). This separation can be achieved by using more than one object type to describe the (infinite) collection of all points that may exist during all executions of the target program.

The original point object type, point, is split into three object types, point 1 , point 2 , and point 3 . For specificity, we denote the object types resulting from splitting refined object types.

We can now, finally, state precisely how splitting can improve precision of analysis of code with data polymorphism. By disjointness, assignments to the x coordinate in, say, point 2 cannot affect the type of x in point 3 . Thus, if the type-inference algorithm carefully splits point, it may be able to avoid mixing up integer and float points, and therefore infer more precise types for the methods that operate on only one kind of points.

Commonly, the splitting of object types is performed at the granularity of allocation points. Thus, two objects have the same refined object type if:
- They are cloned, perhaps indirectly, from members of the same group; and
- They are allocated at the same point in the program

Returning to the point example, if the target program clones point objects in two different places, the basic type-inference algorithm assigns them all the same object type, point, whereas an algorithm that uses allocation points to target data polymorphism assigns different object types to the objects created at these two places.

If splitting is based on a different property than allocation points, the type-inference algorithm must deal with objects that change object type. Upon cloning, new objects are initially mapped to the unrefined type. After flowing sufficiently far to be discerned, their object type must be switched to the appropriate refined object type. However, see Section 4.3.3 for a brief discussion of a more general class of type-inference algorithms that allow objects to change refined object types.)

4.3.3 Discussion

Even when object types are split, the members of a refined object type may still exhibit data polymorphism. Some data structures are truly polymorphic, and no amount of splitting can change this fact. For example, if a program uses a slot in a single object to sometimes hold smallInts and sometimes floats, splitting cannot prevent accesses to this slot from seeing both smallInt and float as possible results. However, flow-sensitive analysis, the topic of Section 4.5, may improve precision in this case by allowing slots to have different types at different points in the target program. More specifically, flow-sensitive analysis tracks the flow of control from assignments to reads of slots, attempting to eliminate certain object types from the types of slots when control-flow properties make it impossible for them to reach specific reads.


4.5 Flow-sensitive analysis of variable access

Luego leyendo la seccion 4.5, podemos ver que al incorporar los estados a las variables estamos implementando la tecnica SSA (4.5.3) para el control de flujo aunque habria que leerlo mas detenidamente.

How does SSA transformation improve precision of type inference? The untransformed method in Figure 46 contains three expressions that read the variable x and three assignments to x (counting the initializer as an assignment). The type inferred for all the reads is {nil, smallInt, float}, since at different points during the execution of the method, the variable x may contain nil, a smallInt, or a float. In this case, eliminating dead initializers does not improve the type of the reads, since x is read before the first assignment (at best, we could have hoped for the elimination of the nil initializer). In the SSA-transformed method, there are instead three different variables, x 0 , x 1 and x 2 (each assign-ment “introduces” a new x variable), and the three expressions that used to read x now read x 0 , x 1 , and x 2 . Consider x 1 for a moment. Initially, it contains nil, but later a smallInt is assigned to it by x 1 : 4. The type of the variable x 1 is therefore {nil, smallInt}. Moreover, x 1 has a dead initializer, so after elimination of the initializer, the inferred type improves further to {smallInt}. Thus, while the inferencer was unable to infer a better type than {nil, smallInt, float} for the second read of x in straight, it could infer the precise type {smallInt} for the corresponding read of x 1 in straight_ssa. Table 20 shows how the types of all the variables improve in the SSA-transformed version of straight. In the following, we assume that the SSA transformation is always followed by dead initializer elimination to fully realize the benefits.


	straight = (
		|x<-nil|
		x printLine.
		x: 4.
		x printLine.
		x: 5.5.
		x printLine.
		self.
	).

	straight-ssa = (
		|x 0 <-nil. x 1 . x 2 |
		x 0 printLine.
		x 1 : 4.
		x 1 printLine.
		x 2 : 5.5.
		x 2 printLine.
		self.
	).
"
