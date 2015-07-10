filtering
filterByContaining: aString limit: anInteger

	| filteredCollection |
	filteredCollection := OrderedCollection new.
	self filterByContaining: aString limit: anInteger enriching: filteredCollection.
	^ filteredCollection