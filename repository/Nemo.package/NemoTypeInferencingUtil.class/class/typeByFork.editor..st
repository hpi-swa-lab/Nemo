type inferencing
typeByFork: aProgramNode editor: anEditor

	aProgramNode ifNil: [ ^ nil ].
	^ OSProcess isUnix
		ifTrue: [ | remoteResultClassName |
			remoteResultClassName := (anEditor model isKindOf: NemoDebugger)
				ifTrue: [
					NemoRemoteMethodEvaluator
						evaluateTypeForked: aProgramNode formattedCode
						notifying: anEditor
						context: anEditor model doItContext
						receiver: anEditor model doItReceiver ]
				ifFalse: [
					NemoRemoteMethodEvaluator
						evaluateTypeForked: aProgramNode formattedCode
						notifying: anEditor ].
			remoteResultClassName ifNotNil: [
				BPGuessedType
					type: (Smalltalk at: remoteResultClassName ifAbsent: [ ^ nil ])
					guessedFrom: #methodReturnType ] ]
		ifFalse: []