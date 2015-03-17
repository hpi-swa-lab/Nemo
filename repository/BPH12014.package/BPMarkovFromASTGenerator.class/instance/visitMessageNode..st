as yet unclassified
visitMessageNode: aNode
	| selector |
	selector := aNode selectorOfMyReceiver.
	"Transcript cr; show: aNode selector , '->' , selector , '->' , (aNode receiver isMessage ifTrue: [aNode receiver selectorOfMyReceiver] ifFalse: '')."
	selector ifNotNil: [self addSelector: selector followedBy: aNode selector].
	super visitMessageNode: aNode