I am an implementation type as described in TiNode class typeClasification


3.1.2 Types
Object types are analogous to, but more general than, classes in a class-based language such as Smalltalk. In Smalltalk, each object is an instance of (or “has”) exactly one class; in Self, each object belongs to (or “has”) exactly one object type. In Smalltalk, knowing an object’s class reveals the structure of the object
 (how it is laid out in memory, how many instance variables it has, etc.)

; in Self, knowing an object’s object type reveals a set of (similar) possible structures, one for each initial object in the corresponding group. We are now, finally, ready to define what a type is:
