as yet unclassified
openFancyUi: aKeyboardEvent
	
	| fancyUIMorph |
	fancyUIMorph := ((FancyUserInput
		display: (self hasSelection ifTrue: [self selection] ifFalse: [''])
		inParent: self morph
		with: self
		do: #resultSelected:
		onEnterAction: [:input | 
			self generateSuggestions: input])
		onCloseAction: [self onCloseFancyUI.]; open).

	fancyUIMorph position: self positionForPopUp.
	self morph addMorphFront: fancyUIMorph.
	ActiveHand newKeyboardFocus: fancyUIMorph textMorph.
	^ true