private-accessing
selectedEntry

	^ (self listMorph hasSubmorphs and: [self listMorph submorphCount >= self selectIndex])
		ifTrue: [(self listMorph submorphs at: self selectIndex) entry value]
		ifFalse: []