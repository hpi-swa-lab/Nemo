as yet unclassified
display: aString inParent: aParentMorph with: aActionListener do: anActionSelector onEnterAction: aBlock
	^ self new
		parent: aParentMorph;
		actionListener: aActionListener;
		enterAction: aBlock;
		actionSelector: anActionSelector;
		initializeContents: aString;
		yourself