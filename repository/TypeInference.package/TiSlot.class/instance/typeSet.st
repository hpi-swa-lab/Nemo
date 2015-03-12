accessing
typeSet
	self debugSender.
	typeSet isNil ifTrue: [typeSet := Set new: 2].
	^ typeSet