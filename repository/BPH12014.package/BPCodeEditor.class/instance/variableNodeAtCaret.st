as yet unclassified
variableNodeAtCaret
	| result |
	result := self nodeAtCaret.
	Transcript show: result; cr.
	result isVariable ifTrue: [^ result ].
	^ nil