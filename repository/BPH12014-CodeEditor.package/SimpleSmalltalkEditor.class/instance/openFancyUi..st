as yet unclassified
openFancyUi: aKeyboardEvent
	
	| fancyUIMorph |
	fancyUIMorph := ((FancyUserInput
		display: (self hasSelection ifTrue: [self selection] ifFalse: [''])
		with: self
		do: #resultSelected:
		onEnterAction: [:input | 
			self findMessagesAndFormatResult: input]) open).

	fancyUIMorph position: self positionForPopUp.
	self morph addMorphFront: fancyUIMorph.
	ActiveHand newKeyboardFocus: fancyUIMorph.
	^ true