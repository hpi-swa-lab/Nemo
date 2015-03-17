as yet unclassified
typeFromBinding: aString
	(self model class canUnderstand: #bindingOf:) ifTrue: [
		(self model hasBindingOf: aString) ifTrue: [
			^ (self model bindingOf: aString) value class]].
	^ nil