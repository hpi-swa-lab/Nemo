as yet unclassified
methodFinderResults

	| parts mfResults results stringParts |
	stringParts := (self currentLine splitBy: ' ')
		select: [ :part | part notEmpty ].
	parts := stringParts collect: [ :part | [Compiler evaluate: part] ifError: [ ^ {} ]].
	results := OrderedCollection new.
	mfResults := MethodFinder new
		load: { parts allButLast asArray. parts last };
		findMessage .
	^ mfResults collect: [ :resultString | | newExp |
		newExp := resultString.
		1 to: parts size do: [:i | newExp := newExp copyReplaceAll: 'data' , i with: ((parts collect: [:x| x asString]) at: i) ].
		newExp. ]		