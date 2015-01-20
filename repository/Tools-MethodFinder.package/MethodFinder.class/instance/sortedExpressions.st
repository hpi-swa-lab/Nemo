search
sortedExpressions
	"Return only the expressions, 'data1 + data2' sorted"

	resultsList size = 0 ifTrue: [^ #()].
	self sortResults.  	"resultsList is now sorted"
	^ resultsList collect: [:row | row second].
