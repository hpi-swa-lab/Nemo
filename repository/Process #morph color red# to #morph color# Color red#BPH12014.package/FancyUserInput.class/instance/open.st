as yet unclassified
open

	fancyUI := (SimpleMorphicToolBuilder new open: self).
	fancyUI textMorph on: #keyStroke send: #fancyKeyStroke: to: self.
	^ fancyUI 
		setProperty: #alwaysAccept toValue: true;
		extent: 200@20;
		yourself