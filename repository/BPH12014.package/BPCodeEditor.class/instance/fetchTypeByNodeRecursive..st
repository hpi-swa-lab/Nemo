as yet unclassified
fetchTypeByNodeRecursive: aProgramNode "aProgramNode := RBMessageNode new"

	| receiver selector |
	(aProgramNode notNil and: [ aProgramNode isMessage ]) ifTrue: [ | type mr |
		receiver := aProgramNode receiver.
		receiver isVariable
			ifTrue: [
				type := Smalltalk at: receiver token value asSymbol ifAbsent: [ ^ nil ].
				type := type class ]
			ifFalse: [
				type := self fetchTypeByNodeRecursive: receiver ].
		type ifNotNil: [
			selector := aProgramNode selector.
			(selector includes: $:) ifTrue: [ ^ nil ].
			mr := BPClassUtil methodReferenceOnClassOrSuper: type for: selector.
			(BPSideEffectDetector isSideEffecting: mr)
				ifFalse: [ | result |
					result := receiver withArgs: #() executeMethod: mr compiledMethod.
					^ result class ] ] ].
	^ nil