as yet unclassified
layout: aMorph in: box

	aMorph submorphsDo: [ :aSubMorph |
		aSubMorph width: aMorph width - (self padding * 2).
		aSubMorph left: aMorph left + self padding.
	].
	aMorph submorphs size = 1 ifTrue: [
		aMorph submorphs first height: aMorph height - (self padding * 2).
		aMorph submorphs first top: aMorph top + self padding.
	].