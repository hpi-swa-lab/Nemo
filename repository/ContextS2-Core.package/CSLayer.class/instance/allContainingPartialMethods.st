queries
allContainingPartialMethods
	
	| result |
	result := OrderedCollection new.
	self allContainingLayeredMethods
		do: [ :layeredMethod |
			result addAll:
				(layeredMethod partialMethods
					select: [ :partialMethod | partialMethod layers includes: self layerName ]) ].
	^ result