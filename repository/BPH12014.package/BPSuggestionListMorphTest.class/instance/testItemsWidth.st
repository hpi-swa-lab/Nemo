testing
testItemsWidth

	self morph submorphs do: [ :aSubMorph |
		self assert: self morph width -  (2 * 0 "padding") equals: aSubMorph width. 
	].