as yet unclassified
contents: aText
	| menu results |
	super contents: aText.
	self dependents first delete.

	results := self enterAction value: aText asString.

	menu := MenuMorph new.
	menu defaultTarget: self actionListener.
	results do: [ :result | menu add: result selector: self actionSelector argument: result].
	menu popUpAt: self fancyUI textMorph editor positionForPopUp forHand: self currentWorld primaryHand primaryHand in: self currentWorld.
