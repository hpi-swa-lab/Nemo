as yet unclassified
removePartialMethod: aMethodSymbol on: aClass

	| layeredMethod |
	layeredMethod := aClass lookupSelector: aMethodSymbol.
	layeredMethod removePartialMethod: (layeredMethod partialMethodFor: self layerName).