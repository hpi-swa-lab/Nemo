search
searchForOne
	"Run a search.  Stop after the first premutation of args that gives an answer, usually just one expression. "

	
	resultsList := OrderedCollection new.
	self search: false.	"non-multi"
	^ resultsList
			