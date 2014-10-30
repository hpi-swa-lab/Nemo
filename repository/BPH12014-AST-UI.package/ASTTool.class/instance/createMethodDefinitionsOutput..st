actions
createMethodDefinitionsOutput: aClassName
	| methodDefinitions result class |
	methodDefinitions  := Dictionary new.
	class := self cleanInput: aClassName.
	class ifNil: [^ ''].
	class withAllSubclasses do: [ :eaClass |
		eaClass methodDict keys do: [ :key |
			methodDefinitions at: key put: (methodDefinitions at: key ifAbsentPut: 0) + 1
		]
	].

	result := OrderedCollection new.
	methodDefinitions associationsDo: [ :ea |
		result add: {ea key. ea value}
	].
	result sort: [ :a :b | a second > b second ].

	^ self formatOutput: result