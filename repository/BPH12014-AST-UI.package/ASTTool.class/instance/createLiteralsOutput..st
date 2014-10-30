actions
createLiteralsOutput: aClassName
	| literals literalsResult class |
	literals := Dictionary new.
	class := self cleanInput: aClassName.
	class ifNil: [^ ''].
	class withAllSubclasses do: [ :eaClass |
		eaClass methodDict valuesDo: [ :compiledMethod |
			compiledMethod literalsDo: [ :literal | 
				literals at: literal put: (literals at: literal ifAbsentPut: 0) + 1
			]
		]
	].

	literalsResult := OrderedCollection new.
	literals associationsDo: [ :ea |
		literalsResult add:  {ea key. ea value}
	].
	literalsResult sort: [ :a :b | a second > b second ].

	^ self formatOutput: literalsResult