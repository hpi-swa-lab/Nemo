markov
testPrefix: anOrderedCollection of: anotherOrderedCollection

	^(anOrderedCollection size <= anotherOrderedCollection size) and: [
		(1 to: (anOrderedCollection size)) do: [:index |
			((anOrderedCollection at: index) == (anotherOrderedCollection at: index)) ifFalse: [^false]].
		true]
		