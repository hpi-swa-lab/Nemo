remote
evaluateTypeForked: aCodeString notifying: anEditor context: aContext receiver: aReceiver

	^ self
		evaluateBlockForked: [ 
			(Compiler new
				evaluate: aCodeString
				in: aContext
				to: aReceiver
				notifying: anEditor
				ifFail: [^ nil]) class name ]
		notifying: anEditor
	