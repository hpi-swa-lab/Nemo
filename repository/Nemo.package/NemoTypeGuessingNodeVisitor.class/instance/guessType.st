private
guessType

	| classesThatUnderstandAllSelectors commonSuperClassOfAllImplementors |
	classesThatUnderstandAllSelectors := nil.
	self selectors ifEmpty: [ ^ nil ].
	self selectors do: [ :selector | | classesThatUnderstandSelector |
		classesThatUnderstandSelector := ((SystemNavigation allImplementorsOf: selector)
			collect: [ :aMethodReference | aMethodReference actualClass allSubclasses copyWith: aMethodReference actualClass ]) flatten.
		classesThatUnderstandAllSelectors
			ifNil: [ classesThatUnderstandAllSelectors := classesThatUnderstandSelector ]
			ifNotNil: [ classesThatUnderstandAllSelectors := classesThatUnderstandAllSelectors intersection: classesThatUnderstandSelector ] ].
	commonSuperClassOfAllImplementors := NemoClassUtil commonSuperClassOf: classesThatUnderstandAllSelectors.
	commonSuperClassOfAllImplementors ifNil: [ ^ nil ].
	(self selectors allSatisfy: [ :selector | commonSuperClassOfAllImplementors canUnderstand: selector ])
		ifTrue: [ ^ commonSuperClassOfAllImplementors ]
		ifFalse: [ ^ nil ].