testing
testItemsWidth

	self morph submorphs do: [ :aSubMorph |
		self assert: self morph width -  (2 * 5) equals: aSubMorph width. "padding"
	].