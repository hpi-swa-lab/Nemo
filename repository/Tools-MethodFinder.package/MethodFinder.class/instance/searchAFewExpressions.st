search
searchAFewExpressions
	"Return just expressions, such as 'data1 + data2'.  Stop after the first premutation of args that gives an answer, usually just one expression.  Sort them."

	resultsList := OrderedCollection new.
	self search: false.	"non-multi"
	^ self sortedExpressions asArray		