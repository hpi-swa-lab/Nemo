remote
evaluateForked: aCodeString notifying: anEditor
	
	^ self
		evaluateTypeForked: [ Compiler evaluate: aCodeString notifying: anEditor ]
		notifying: anEditor
	