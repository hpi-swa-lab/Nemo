as yet unclassified
for: aMorph on: anEventSymbol do: aBlock

	((self dictionary at: aMorph ifAbsentPut: [ Dictionary new ])
		at: anEventSymbol ifAbsentPut: [ OrderedCollection new ])
			add: aBlock.