as yet unclassified
typesForMethod: aMethodSymbol onClass: aClass atArgument: anInteger

	| types |
	types := (((self observations at: aClass ifAbsent: [^OrderedCollection new])
		at: aMethodSymbol ifAbsent: [^OrderedCollection new])
		at: anInteger ifAbsent: [^OrderedCollection new]).
	^(types collect: [ :type |
		type asString.
	]) asOrderedCollection.