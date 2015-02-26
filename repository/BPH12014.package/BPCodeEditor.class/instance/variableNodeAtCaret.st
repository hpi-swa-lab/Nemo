as yet unclassified
variableNodeAtCaret
	| result |
	result := self nodeAtCaret.
	result isVariable ifTrue: [^ result ].
	^ nil