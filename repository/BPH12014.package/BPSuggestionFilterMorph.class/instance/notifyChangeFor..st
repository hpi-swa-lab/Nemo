as yet unclassified
notifyChangeFor: aString

	self onChange ifNotNilDo: [ :aBlock | aBlock value: aString ].