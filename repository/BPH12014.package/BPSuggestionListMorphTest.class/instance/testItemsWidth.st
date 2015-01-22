testing
testItemsWidth

	self morph submorphs do: [ :aSubMorph |
		self assert: self morph width equals: aSubMorph width.
	].