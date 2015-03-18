as yet unclassified
fetchTypeByBinding: aString
	(self model class canUnderstand: #hasBindingOf:) ifTrue: [
		(self model hasBindingOf: aString) ifTrue: [
			^ (self model bindingOf: aString) value class]].
	^ nil