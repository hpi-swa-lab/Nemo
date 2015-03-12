accessing
typeSet
	typeSet isNil ifTrue: [typeSet := Set new: 2].
	^ typeSet