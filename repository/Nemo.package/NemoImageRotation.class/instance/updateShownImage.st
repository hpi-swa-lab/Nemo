as yet unclassified
updateShownImage

		self submorphs size > 0 ifTrue: [ self submorphs first delete ].
		self addMorph: (self imageMorphs at: self currentIndex).