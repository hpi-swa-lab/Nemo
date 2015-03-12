documentation
toDo
"
[] Convert the home references of a block into arguments
	TObject new assignementInsideBlock
			-> return {<String>}
			should return {<Float> <String>}
	TObject new returnWithMessageInsideABlock
			-> return {}
			should return {<SmallInteger> <True>} (as in TObject new returnInsideABlock)

[] Some primitives
	If you look at TiPrimitive you will find all the primitives implemented. If you try to analyze some code that reaches any other primitive, you will get an error message indicating the name of the missing primitive.
	1.0 + 1.0 
	will indicate that primitiveFloatAdd is not yet implemented.
	primitivePerform represents a challenge since the value of symbol (used to find the method) is lost with the type. 

[] Recursion avoidance
	Up to know, we are able to identify when recursion is happening. Some thought is requiered to infer the correct type in those cases.	Analyze the following:
	TObject new infiniteRecursion
	TObject new intermediateRecursion

[] Handling WillNotUnderstand
	If you analyze TObject new fooBar, you wil get a walkback indicating that TObject will not understand #fooBar. A special type should be created to keep track of this error.

[] CascadeNode and BraceNode
	TObject new cascadeMessage
	TObject new returnBracedArray
	will both bring up a walkback indicating that it is not yet implemented. Should be easy to do so....


"