as yet unclassified
filterBy: aString limit: anInteger

	| filteredCollection |
	filteredCollection := self filterByContaining: aString limit: anInteger.
	self filterByRegexing: aString limit: anInteger enriching: filteredCollection.
	^ filteredCollection