as yet unclassified
display: aString with: aActionListener do: anActionSelector onEnterAction: aBlock
	^ self new
		actionListener: aActionListener;
		enterAction: aBlock;
		actionSelector: anActionSelector;
		initializeContents: aString;
		yourself