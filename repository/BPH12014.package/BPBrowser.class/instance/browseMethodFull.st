browsing
browseMethodFull
	"Create and schedule a full Browser and then select the current class and message."
	^ self selectedClassOrMetaClass ifNotNil: [ :cls |
		self selectedMessageName
			ifNotNil: [ :sel |
				self class open setClass: cls selector: sel]
			ifNil: [self class open setClass: cls selector: nil]].