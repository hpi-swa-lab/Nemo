private-selection
navigateArrow: anArrowCharacter

	anArrowCharacter = Character arrowDown ifTrue: [ self selectNext. ].
	anArrowCharacter = Character arrowUp ifTrue: [ self selectPrevious. ].