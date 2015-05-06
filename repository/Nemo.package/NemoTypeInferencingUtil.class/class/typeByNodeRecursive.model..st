type inferencing
typeByNodeRecursive: aProgramNode model: aModel

	| receiverNode selector |
	(aProgramNode notNil and: [ aProgramNode isMessage ]) ifTrue: [ | receiver mr |
		receiverNode := aProgramNode receiver.
		receiverNode isVariable
			ifTrue: [
				receiver := self valueByBinding: receiverNode token value for: aModel.
				receiver ifNil: [
					receiver := Smalltalk at: receiverNode token value asSymbol ifAbsent: [] ] ]
			ifFalse: [
				receiver := self typeByNodeRecursive: receiverNode model: aModel ].
		receiver ifNotNil: [
			selector := aProgramNode selector.
			(selector includes: $:) ifTrue: [ ^ nil ].
			mr := NemoClassUtil methodReferenceOnClassOrSuper: receiver class for: selector.
			mr ifNotNil:
				[ (NemoSideEffectDetector isSideEffecting: mr)
					ifTrue: [ ^ OSProcess isUnix ifTrue: [ NemoRemoteMethodEvaluator call: mr forkedOn: receiver ] ifFalse: [] ]
					ifFalse: [ | result |
						result := receiver withArgs: #() executeMethod: mr compiledMethod.
						^ result ] ] ] ].
	^ nil