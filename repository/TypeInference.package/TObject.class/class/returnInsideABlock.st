blocks
returnInsideABlock
	"
	TObject new returnInsideABlock
	"
	^ self randomBoolean
		ifTrue: [1] 
		ifFalse: [true]