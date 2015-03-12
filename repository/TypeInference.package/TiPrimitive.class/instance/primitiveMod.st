arithmetic primitives
primitiveMod
	(self generalizedMatchOrFail: {{Number. Float} . {Float . Number} }) ifNotNil: [ ^self createResult addReturn: Float createType ].
	(self generalizedMatchOrFail: {{Number. Number} }) ifNotNil: [ ^self createResult addReturn: receiver ].
	^nil.