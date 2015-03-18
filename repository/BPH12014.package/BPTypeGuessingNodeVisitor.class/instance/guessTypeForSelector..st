as yet unclassified
guessTypeForSelector: aSelector

	| superClassOfAllImplementors |
	superClassOfAllImplementors := (BPClassUtil commonSuperClassOf: ((SystemNavigation allImplementorsOf: aSelector)
		collect: [ :aMethodReference | aMethodReference actualClass ])).
	(superClassOfAllImplementors isNil not and: [ superClassOfAllImplementors canUnderstand: aSelector ])
		ifTrue: [ self guessedType: superClassOfAllImplementors. ].