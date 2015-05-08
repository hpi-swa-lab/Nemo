type inferencing
typeByRoelTyper: aProgramNode or: aString selfClass: aSelfClass model: aModel
	| typesDict variableName extractedType |
	1 halt.
	variableName := aString.
	aProgramNode ifNotNil: [
		aProgramNode isVariable ifTrue: [ |  |
			variableName := aProgramNode token value ] ].
	typesDict := (TypeCollector typeTmpsIn: aSelfClass>>(aModel selectedMessageName) ofClass: aSelfClass).
	"dirty key detection, because it is an IdentityDictionary with strings as keys -.-"
	typesDict keys detect: [:key | key = variableName ]
		ifFound: [ :foundKey |
			extractedType := typesDict at: foundKey ifAbsent: [] ]
		ifNone: [
			(NemoClassUtil hasInstVar: variableName inClassOrSuperClasses: aSelfClass) ifTrue: 
				[ extractedType := (TypeCollector typeInstvar: variableName asSymbol ofClassWithLookup: aSelfClass) ] ].
	^ (extractedType notNil and: [ extractedType types first ~= Object ])
		ifTrue: [
			BPGuessedType
				type: extractedType types first
				guessedFrom: #roelTyper ]