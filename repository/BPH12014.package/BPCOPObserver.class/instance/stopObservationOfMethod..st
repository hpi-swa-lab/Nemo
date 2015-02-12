as yet unclassified
stopObservationOfMethod: aMethodReference

	| layeredMethod |
	layeredMethod := aMethodReference actualClass lookupSelector: aMethodReference methodSymbol.
	layeredMethod removePartialMethod: (layeredMethod partialMethodFor: self layerName).