private-selection
navigateArrow: anArrowCharacter

	anArrowCharacter = Character arrowDown ifTrue: [ self selectNext. ].
	anArrowCharacter = Character arrowUp ifTrue: [ self selectPrevious. ].
	anArrowCharacter = Character arrowRight ifTrue: [ self onNavigateRIght ifNotNilDo: [ :onNavigateRightBlock | onNavigateRightBlock value. ] ].