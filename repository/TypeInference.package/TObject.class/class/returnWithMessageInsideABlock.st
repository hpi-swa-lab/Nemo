blocks
returnWithMessageInsideABlock
	"
	TObject returnWithMessageInsideABlock
	"
	^ self randomBoolean 	ifTrue: [
			self returnOne
		] ifFalse: [
			self returnTrue
		].