as yet unclassified
fetchTypeByNodeRecursive: aProgramNode "aProgramNode := RBMessageNode new"

	| receiverNode selector |
	(aProgramNode notNil and: [ aProgramNode isMessage ]) ifTrue: [ | receiver mr |
		receiverNode := aProgramNode receiver.
		receiverNode isVariable
			ifTrue: [
				receiver := self fetchValueByBinding: receiverNode token value.
				receiver ifNil: [
					receiver := Smalltalk at: receiverNode token value asSymbol ifAbsent: [] ] ]
			ifFalse: [
				receiver := self fetchTypeByNodeRecursive: receiverNode ].
		receiver ifNotNil: [
			selector := aProgramNode selector.
			(selector includes: $:) ifTrue: [ ^ nil ].
			mr := NemoClassUtil methodReferenceOnClassOrSuper: receiver class for: selector.
			(NemoSideEffectDetector isSideEffecting: mr)
				ifTrue: [ ^ OSProcess isUnix ifTrue: [ NemoRemoteMethodEvaluator call: mr forkedOn: receiver ] ifFalse: [] ]
				ifFalse: [ | result |
					result := receiver withArgs: #() executeMethod: mr compiledMethod.
					^ result ] ] ].
	^ nil