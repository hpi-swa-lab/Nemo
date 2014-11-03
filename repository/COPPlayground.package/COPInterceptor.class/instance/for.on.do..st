as yet unclassified
for: aMethodSymbol on: aClass do: aBlock

	self interceptionBlockHashes add: aBlock hash.
	self interceptions add: (
		Dictionary new
			at: 'method' put: aMethodSymbol;
			at: 'class' put: aClass;
			at: 'do' put: aBlock;
			yourself
	).