tool building
openForClass: aClass andMethod: aSelector

	self initialize.
	^ SimpleMorphicToolBuilder new open: (BPCodeHolder for: aClass and: aSelector)