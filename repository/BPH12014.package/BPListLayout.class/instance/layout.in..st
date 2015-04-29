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
	aMorph class = BPSuggestionListMorph ifTrue: [
			FileStream stdout nextPutAll: self fillLast asString.
		].
	self fillLast
			ifTrue: [
					aMorph submorphs last height: aMorph top + aMorph height - (currentTop - aMorph submorphs last height)].
				