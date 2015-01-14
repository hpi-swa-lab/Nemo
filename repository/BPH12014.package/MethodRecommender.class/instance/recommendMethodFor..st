actions
recommendMethodFor: anInstanceString
	| index tempValue methods |
	methods := OrderedCollection new.
	index := self context tempNames indexOf: anInstanceString ifAbsent: [^ methods].	
	tempValue := self context tempAt: index.
	tempValue class withAllSuperclassesDo: [ :eaClass |
		eaClass methodDict valuesDo: [ :compiledMethod |
			methods add: eaClass asString , '>>#', compiledMethod selector asString
		]
	].

	^ methods