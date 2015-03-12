accessing stack
detectRecursion
	| start index current selector |
	start := 1.
	current := selectorStack size.
	selector := selectorStack at: current.
	[start < current]  whileTrue: [
		index := selectorStack indexOf: selector startingAt: start ifAbsent: [
			^ false
		].
		index = current ifTrue: [
			^ false
		] ifFalse: [
			( 
				(argumentsStack at: index) = (argumentsStack at: current)  and: [
					(analyzedMethodStack at: index) = (analyzedMethodStack at: current) and: [ 
						(self isAFakeRecursion: index and: current) not.
					]
				] 
			
			) ifTrue: [
				^ true
			] ifFalse: [
				start := index + 1
			]
		]
	].
	^ false
