as yet unclassified
selectTextInUsageMorph: aString

	| lastSpacePosition |
	lastSpacePosition := (aString lastSpacePosition) - 1.
	lastSpacePosition < 1 ifTrue: [ lastSpacePosition := aString size ].
	self codeUsageMorph codeMorph handleEdit: 
		[ self codeUsageMorph codeMorph editor
			abandonChangeText;
			resetState;
			setSearch: (aString copyFrom: 1 to: lastSpacePosition);
			againOrSame: true ]