filtering
filterBy: aString limit: anInteger

	| filteredCollection |
	aString ifEmpty: [ ^ self entries copyFrom: 1 to: (anInteger min: self entries size) ].
	filteredCollection := self filterByStartingWith: aString limit: anInteger.
	self filterByContaining: aString limit: anInteger enriching: filteredCollection.
	self filterByRegexing: aString limit: anInteger enriching: filteredCollection.
	^ filteredCollection