as yet unclassified
runBlock: aHashString without: aLayerNameString

	aLayerNameString asSymbol withoutLayerDo: [
		self interceptionBlocks at: aHashString.
	] value.