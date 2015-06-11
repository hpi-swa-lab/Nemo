remote
evaluateTypeForked: aCodeString notifying: anEditor

	^ self
		evaluateBlockForked: [ (Compiler evaluate: aCodeString notifying: anEditor) class name ]
		notifying: anEditor
	