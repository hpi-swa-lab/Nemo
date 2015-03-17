as yet unclassified
weakBlockTest: aMorph
	aMorph openInWorld.
	OrderedCollection new select: [ :x | x = aMorph ].
	^ aMorph