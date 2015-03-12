documentation
openQuestions
"
[] primitive perform
	- When analyzing a primitive you only have the types of the arguments (including the receiver). In this case one of them will be a <Symbol>. But to do the method lookup, the value of the symbol would be needed. One first idea is to make the value part of the type (ie, the type of #hello would be <Symbol #hello>).

[] Type of OrderedCollection
	((OrderedCollection new add: 1; add: #two; yourself)
		type instVarTypeAt: #array) allTypes  
	-> Set (<UndefinedObject> <SmallInteger> <Symbol> )
	
	Note <UndefinedObject>. It is there because the array used by the collection efectively has nil. I would like to see that the type of the OrderedCollection were <OrderedCollection (<SmallInteger> <Symbol>)>. But to achieve this, I think that the programmer would need to help the TI Engine.

	Array new: 5

	- El analisis de Array new: 5 cae en Behavior new: que analiza el mensaje isVariable. Este analiza el mensaje instSpec que hace operaciones de bitShift:. Al final se termina llamando a highbit que tiene un chequeo y mensaje de error si se aplica sobre un numero negativo.

"