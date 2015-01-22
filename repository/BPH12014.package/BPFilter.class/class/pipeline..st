as yet unclassified
pipeline: aCollectionOfFilters

	| lastFilter |
	lastFilter := nil.
	aCollectionOfFilters do: [ :aFilter |
		lastFilter ifNotNil: [lastFilter pipeTo: aFilter].
		lastFilter := aFilter.
	].
	^aCollectionOfFilters first