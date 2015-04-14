as yet unclassified
methodFinderResults

	| parts mfResults results stringParts |
	stringParts := (self currentLine splitBy: ' ')
		select: [ :part | part notEmpty ].
	parts := stringParts
		collect: [ :part | Compiler evaluate: part. ].
	results := OrderedCollection new.
	mfResults := [ MethodFinder new
		load: { (parts copyWithout: parts last). parts last };
		findMessage ] ifError: [ {} ].
	^ mfResults collect: [ :resultString | | newExp |
		newExp := resultString.
		1 to: stringParts size do: [:i | newExp := newExp copyReplaceAll: 'data' , i with: (stringParts at: i) ].
		newExp. ]		