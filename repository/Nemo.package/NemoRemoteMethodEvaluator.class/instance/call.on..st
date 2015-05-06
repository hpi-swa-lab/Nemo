local
call: aMethodReference on: aReceiver
	aMethodReference compiledMethod numArgs isZero ifTrue: [ | result |
		result := aReceiver withArgs: #() executeMethod: aMethodReference compiledMethod.
		^ result ].
	^ nil