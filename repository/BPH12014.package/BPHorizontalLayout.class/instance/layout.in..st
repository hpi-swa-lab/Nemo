as yet unclassified
layout: aMorph in: aBox

	| curLeft |
	curLeft := 0.
	aMorph submorphs do: [ :aSubMorph |
		self fillVertical ifTrue: [ aSubMorph height: aMorph height. ].
		aSubMorph left: curLeft + aMorph left.
		curLeft := curLeft + aSubMorph width.
	].