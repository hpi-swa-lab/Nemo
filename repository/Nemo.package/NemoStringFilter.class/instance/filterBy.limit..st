filtering
filterBy: aString limit: anInteger

	| filteredCollection |
	aString ifEmpty: [ ^ self entries copyFrom: 1 to: (anInteger min: self entries size) ].
	filteredCollection := OrderedCollection new.
	(aString includes: Character space)
		ifTrue: [
			self filterByPermutationMatches: aString limit: anInteger enriching: filteredCollection ]
		ifFalse: [
			self filterByStartingWith: aString limit: anInteger enriching: filteredCollection.
			self filterByContaining: aString limit: anInteger enriching: filteredCollection.
			self filterByRegexing: aString limit: anInteger enriching: filteredCollection ].
	^ filteredCollection