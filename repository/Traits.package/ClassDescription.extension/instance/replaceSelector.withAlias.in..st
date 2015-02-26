*Traits-NanoKernel
replaceSelector: originalSelector withAlias: aliasSelector in: source
	"replaces originalSelector with aliasSelector in in given source code"
	| oldKeywords newKeywords args selectorWithArgs s |
	oldKeywords := originalSelector keywords.
	newKeywords := aliasSelector keywords.
	oldKeywords size = newKeywords size ifFalse:[self error: 'Keyword mismatch'].
	args := self newParser parseParameterNames: source asString.
	selectorWithArgs := String streamContents: [:stream |
		newKeywords keysAndValuesDo: [:index :keyword |
			stream nextPutAll: keyword.
			stream space.
			args size >= index ifTrue: [
				stream nextPutAll: (args at: index); space]]].
	s := source asString readStream.
	oldKeywords do: [ :each | s match: each ].
	args isEmpty ifFalse: [ s match: args last ].
	^selectorWithArgs withBlanksTrimmed asText , s upToEnd
