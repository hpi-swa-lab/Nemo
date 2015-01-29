private-processing
process

	| results setterStrings |
	results := OrderedCollection new.
	setterStrings := self methodSetterSelectorList collect: [ :setter | self variableName , ' ' , setter ].
	self classesContainingSelector
		ifEmpty: [
			setterStrings do: [ :s | self classesUnderstandingSelector
							do: [ :name | results add: s , ' ' , name , ' ' , self methodSelector ] ] ]
		ifNotEmpty: [
			setterStrings do: [ :s | self classesContainingSelector
							do: [ :name | results add: s , ' ' , name , ' new' ] ]	].
	self results: results