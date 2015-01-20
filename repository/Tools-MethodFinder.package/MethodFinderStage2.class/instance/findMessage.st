as yet unclassified
findMessage
	"Control the search."

	resultsList := OrderedCollection new.
	expressions _ OrderedCollection new.
	self search: false.	"just one.  multi"
	"Don't call MethodFinderStage2 to try harder if this fails."
	resultsList isEmpty ifTrue: [^ OrderedCollection with: { nil.  'no single method does that function'.  #() }].
	"expressions isString ifTrue: [^ OrderedCollection with: expressions]."
 	^ resultsList