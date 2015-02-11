selection
updateSelectIndex: newSelectIndex

	self selectIndex: newSelectIndex.
	self listMorph submorphs doWithIndex: [ :anItemMorph :index |
		newSelectIndex = index
			ifTrue: [ anItemMorph select. ]
			ifFalse: [ anItemMorph deselect. ].
	].