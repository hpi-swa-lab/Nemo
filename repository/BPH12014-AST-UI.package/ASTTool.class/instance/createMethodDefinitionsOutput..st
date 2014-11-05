actions
createMethodDefinitionsOutput: aClassName
	| methodDefinitions result class |
	methodDefinitions  := Bag new.
	class := self cleanInput: aClassName.
	class ifNil: [^ ''].
	class withAllSubclassesDo: [ :eaClass |
		eaClass methodDict keysDo: [ :key |
			methodDefinitions add: key
		]
	].

	^ self formatOutput: methodDefinitions sortedCounts