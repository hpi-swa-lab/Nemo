type inferencing
valueByBinding: aString for: aModel
	(aModel class canUnderstand: #hasBindingOf:) ifTrue: [
		(aModel hasBindingOf: aString) ifTrue: [
			^ (aModel bindingOf: aString) value ]].
	^ nil