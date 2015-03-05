as yet unclassified
layout: aMorph in: aBox

	| curLeft allWidth |
	curLeft := 0.
	allWidth := 0.
	aMorph submorphs do: [ :aSubMorph |
		self fillVertical ifTrue: [ aSubMorph height: aMorph height. ].
		aSubMorph left: curLeft + aMorph left.
		curLeft := curLeft + aSubMorph width.
		allWidth := allWidth + aSubMorph width.
	].
	aMorph width: allWidth.