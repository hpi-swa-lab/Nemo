filtering
filterByStartingWith: aString limit: anInteger

	| filteredCollection |
	filteredCollection := OrderedCollection new.
	self filterByStartingWith: aString limit: anInteger enriching: filteredCollection.
	^ filteredCollection