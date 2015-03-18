private-accessing
selectedEntry

	^ self listMorph hasSubmorphs
		ifTrue: [(self listMorph submorphs at: self selectIndex) entry value]
		ifFalse: []