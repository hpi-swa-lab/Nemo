type inferencing
typeByFork: aProgramNode editor: anEditor
	"1 halt."
	"^ (self typeByNodeRecursive: aProgramNode model: aModel) ifNotNil: [ :returnValue |
		BPGuessedType
			type: returnValue class
			guessedFrom: #methodReturnType ]"
	aProgramNode ifNil: [ ^ nil ].
	^ OSProcess isUnix
		ifTrue: [
			( NemoRemoteMethodEvaluator evaluateTypeForked:" Compiler evaluate: "aProgramNode formattedCode notifying: anEditor) ifNotNil: [ :returnValue |
				BPGuessedType
					type: (Smalltalk at: returnValue)
					guessedFrom: #methodReturnType ] ]
		ifFalse: []