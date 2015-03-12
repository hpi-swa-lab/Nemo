*TypeInference
allPrimitiveMessages
	"Answer an OrderedCollection of all the methods that are implemented by 
	primitives."

	| aColl method primitive | 
	aColl := Dictionary new.
	Cursor execute showWhile: 
		[self allBehaviorsDo: 
			[:class | class selectorsDo: 
				[:sel | 
				method := class compiledMethodAt: sel.
				primitive := method primitive.
				(primitive > 0 and: [(primitive between: 255 and: 519) not])
					ifTrue: [(aColl at: primitive ifAbsentPut: [OrderedCollection new])
								add: (class name , ' ' , sel)]]]].
	^aColl