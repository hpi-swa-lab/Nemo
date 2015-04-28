as yet unclassified
selectTextInUsageMorph: aString

	| lastSpacePosition |
	lastSpacePosition := (aString lastSpacePosition) - 1.
	lastSpacePosition < 1 ifTrue: [ lastSpacePosition := aString size ].
	self codeUsageMorph codeMorph handleEdit: 
		[ self codeUsageMorph highlightFragment: (aString copyFrom: 1 to: lastSpacePosition).]