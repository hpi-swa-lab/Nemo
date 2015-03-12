as yet unclassified
visitMessageNode: aNode
	| selector |
	selector := aNode selectorOfMyReceiver.
	selector ifNotNil: [self addSelector: selector followedBy: aNode selector].
	super visitMessageNode: aNode