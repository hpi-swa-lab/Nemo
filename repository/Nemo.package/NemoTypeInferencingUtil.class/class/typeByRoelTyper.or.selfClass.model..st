type inferencing
typeByRoelTyper: aProgramNode or: aString selfClass: aSelfClass model: aModel
	| typesDict variableName extractedType commonSuperClass |
	aSelfClass ifNil: [ ^ nil ].
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
	extractedType ifNotNil: [ commonSuperClass :=  (NemoClassUtil commonSuperClassOf: extractedType types) ].
	commonSuperClass ifNil: [ ^ nil ].
	commonSuperClass = Object ifTrue: [ ^ nil ].
	^ BPGuessedType
				type: commonSuperClass
				guessedFrom: #roelTyper.