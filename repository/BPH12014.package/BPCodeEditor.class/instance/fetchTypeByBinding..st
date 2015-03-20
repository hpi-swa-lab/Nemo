as yet unclassified
fetchTypeByBinding: aString
	(self model class canUnderstand: #hasBindingOf:) ifTrue: [
		(self model hasBindingOf: aString) ifTrue: [
			^ BPGuessedType
				type: (self model bindingOf: aString) value class
				guessedFrom: #bindings ]].
	^ nil