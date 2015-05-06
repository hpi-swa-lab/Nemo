filtering
methodReferenceOnClassOrSuper: aClass for: aSelector

	| currentClass |
	currentClass := aClass.
	[ currentClass methodDict includesKey: aSelector ] whileFalse: [
		currentClass := currentClass superclass.
		currentClass ifNil: [ ^ nil ] ].
	^ MethodReference class: currentClass selector: aSelector