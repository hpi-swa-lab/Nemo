as yet unclassified
layout: aMorph in: box

	| currentTop |
	currentTop := aMorph top + self padding.
	aMorph submorphsDo: [ :aSubMorph |
		aSubMorph width: aMorph width - (self padding * 2).
		aSubMorph top: currentTop.
		aSubMorph left: aMorph left + self padding.
		aSubMorph fullBounds.
		currentTop := currentTop + aSubMorph height.
	].
	aMorph height: currentTop - aMorph top + self padding.