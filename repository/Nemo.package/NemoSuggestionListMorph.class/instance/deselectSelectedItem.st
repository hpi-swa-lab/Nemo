selection
deselectSelectedItem

	self listMorph submorphs size >= self selectIndex ifTrue: [
		(self listMorph submorphs at: self selectIndex) deselect.
	].