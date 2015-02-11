private-event-handling
textMorphKeyStroke: aKeyboardEvent
	
	aKeyboardEvent keyValue = Character escape asciiValue ifTrue: [
		self onEscape ifNotNilDo: [ :onEscapeBlock | onEscapeBlock value].
	].

	aKeyboardEvent keyValue = Character cr asciiValue ifTrue: [
		self onEnter ifNotNilDo: [ :onEnterBlock |
			onEnterBlock value.
			false.
		].
	].

	((aKeyboardEvent keyValue = Character arrowDown asciiValue)
	or: (aKeyboardEvent keyValue = Character arrowUp asciiValue)
	or: (aKeyboardEvent keyValue = Character arrowLeft asciiValue)
	or: (aKeyboardEvent keyValue = Character arrowRight asciiValue)) ifTrue: [
		self onArrow ifNotNilDo: [ :onArrowBlock | onArrowBlock value: (Character value: aKeyboardEvent keyValue)].
	].