blocks fundamentals
evaluateInsideBlock: aPoint
	"
	TPoint new evaluateInsideBlock: 3
	"
	false ifTrue: [^ aPoint x].
	^ #horse


