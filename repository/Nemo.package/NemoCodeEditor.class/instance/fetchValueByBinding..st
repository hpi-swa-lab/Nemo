as yet unclassified
fetchValueByBinding: aString
	(self model class canUnderstand: #hasBindingOf:) ifTrue: [
		(self model hasBindingOf: aString) ifTrue: [
			^ (self model bindingOf: aString) value ]].
	^ nil