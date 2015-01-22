as yet unclassified
layout: aMorph in: box

	| currentTop |
	currentTop := aMorph top.
	aMorph submorphsDo: [ :aSubMorph |
		aSubMorph width: aMorph width.
		aSubMorph top: currentTop.
		aSubMorph left: aMorph left.
		aSubMorph fullBounds.
		currentTop := currentTop + aSubMorph height.
	].
	aMorph height: currentTop - aMorph top.