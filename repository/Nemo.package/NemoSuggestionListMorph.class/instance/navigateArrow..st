private-selection
navigateArrow: anArrowCharacter

	anArrowCharacter = Character arrowDown ifTrue: [
		self selectNext.
		self emit: #navigateDown ].
	anArrowCharacter = Character arrowUp ifTrue: [
		self selectPrevious.
		self emit: #navigateUp ].
	anArrowCharacter = Character arrowRight ifTrue: [ self emit: #navigateRight ].