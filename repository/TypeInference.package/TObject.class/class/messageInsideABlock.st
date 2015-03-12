blocks
messageInsideABlock
	"
	TObject new messageInsideABlock
	"
	^ self randomBoolean ifTrue: [
		self returnOne
	] ifFalse: [
		self returnTrue
	].