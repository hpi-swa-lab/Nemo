*TypeInference
analyze: textOrStream in: aContext to: receiver notifying: aRequestor ifFail: failBlock
	"same as Compiler evaluate:in:to:notifying:ifFail: but analyzing the method node for type inference"

	| theClass methodNode analyzedMethod |
	theClass := ((aContext == nil ifTrue: [receiver] ifFalse: [aContext receiver]) class).
	methodNode := self
		compileCue: (CompilationCue
			source: textOrStream
			context: aContext
			receiver: receiver
			class: theClass
			environment: theClass environment
			requestor: aRequestor)
		noPattern: true
		ifFail: failBlock.
	
	 analyzedMethod := TiSystem current compiler analyzeMethod: methodNode.
	
	^	analyzedMethod makeConnections; seedArguments: (Array with: receiver concreteType)
