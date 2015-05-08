api
typeFor: aProgramNode orWord: aString selfClass: aSelfClass currentSourceCode: aSourceCodeString model: aModel

	| strategies |
	strategies := {
		[ self typeByNode: aProgramNode model: aModel ].
		[ self typeByBinding: aString for: aModel ].
		[ self typeByGlobal: aString or: aProgramNode].
		[ self typeBySelf: aString or: aProgramNode selfClass: aSelfClass ].
		[ self typeBySelfClass: aProgramNode selfClass: aSelfClass ].
		[ self typeBySuper: aString or: aProgramNode selfClass: aSelfClass ].
		[ self typeFromLiteral: aProgramNode ].
		[ self typeByRoelTyper: aProgramNode or: aString selfClass: aSelfClass model: aModel ].
		[ self typeByScanningMessageCalls: (aProgramNode ifNotNil: [aProgramNode formattedCode]) on: aSourceCodeString ].
		[ self typeByNameFor: aString ] }.
	^ strategies
		detect: [ :strategy |
			strategy value ifNotNilDo: [ :foundType | ^ foundType ].
			false ]
		ifNone: [ ^ nil ].