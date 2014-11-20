as yet unclassified
runBlock: aHashString without: aLayerNameString withArguments: aCollection

	aLayerNameString asSymbol withoutLayerDo: [ | interceptionBlock |
		interceptionBlock := self interceptionBlocks at: aHashString.
		interceptionBlock argumentCount > 0 ifTrue: [
			interceptionBlock value: aCollection.
		] ifFalse: [
			interceptionBlock value.
		].
	].