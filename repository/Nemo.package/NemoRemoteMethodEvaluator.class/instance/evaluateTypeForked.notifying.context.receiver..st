remote
evaluateTypeForked: aCodeString notifying: anEditor context: aContext receiver: aReceiver
	| block evaluationString |
	evaluationString := aCodeString.
	self class forkHeadless
		ifFalse: [ evaluationString := 'Halt signal: ''Automatically inserted halt before code evaluation''. ' , evaluationString ].
	block := [ 
		(Compiler new
			evaluate: evaluationString
			in: aContext
			to: aReceiver
			notifying: anEditor
			ifFail: [ ^ nil ]) ifNotNil: [:result | result class name ] ].
	^ self
		evaluateBlockForked: block
		timeout: (self class forkHeadless
			ifTrue: [ self class forkingTimeout ]
			ifFalse: [ self class forkingTimeoutDebug ])