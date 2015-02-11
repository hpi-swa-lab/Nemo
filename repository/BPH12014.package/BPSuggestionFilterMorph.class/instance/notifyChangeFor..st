private-event-handling
notifyChangeFor: aString

	self onChange ifNotNilDo: [ :aBlock | aBlock value: aString ].