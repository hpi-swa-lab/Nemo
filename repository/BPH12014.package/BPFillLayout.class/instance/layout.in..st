as yet unclassified
layout: aMorph in: box

	aMorph submorphsDo: [ :aSubMorph |
		aSubMorph width: aMorph width.
	].
	aMorph submorphs size = 1 ifTrue: [aMorph submorphs first height: aMorph height].