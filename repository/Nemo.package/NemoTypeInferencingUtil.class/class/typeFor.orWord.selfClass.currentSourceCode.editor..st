api
typeFor: aProgramNode orWord: aString selfClass: aSelfClass currentSourceCode: aSourceCodeString editor: anEditor

	| strategies |
	strategies := {
		[ self typeByBinding: aString for: anEditor model ].
		[ self typeByGlobal: aString or: aProgramNode].
		[ self typeBySelf: aString or: aProgramNode selfClass: aSelfClass ].
		[ self typeBySelfClass: aProgramNode selfClass: aSelfClass ].
		[ self typeBySuper: aString or: aProgramNode selfClass: aSelfClass ].
		[ self typeFromLiteral: aProgramNode ].
		[ self typeByFork: aProgramNode editor: anEditor ].
		[ self typeByRoelTyper: aProgramNode or: aString selfClass: aSelfClass model: anEditor model ].
		[ self typeByScanningMessageCalls: (aProgramNode ifNotNil: [aProgramNode formattedCode]) on: aSourceCodeString ].
		[ self typeByNameFor: aString ] }.
	^ strategies
		detect: [ :strategy |
			strategy value ifNotNilDo: [ :foundType | ^ foundType ].
			false ]
		ifNone: [ ^ nil ].