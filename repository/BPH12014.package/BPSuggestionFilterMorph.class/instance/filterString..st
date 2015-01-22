as yet unclassified
filterString: aString

	self textMorph contents: aString.
	self onChange ifNotNilDo: [ :aBlock | aBlock value: aString ].