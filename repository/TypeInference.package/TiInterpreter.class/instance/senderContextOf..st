accessing stack
senderContextOf: anlyzedMethod
	| amIdx |
	amIdx := analyzedMethodStack indexOf: anlyzedMethod.
	(amIdx = 0 and: (analyzedMethodStack size > 0) )ifTrue:[ ^analyzedMethodStack last].
	(amIdx = 1 or: (amIdx = 0)) ifTrue:[ ^nil ].
	^analyzedMethodStack at: amIdx - 1.
	