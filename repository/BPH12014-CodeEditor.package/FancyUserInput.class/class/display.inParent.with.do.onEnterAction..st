as yet unclassified
display: aString inParent: aParent with: aActionListener do: anActionSelector onEnterAction: aBlock
	^ self new
		parent: aParent;
		actionListener: aActionListener;
		enterAction: aBlock;
		actionSelector: anActionSelector;
		initializeContents: aString;
		yourself