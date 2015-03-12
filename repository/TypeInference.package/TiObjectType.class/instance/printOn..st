printing
printOn: aStream
	aStream 
		nextPut: $<;
		print: self exactClass.
	object notNil 
		ifTrue: [aStream nextPutAll: ' ?'].
	instVarTypes isEmptyOrNil
		ifFalse: [aStream space.
				1 to: instVarTypes size 
					do: [:i | aStream
								nextPutAll: (self instVarNames at: i); 
								nextPutAll: ': ';
								print: (instVarTypes at: i);
							 	space].
				aStream skip: -1].
	self printTypesOn: aStream.
	aStream nextPut: $>