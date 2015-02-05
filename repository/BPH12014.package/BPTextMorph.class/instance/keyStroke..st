as yet unclassified
keyStroke: anEvent

	super keyStroke: anEvent.
	self textChangedHandler ifNotNilDo: [:aBlock | aBlock value: self contents asString.].